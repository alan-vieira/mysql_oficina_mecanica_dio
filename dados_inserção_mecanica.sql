-- entrando no banco
use oficina_mecanica_1;

-- exibindo as tabelas
show tables;

--
-- inserindo os dados
--

-- tabela clientes
select * from clients;
-- idClient, Fname, Minit, Lname, CPF, Address, Phone, Email
insert into clients (Fname, Minit, Lname, CPF, Address, Phone, Email) 
	   values('Caleb','M V','Souza', 61381649700,'Rua Laércio Xavier de Mendonça 918, Jóquei Clube - São Gonçalo','21981909344', 'caleb.marcos.souza@carvajal.com'),
		     ('Thomas','C','Moreira', 41358122792,'Rua Oliveira Marins 646, Itaúna - São Gonçalo', '21997518202','thomas_claudio_moreira@tecnew.net'),
			 ('Daniela','F M','Baptista', 02967288705,'Rodovia Amaral Peixoto 260, Tribobó - São Gonçalo', '21986029437', 'daniela-baptista77@operaconstrutora.com.br'),
			 ('Giovanni','B N','Costa', 28611058798,'Rua Franco Sá 822, Rio do Ouro - São Gonçalo','21985483110', 'giovanni_breno_costa@vitalliimoveis.com'),
			 ('Rosângela','L','da Paz', 76086203741,'Rua Expedicionário Aldemir Dias Santos 347, Arsenal - São Gonçalo','21982215281', 'rosangela-dapaz96@splicenet.com.br'),
			 ('Tatiane','E C','da Oliveira', 64992949770,'Rua Ituverava 955, Monjolos - São Gonçalo','21997158137', 'tatiane_oliveira@deskprint.com.br');
             
-- tabela mecânicos
select * from mechanics;
-- idMechanic, Fname, Minit, Lname, CPF, Speciality, Address, Phone, Email     
insert into mechanics (Fname, Minit, Lname, CPF, Speciality, Address, Phone, Email)
	   values('Helena', 'E T', 'Brito', 74479062718, 'Concerto de Motores', 'Rua Mediterrâneo 414, Itaoca - São Gonçalo', 21997211772, 'helena-brito82@jonhdeere.com'),
			 ('Julio', 'C B', 'das Neves', 65263546700, 'Concerto de Caixa de Marchas', 'Rua Expedicionário Tenório Leão 156, Porto do Rosa - São Gonçalo', 21988011681, 'julio-dasneves71@jonhdeere.com'),
             ('Bruno','E H','da Rocha', 72520337753, 'Alinhamento de Carroceria','Travessa Rúbens Orlandini 577, Covanca - São Gonçalo', 21985222164, 'bruno_darocha@jonhdeere.com'),
             ('Isabela', 'E', 'Gonçalves', 67012440767, 'Concerto de Motores', 'Rua Expedicionário João Pereira da Silva 112, Guaxindiba - São Gonçalo', 21984102983, 'isabelaeduardagoncalves@jonhdeere.com');
             
-- tabela pedidos
select * from requests;         
-- idRequest, idRequestClient, Rtype_service, Rdescription, Rstatus, Rmechanic_analyzes, Rmechanic_service, Rdate
insert into requests (idRequestClient, Rtype_service, Rdescription, Rstatus, Rmechanic_analyzes, Rmechanic_service, Rdate)
	   values(1, 'Reparo', 'Trocar óleo da caixa de marchas', 'Em análise', 2, null,'2022-11-02'),
             (2, 'Reparo', 'Troca de velas', 'Em execução', 1, 1, '2022-11-02'),
             (3, 'Revisão', 'Revisão geral', 'Em execução', 3,3, '2022-11-02'),
             (4, 'Reparo', 'Dercarbonização', 'Em análise', 4,4, '2022-11-02'),
             (5, 'Reparo', 'Troca de correia do motor', 'Liberado', 4,4, '2022-11-02');
             
-- tabela ordem de serviço
select * from service_order;    
-- idService_order, idSOrderRequest, Sdate, Stime, Sservice_price, Spart_price, Stotal_price, Sauthorization
insert into service_order(idSOrderRequest, Sdate, Stime, Sservice_price, Spart_price, Stotal_price, Sauthorization)
	   values(1, '2022-11-02', '3 horas', 500, 500, Sservice_price + Spart_price,true),
             (2, '2022-11-02', '2 horas', 250, 100, Sservice_price + Spart_price,true),
             (3, '2022-11-02', '4 horas', 300, 0, Sservice_price + Spart_price,true),
             (4, '2022-11-02', '3 horas', 1000, 500, Sservice_price + Spart_price, true),
             (5, '2022-11-02', '2 horas', 570, 200, Sservice_price + Spart_price, true);
             
-- tabela pagamento
select * from payments;     
-- idPayment, idPaymentSorder, typePayment, Pdate
insert into payments (idPaymentSorder, typePayment, Pdate)
	   value(1,'Crédito', '2022-11-02'),
			(2,'Débito', '2022-11-02'),
            (3,'Crédito', '2022-11-02'),
            (4,'Crédito', '2022-11-02'),
            (5,'Dinheiro', '2022-11-02');
            
-- tabelas relacionamento

select * from SorderMechanic;
-- idSMsorder, idSMmechanic, smStatus
insert into SorderMechanic (idSMsorder, idSMmechanic, smStatus)
	   value(1,2, 'Em espera'),
			(2,1, 'Em execução'),
            (3,3, 'Em execução'),
            (4,4, 'Em execução'),
            (5,4, 'Pronto');