--Criação da database
CREATE DATABASE RESILIA;

USE RESILIA;

-- Feito por Lenilson
CREATE TABLE aluno(
id_aluno INT NOT NULL PRIMARY KEY,
nome VARCHAR (50),
telefone INT,
email VARCHAR (50),
endereco VARCHAR (50)
);

-- Feito pela Stephanie
CREATE TABLE curso(
id_curso INTEGER NOT NULL PRIMARY KEY,
nome VARCHAR (100),
turno VARCHAR (100)
);

-- Feito por Davi
CREATE TABLE aluno_curso(
id_aluno INT NOT NULL,
id_curso INT NOT NULL,
id_matricula VARCHAR(20),
frequencia_porcent INT,
PRIMARY KEY (id_aluno,id_curso),
FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno),
FOREIGN KEY (id_curso) REFERENCES curso(id_curso)
);

-- Feito por Davi
CREATE TABLE modulo(
id_modulo INT NOT NULL PRIMARY KEY,
nome VARCHAR (100),
cargahoraria INT,
proj_ind1 VARCHAR(5),
proj_ind2 VARCHAR(5),
proj_grup VARCHAR(5)
);

-- Feito por Davi
CREATE TABLE curso_modulo(
id_curso INT NOT NULL,
id_modulo INT NOT NULL,
PRIMARY KEY (id_curso,id_modulo),
FOREIGN KEY (id_curso) REFERENCES curso(id_curso),
FOREIGN KEY (id_modulo) REFERENCES modulo(id_modulo)
);

--Feito por Douglas
CREATE TABLE departamento(
id_departamento INTEGER NOT NULL PRIMARY KEY,
nome VARCHAR (50),
setor VARCHAR (50)
);

-- Feito por Matheus
CREATE TABLE facilitador(
id_facilitador INT NOT NULL PRIMARY KEY,
nome VARCHAR (50),
telefone VARCHAR (20),
email VARCHAR (50),
endereco VARCHAR (50),
id_departamento INTEGER NOT NULL,
FOREIGN KEY (id_departamento) REFERENCES departamento(id_departamento)
);

-- Feito por Davi
CREATE TABLE modulo_facilitador(
id_modulo INT NOT NULL,
id_facilitador INT NOT NULL,
PRIMARY KEY (id_modulo,id_facilitador),
FOREIGN KEY (id_modulo) REFERENCES modulo(id_modulo),
FOREIGN KEY (id_facilitador) REFERENCES facilitador(id_facilitador)
);
