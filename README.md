## Descrição ##

Este repositório (FAD-M3) contém os arquivos utilizados para disponibilizar a infraestrutura necessária para o projeto final em grupo do Módulo 3 (Banco de Dados e Relacionamento Interpessoal) do curso de Formação em Análise de Dados promovido pela parceria SENAC/Resilia.

Nossa equipe foi escalada pela Resilia para modernizar o processo de armazenamento de dados e construção para gerenciamento daestrutura de ensino da empresa. Para isso, nos atentamos à descrição fornecida no projeto. Hoje, dentro da Resilia, são armazenadas diversas informações do braço de ensino da empresa como dados sobre os alunos, facilitadores, departamentos, módulos e cursos em planilhas. Essas informações são colocadas em planilhas diferentes, dificultando muitas das vezes a extração de dados estratégicos para a empresa.

Portanto, nosso objetivo se resume em modelar e criar o banco de dados através das informações fornecidas, populando-o com registros fictícios e que permitam executar algumas consultas para gerar informações estratégicas para a área de ensino da Resilia. 


###########################################################################################################

## Pastas e Arquivos ##

* **README.md**: arquivo que abriga uma breve descrição do projeto com o título, suas funcionalidades, arquivos presentes na pasta do projeto, seus respectivos comandos e informações da equipe responsável pelo desenvolvimento.

>>>Projeto em Grupo - BANCO DE DADOS DA RESILIA/
   >>>Arquivos SQL/
   * **RESILIACreate.sql**: arquivo contendo os comandos para criação do banco de dados;
   * **RESILIAInsert.sql**: arquivo contendo os comandos utilizados para dar carga (registrar), com dados fictícios, no banco de dados;
   * **RESILIAQueries.sql**: arquivo contendo os comandos de query (consultas) SQL que respondem a cada uma das perguntas feitas no projeto.
>>>Projeto em Grupo - BANCO DE DADOS DA RESILIA/
   >>>Modelo/
   * **RESILIAConcept.png**: arquivo contendo a imagem do modelo conceitual para a criação do banco de dados;
   * **RESILIALogic.png**: arquivo contendo a imagem do modelo lógico para a criação do banco de dados.


###########################################################################################################

## Funcionalidades ##

### * 1: Construção do Banco de Dados ###

A criação do banco de dados RESILIA parte do iniciador 'CREATE DATABASE <nome_banco_de_dados>' pelo Query Tool. Inicia-se a construção das tabelas de cada entidade pela expressão 'CREATE TABLE <nome_tabela>' seguida da inserção de seus respectivos campos, tipos e definição das chaves relacionadas de acordo com a construção da
modelagem feita previamente:

```sql
--Criação da Database--
CREATE DATABASE RESILIA;
--
USE RESILIA;
--
CREATE TABLE aluno(
id_aluno INT NOT NULL PRIMARY KEY,
nome VARCHAR (50),
telefone INT,
email VARCHAR (50),
endereco VARCHAR (50)
);
--
CREATE TABLE curso(
id_curso INTEGER NOT NULL PRIMARY KEY,
nome VARCHAR (100),
turno VARCHAR (100)
);
--
CREATE TABLE aluno_curso(
id_aluno INT NOT NULL,
id_curso INT NOT NULL,
id_matricula VARCHAR(20),
frequencia_porcent INT,
PRIMARY KEY (id_aluno,id_curso),
FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno),
FOREIGN KEY (id_curso) REFERENCES curso(id_curso)
);
--
CREATE TABLE modulo(
id_modulo INT NOT NULL PRIMARY KEY,
nome VARCHAR (100),
cargahoraria INT,
proj_ind1 VARCHAR(5),
proj_ind2 VARCHAR(5),
proj_grup VARCHAR(5)
);
--
CREATE TABLE curso_modulo(
id_curso INT NOT NULL,
id_modulo INT NOT NULL,
PRIMARY KEY (id_curso,id_modulo),
FOREIGN KEY (id_curso) REFERENCES curso(id_curso),
FOREIGN KEY (id_modulo) REFERENCES modulo(id_modulo)
);
--
CREATE TABLE departamento(
id_departamento INTEGER NOT NULL PRIMARY KEY,
nome VARCHAR (50),
setor VARCHAR (50)
);
--
CREATE TABLE facilitador(
id_facilitador INT NOT NULL PRIMARY KEY,
nome VARCHAR (50),
telefone VARCHAR (20),
email VARCHAR (50),
endereco VARCHAR (50),
id_departamento INTEGER NOT NULL,
FOREIGN KEY (id_departamento) REFERENCES departamento(id_departamento)
);
--
CREATE TABLE modulo_facilitador(
id_modulo INT NOT NULL,
id_facilitador INT NOT NULL,
PRIMARY KEY (id_modulo,id_facilitador),
FOREIGN KEY (id_modulo) REFERENCES modulo(id_modulo),
FOREIGN KEY (id_facilitador) REFERENCES facilitador(id_facilitador)
);
--finalização das tabelas para cada entidade--
```


### * 2: Registro no Banco de Dados ###

Cada entidade recebeu registros de forma fictícia afim de se checar a integridade do preenchimento das informações. Cada tabela teve o registo feito pela expressão 'INSERT INTO <nome_tabela> VALUES', respeitando a ordem na qual os campos foram criados anteriormente:

```sql
--Início dos registros para popular o banco de dados--
--
INSERT INTO aluno VALUES
(111,'Davi de Moraes Novaes',219484848,'dmoraes@mail.com','Rua Carminha Dutra, n. 500'),
(222,'Stephanie Ferreira Vale',219456565,'svale@mail.com','Rua Alfredo Raimundo, n. 650'),
(333,'Douglas Klem Portugal do Amaral',219837363,'dkamaral@mail.com','Rua Bigode Respeitoso, n.220'),
(444,'Márcio Lorenzo Alves',219837635,'mlorenzo@mail.com','Avenida Coronel Rodapé, n. 171'),
(555,'Matheus Augusto de Souza',219878787,'mathaugusto@mail.com','Rua José Alves Lima, n. 130'),
(666,'Lenilson dos Reis Barros',219047574,'lreis@mail.com','Estrada do Portela Nobre, n. 432');
--
INSERT INTO curso VALUES
(01,'Desenvolvimento Web','Noite'),
(02,'Ciência da Comunicação','Manhã'),
(03,'Informática','Tarde'),
(04,'Redes de Computadores','Noite'),
(05,'Automatização com DevOps','Noite'),
(06,'Sistemas de Informação','Tarde'),
(07,'Análise de Dados','Manhã'),
(08,'Excel Avançado','Tarde');
--
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
--
INSERT INTO modulo VALUES
(1,'Python I',30,'SIM','NAO','NAO'),
(2,'SQL',20,'SIM','SIM','SIM'),
(3,'Soft Skills',70,'SIM','SIM','SIM'),
(4,'Lógica de Programação',10,'NAO','NAO','NAO'),
(5,'Google Collab',25,'SIM','SIM','NAO'),
(6,'Power BI',40,'SIM','SIM','SIM');
--
INSERT INTO curso_modulo VALUES
(01,5),
(02,3),
(03,2),
(04,5),
(05,6),
(06,3),
(07,1),
(08,4);
--
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
--
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
--
INSERT INTO modulo_facilitador VALUES
(3,1),
(1,2),
(2,2),
(4,1),
(6,1),
(6,2),
(5,1),
(4,2),
(2,1),
(1,4);
--
--finalização dos registros--
```


### * 3: Consultas feitas ao Banco de Dados ###

Cada consulta seguiu o padrão de busca pelos dados entre as tabelas na ordem 'SELECT <nome_tabela.campo> AS <nome_alias> FROM <nome_tabela> JOIN <nome_tabela2> ON <nome_tabela.campocomum> = <nome_tabela2.campocomum>', variando de acordo com a quantidade de tabelas envolvidas na busca, da localização das respostas e da necessidade de agrupamento e/ou contagem de certos campos (comandos WHERE/GROUP BY/ORDER BY/COUNT/HAVING p. ex.).

```sql
-- Consultas obrigatórias para responder as perguntas do escopo do projeto:--
--
-- 1. Selecionar a quantidade total de estudantes cadastrados no banco.
--
SELECT COUNT(*) AS Total_de_Alunos FROM aluno;
--
-- 2. Selecionar todos os estudantes com os respectivos cursos nos quais eles estão cadastrados.
--
SELECT aluno.nome AS Alunos, curso.nome As Cursos
FROM aluno
INNER JOIN aluno_curso
ON aluno.id_aluno = aluno_curso.id_aluno
INNER JOIN curso
ON aluno_curso.id_curso = curso.id_curso
ORDER BY aluno.nome;
--
-- 3. Selecionar quais pessoas facilitadoras atuam em mais de uma turma.
--
SELECT DISTINCT facilitador.nome AS Facilitadores
FROM facilitador
RIGHT JOIN modulo_facilitador
ON facilitador.id_facilitador = modulo_facilitador.id_facilitador
RIGHT JOIN modulo
ON modulo_facilitador.id_modulo = modulo.id_modulo
RIGHT JOIN curso_modulo
ON modulo.id_modulo = curso_modulo.id_modulo
RIGHT JOIN curso
ON curso_modulo.id_curso = curso.id_curso
GROUP BY facilitador.nome
HAVING COUNT(curso.id_curso) >1;
--
--
-- Consultas Estratégicas para responder questionamentos criativos e pertinentes ao projeto que--
-- foram gerados pela equipe:--
--
-- 1. Retorne os nomes dos alunos com frequência igual ou superior a 95% no curso e a carga horária
-- dos respectivos módulos.
--
SELECT aluno.nome AS Alunos, modulo.cargahoraria AS Carga_Horária_Módulo
FROM aluno
INNER JOIN aluno_curso
ON aluno.id_aluno = aluno_curso.id_aluno
INNER JOIN curso
ON aluno_curso.id_curso = curso.id_curso
INNER JOIN curso_modulo
ON curso.id_curso = curso_modulo.id_curso
INNER JOIN modulo
ON curso_modulo.id_modulo = modulo.id_modulo
WHERE aluno_curso.frequencia_porcent >=95;
--
-- 2. Retorne os nomes dos alunos que realizaram as entregas de todos os projetos requeridos e
-- os nomes dos respectivos cursos desses projetos.
--
SELECT aluno.nome AS Alunos, modulo.proj_ind1 AS Projeto_Individual_1,
modulo.proj_ind2 AS Projeto_Individual_2, modulo.proj_grup AS Projeto_Grupo, curso.nome AS Turma
FROM aluno
INNER JOIN aluno_curso
ON aluno.id_aluno = aluno_curso.id_aluno
INNER JOIN curso
ON aluno_curso.id_curso = curso.id_curso
INNER JOIN curso_modulo
ON curso.id_curso = curso_modulo.id_curso
INNER JOIN modulo
ON curso_modulo.id_modulo = modulo.id_modulo
WHERE modulo.proj_ind1='SIM' AND modulo.proj_ind2='SIM' AND modulo.proj_grup='SIM';
--
-- 3. Retorne o nome dos facilitadores alocados no departamento pedagógico que não
-- são coordenadores. Diga, também, quais os setores ligados a esses facilitadores.
--
SELECT facilitador.nome AS Facilitadores, departamento.nome AS Departamento, departamento.setor AS Setores
FROM facilitador
LEFT JOIN departamento
ON facilitador.id_departamento = departamento.id_departamento
WHERE facilitador.id_departamento=111 OR facilitador.id_departamento=112;
--
--finalização das consultas--
```

###########################################################################################################


## Equipe ##

Davi Novaes; <br>
Douglas Klem; <br>
Lenilson Barros; <br>
Matheus Augusto; <br>
Stephanie Vale. <br>
**E-mails para contato:** <br>
mataugusto1999@gmail.com <br>

NOME:Davi de Moraes Novaes
CARGO/FUNÇÃO: Gestão de Conhecimento
ENTIDADE RESPONSÁVEL(CREATE+INSERT): 
--
NOME: Douglas Klem Portugal do Amaral
CARGO/FUNÇÃO: Gestão de Performance e Revisão
ENTIDADE RESPONSÁVEL(CREATE+INSERT):
--
NOME: Matheus Augusto de Souza
CARGO/FUNÇÃO: Gestão de Processos
ENTIDADE RESPONSÁVEL(CREATE+INSERT):
--
NOME: Lenilson dos Reis Barros
CARGO/FUNÇÃO: Gestão de Comunicação
ENTIDADE RESPONSÁVEL(CREATE+INSERT):
--
NOME: Stephanie Ferreira Vale
CARGO/FUNÇÃO: Gestão de P&D
ENTIDADE RESPONSÁVEL(CREATE+INSERT):
