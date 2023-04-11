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

Foram concebidos de forma fictícia registros para cada entidade existente afim de se checar o preenchimento das informações. No caso do número de empresas e das datas de compilação dos relatórios, atentou-se à restrição de 4 empresas e, pelo menos, 1 relatório para cada uma daquelas em cada semestre. As demais tabelas receberam quantiddades de cargas maiores ou condizentes com as primeiras cargas. Cada tabela teve o registo feito pela expressão 'INSERT INTO <nome_tabela> VALUES', respeitando a ordem na qual os campos foram criados anteriormente:

```sql
--BANCO DE DADOS BANCORESILIA--
--
--início dos registros para popular o banco de dados--
--
--registros da tabela 1--
INSERT INTO CADASTRO_EMPRESA VALUES
(77382821,'Statkraft',47240670,'Lilleakerveien 6, NO-0283 Oslo, Norway'),
(22000049,'IBM Brasil',20031170,'Av. República do Chile, 330 Centro, RJ'),
(01590944,'Itaú',20050005,'Rua Sete de Setembro 99a Centro, RJ'),
(55558992,'EBANX',96123456,'Rua Marechal Deodoro, 630 Curitiba,PR');
--
--registros da tabela 2--
INSERT INTO CADASTRO_TECNOLOGIA VALUES
(100,'JavaScript','Desenvolvimento Web'),
(200,'Unity','Desenvolvimento de Jogos'),
(300,'SQL','Dados'),
(400,'Ruby','Desenvolvimento de Software'),
(500,'Tableau','Dados'),
(600,'TCP/IP','Infraestrutura de Redes'),
(700, 'VPN','Segurança da Informação'),
(800,'Oracle','Dados'),
(900,'Unreal Engine','Desenvolvimento de Jogos');
--
--registros da tabela 3--
INSERT INTO RELATORIO VALUES
(11111,'2022-03-09',77382821),
(22222,'2022-04-19',22000049),
(33333,'2022-06-03',01590944),
(44444,'2022-05-14',55558992),
(77777,'2022-08-30',77382821),
(88888,'2022-10-23',22000049),
(99999,'2022-09-08',01590944),
(10101,'2022-07-10',55558992);
--
--registros da tabela 4--
INSERT INTO CURSOS VALUES
(993848,'Infraestrutura de Redes',430,'Edgard Simas','Tarde','back-end',77382821),
(228293,'Desenvolvimento Web Mobile',500,'Daniel Sanches','Manhã','full-stack',77382821),
(1279182,'Cloud Computing',540,'Bruno Veritas','Manhã','servers',22000049),
(1212121,'Modelagem para Jogos Eletrônicos',670,'Amanda Caldas','Manhã','back-end',22000049),
(1231231,'Automação de Sistemas',330,'Denilson Dantas','Tarde','devops',01590944),
(1234123,'Introdução ao Machine Learning',200,'Daniel Marques','Tarde','inteligência artificial',55558992),
(2345234,'Soluções para Big Data',290,'Américo Rodrigues','Noite','engenharia de dados',55558992),
(5674567,'APIs e Integrações',310,'Vítor Moura','Manhã','back-end',55558992),
(1282890,'Ciberssegurança',490,'Douglas Portugal','Noite','segurança da informação',01590944),
(2918376,'Swift e Kotlin para Desenvolvimento Mobile',250,'Jean Faria','Manhã','mobile',55558992);
--
--registros da tabela 5--
INSERT INTO RELATORIO_TECNOLOGIA VALUES
(11111,100),
(22222,200),
(33333,300),
(44444,400),
(77777,500),
(77777,600),
(77777,700),
(88888,800),
(99999,900),
(10101,200),
(11111,200),
(11111,300),
(33333,200),
(44444,600),
(44444,700),
(77777,900),
(77777,100),
(88888,900),
(99999,400),
(11111,400);
--
--registros da tabela 6--
INSERT INTO EMPRESA_CURSOS VALUES
(77382821,993848),
(77382821,228293),
(22000049,1279182),
(22000049,1212121),
(55558992,1234123),
(55558992,2345234),
(55558992,5674567),
(55558992,2918376),
(01590944,1231231),
(01590944,1282890);
--
--finalização dos registros--
```


### * 3: Consultas feitas ao Banco de Dados ###

Cada consulta seguiu o padrão de busca pelos dados entre as tabelas na ordem 'SELECT <nome_tabela.campo> FROM <nome_tabela> JOIN <nome_tabela2> ON <nome_tabela.campocomum> = <nome_tabela2.campocomum>', variando de acordo com a quantidade de tabelas envolvidas na busca, da localização das respostas e da necessidade de agrupamento e/ou contagem de certos campos (comandos WHERE/GROUP BY/ORDER BY/COUNT p. ex.). As consultas geradas foram feitas para atender às indagações propostas pelo projeto, como pode ser visto abaixo:

```sql
--BANCO DE DADOS BANCORESILIA--
--
--consultas para as perguntas do escopo do projeto--
--
--1.Qual empresa utiliza o maior número de tecnologias na última pesquisa (2/2022)?
SELECT CADASTRO_EMPRESA.CNPJ, CADASTRO_EMPRESA.Nome, COUNT(*) AS NUM_TEC
FROM CADASTRO_EMPRESA
LEFT JOIN RELATORIO
ON CADASTRO_EMPRESA.CNPJ = RELATORIO.CNPJ
LEFT JOIN RELATORIO_TECNOLOGIA
ON RELATORIO.ID_Relatorio = RELATORIO_TECNOLOGIA.ID_Relatorio
WHERE RELATORIO.Data_Compilacao >= '2022-07-01' AND RELATORIO.Data_Compilacao <= '2022-12-31'
GROUP BY CADASTRO_EMPRESA.CNPJ, CADASTRO_EMPRESA.Nome
ORDER BY NUM_TEC DESC
LIMIT 1;
--
--2. Qual empresa utilizava o menor número de tecnologias na pesquisa anterior (1/2022)?
SELECT CADASTRO_EMPRESA.CNPJ, CADASTRO_EMPRESA.Nome, COUNT(*) AS NUM_TEC
FROM CADASTRO_EMPRESA
LEFT JOIN RELATORIO
ON CADASTRO_EMPRESA.CNPJ = RELATORIO.CNPJ
LEFT JOIN RELATORIO_TECNOLOGIA
ON RELATORIO.ID_Relatorio = RELATORIO_TECNOLOGIA.ID_Relatorio
WHERE RELATORIO.Data_Compilacao >= '2022-01-01' AND RELATORIO.Data_Compilacao <= '2022-06-30'
GROUP BY CADASTRO_EMPRESA.CNPJ, CADASTRO_EMPRESA.Nome
ORDER BY NUM_TEC ASC
LIMIT 1;
--
--3. Quantas empresas utilizam tecnologias da área de “Dados” atualmente?
SELECT COUNT (CADASTRO_EMPRESA.CNPJ)
FROM CADASTRO_EMPRESA
LEFT JOIN RELATORIO
ON CADASTRO_EMPRESA.CNPJ = RELATORIO.CNPJ
LEFT JOIN RELATORIO_TECNOLOGIA 
ON RELATORIO.ID_Relatorio = RELATORIO_TECNOLOGIA.ID_Relatorio
LEFT JOIN CADASTRO_TECNOLOGIA 
ON RELATORIO_TECNOLOGIA.ID_Cad_Tec = CADASTRO_TECNOLOGIA.ID_Cad_Tec
WHERE CADASTRO_TECNOLOGIA.Area = 'Dados' AND RELATORIO.Data_Compilacao > '2022-07-01';
--
--4. Quantas empresas utilizam tecnologias que não são da área de “Dados” atualmente?
SELECT COUNT (DISTINCT CADASTRO_EMPRESA.CNPJ)
FROM CADASTRO_EMPRESA
lEFT JOIN RELATORIO
ON CADASTRO_EMPRESA.CNPJ = RELATORIO.CNPJ
LEFT JOIN RELATORIO_TECNOLOGIA 
ON RELATORIO.ID_Relatorio = RELATORIO_TECNOLOGIA.ID_Relatorio
LEFT JOIN CADASTRO_TECNOLOGIA 
ON RELATORIO_TECNOLOGIA.ID_Cad_Tec = CADASTRO_TECNOLOGIA.ID_Cad_Tec
WHERE CADASTRO_TECNOLOGIA.Area != 'Dados' AND RELATORIO.Data_Compilacao > '2022-07-01';
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
