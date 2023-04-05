-- Feito por Lenilson
INSERT INTO aluno VALUES
(111,'Davi'),
(222,'Stephanie'),
(333,'Douglas'),
(444,'Davi'),
(555,'Matheus'),
(666,'Lenilson');

--Feito pela Stephanie
INSERT INTO curso VALUES
(01,'Banco de Dados','Noite'),
(02,'Ciência da comunicação','Manhã'),
(03,'Informática','Tarde'),
(04,'Redes de Computadores','Noite'),
(05,'Engenharia da Computação','Noite'),
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
(4,'Logica de Programação',10,'NAO','NAO','NAO'),
(5,'Google Colab',25,'SIM','SIM','NAO'),
(6,'Power Bi',40,'SIM','SIM','SIM');

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
(1, 'Thiago', '(21)98463-8467', 'thiago@email.com', 'Rua das flores, n. 19'),
(2, 'Edgard', '(11)94645-8888', 'edgard@email.com', 'Av. Luiz Rosa, n. 255'),
(3, 'Sofia', '(12)97623-8743', 'sofia@email.com', 'Rua Fernando Barbosa, n. 450'),
(4, 'Fátima', '(21)96473-8364', 'fatima@email.com', 'Av. Franco da Silva, n. 210'),
(5, 'Bruna', '(22)98473-0293', 'bruna@email.com', 'Rua Nova York, n. 95'),
(6, 'Fernando', '(22)95436-8695', 'fernando@email.com', 'Estrada do Galeão, n. 1954'),
(7, 'Larissa', '(21)96453-9287', 'larissa@email.com', 'AV. Brigadeiro Fernando, n. 282'),
(8, 'Monique', '(21)96583-6754', 'monique@email.com', 'Rua Professor Eduardo, n. 303'),
(9, 'Lucas', '(21)94546-3254', 'lucas@email.com', 'Alameda do Sol, n. 203'),
(10, 'Manuela', '(21)94547-2563', 'manuela@email.com', 'Condominio Boa Vista, apt. 512');

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
(111,'pedagógico','Soft',1),
(112,'pedagógico','Hard',2),
(113,'pedagógico','Coordenação',3),
(112,'pedagógico','Hard',5),
(111,'pedagógico','Soft',6),
(111,'pedagógico','Coordenação',7),
(222,'financeiro','Tesouraria',8),
(222,'financeiro','Contabilidade',9),
(222,'financeiro','Gestão de Contas',10),
(333,'administrativo','Direção',5),
(333,'administrativo','Recursos Humanos',6),
(333,'administrativo','Controle de Qualidade',7);