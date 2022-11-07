-- entrando no banco
use oficina_mecanica_1;

-- visualizando todas as tabelas do banco
show tables;

-- Existem quantos clientes cadastrados?
select count(*) from clients;

-- Existem quantos mecânicos cadastrados?
select count(*) from mechanics;


-- Em que andamento está o serviço do cliente e qual é a descrição
select * from clients c, requests r where c.idClient = r.idRequestClient;

select concat(Fname,' ',Lname) as Name, r.Rdescription as Description, r.Rstatus as Status 
from clients c, requests r 
where c.idClient = r.idRequestClient;

-- Qual mecânico está executando o serviço, de qual cliente?
select concat(c.Fname, ' ', c.Lname) as Client,  r.Rdescription as Description ,  m.Fname as Mechanic
from clients c, requests r, mechanics m
where idRequestClient = idClient
and r.Rmechanic_service = m.idMechanic;

SELECT concat(c.Fname, ' ', c.Lname) as Client,  r.Rdescription as Description ,  m.Fname as Mechanic
FROM clients c 
	INNER JOIN requests r
		ON r.idRequestClient = c.idClient
	INNER JOIN mechanics m
		ON r.Rmechanic_service = m.idMechanic;


select Idclient, Idrequest, count(*)
from clients c, requests r
where c.Idclient = r.idRequestClient
group by Idclient, Idrequest
having count(*) < 2;


