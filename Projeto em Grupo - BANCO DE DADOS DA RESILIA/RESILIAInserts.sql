-- Feito por Lenilson
INSERT INTO aluno VALUES
(111,'Davi de Moraes Novaes',219484848,'dmoraes@mail.com','Rua Carminha Dutra, n. 500'),
(222,'Stephanie Ferreira Vale',219456565,'svale@mail.com','Rua Alfredo Raimundo, n. 650'),
(333,'Douglas Klem Portugal do Amaral',219837363,'dkamaral@mail.com','Rua Bigode Respeitoso, n.220'),
(444,'Márcio Lorenzo Alves',219837635,'mlorenzo@mail.com','Avenida Coronel Rodapé, n. 171'),
(555,'Matheus Augusto de Souza',219878787,'mathaugusto@mail.com','Rua José Alves Lima, n. 130'),
(666,'Lenilson dos Reis Barros',219047574,'lreis@mail.com','Estrada do Portela Nobre, n. 432');

--Feito pela Stephanie
INSERT INTO curso VALUES
(01,'Desenvolvimento Web','Noite'),
(02,'Ciência da Comunicação','Manhã'),
(03,'Informática','Tarde'),
(04,'Redes de Computadores','Noite'),
(05,'Automatização com DevOps','Noite'),
(06,'Sistemas de Informação','Tarde'),
(07,'Análise de Dados','Manhã'),
(08,'Excel Avançado','Tarde');

--Feito pelo Davi
INSERT INTO aluno_curso VALUES
(111,01,'435678',25),
(222,02,'4567',100),
(333,03,'234',100),
(444,04,'45567',75),
(555,08,'3444',45),
(555,07,'3476',88),
(666,05,'34566',95),
(111,05,'34533',00),
(222,01,'23455',65);

--Feito por Davi
INSERT INTO modulo VALUES
(1,'Python I',30,'SIM','NAO','NAO'),
(2,'SQL',20,'SIM','SIM','SIM'),
(3,'Soft Skills',70,'SIM','SIM','SIM'),
(4,'Lógica de Programação',10,'NAO','NAO','NAO'),
(5,'Google Collab',25,'SIM','SIM','NAO'),
(6,'Power BI',40,'SIM','SIM','SIM');

--Feito por Davi
INSERT INTO curso_modulo VALUES
(01,1),
(02,3),
(03,2),
(04,5),
(05,6),
(06,3),
(07,1),
(08,4);

--Feito por Matheus
INSERT INTO facilitador VALUES
(1, 'Thiago Leal', '21984638467', 'thiago@email.com', 'Rua das flores, n. 19',111),
(2, 'Edgard Simas', '11946458888', 'edgard@email.com', 'Av. Luiz Rosa, n. 255',112),
(3, 'Sofia Charlote', '12976238743', 'sofia@email.com', 'Rua Fernando Barbosa, n. 450',113),
(4, 'Fátima Souza', '21964738364', 'fatima@email.com', 'Av. Franco da Silva, n. 210',112),
(5, 'Bruna Marquelucia', '22984730293', 'bruna@email.com', 'Rua Nova York, n. 95',222),
(6, 'Fernando Torquatto', '22954368695', 'fernando@email.com', 'Estrada do Galeão, n. 1954',221),
(7, 'Larissa Manuelle', '21964539287', 'larissa@email.com', 'AV. Brigadeiro Fernando, n. 282',223),
(8, 'Monique Evandra', '21965836754', 'monique@email.com', 'Rua Professor Eduardo, n. 303',333),
(9, 'Lucas Meneguel', '21945463254', 'lucas@email.com', 'Alameda do Sol, n. 203',332),
(10, 'Manuela Marques', '21945472563', 'manuela@email.com', 'Condominio Boa Vista, apt. 512',331);

--Feito por Davi
INSERT INTO modulo_facilitador VALUES
(3,1),
(1,2),
(2,3),
(4,4),
(6,5),
(6,6),
(5,7),
(4,8),
(2,9),
(1,10);

--Feito por Douglas
INSERT INTO departamento VALUES
(111,'pedagógico','Soft'),
(112,'pedagógico','Hard'),
(113,'pedagógico','Coordenação'),
(221,'financeiro','Tesouraria'),
(222,'financeiro','Contabilidade'),
(223,'financeiro','Gestão de Contas'),
(331,'administrativo','Direção'),
(332,'administrativo','Recursos Humanos'),
(333,'administrativo','Controle de Qualidade');

