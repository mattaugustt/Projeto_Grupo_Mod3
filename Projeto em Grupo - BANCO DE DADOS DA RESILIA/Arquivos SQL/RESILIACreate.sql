------------------------------------------------------------------
--  SENAC/RESILIA - Formação em Análise de Dados (FAD)          --
--  Projeto em Grupo - Módulo 3 - Banco de Dados da Resilia     --
--  SQL Server Management Studio 19 -*- coding: utf-8 -*-       --
--  Criado por: Davi de Moraes Novaes, Douglas Klem Portugal do --
--  Amaral, Matheus Augusto de Souza, Lenilson dos Reis Barros  --
--  e Stephanie Ferreira Vale                                   --
--  Data de criação: 10/04/2023                                 --
--  versão = 6.19(64-bit)                                       --
------------------------------------------------------------------
--
--BANCO DE DADOS DA RESILIA--
--
--criação das tabelas para cada entidade--
--
--Criação da Database--
CREATE DATABASE RESILIA;
--
USE RESILIA;
--
--Entidade 1 - Feito pelo Lenilson--
CREATE TABLE aluno(
id_aluno INT NOT NULL PRIMARY KEY,
nome VARCHAR (50),
telefone INT,
email VARCHAR (50),
endereco VARCHAR (50)
);
--
--Entidade 2 - Feito pela Stephanie--
CREATE TABLE curso(
id_curso INTEGER NOT NULL PRIMARY KEY,
nome VARCHAR (100),
turno VARCHAR (100)
);
--
--Entidade 3 - Feito pelo Davi--
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
--Entidade 4 - Feito pelo Davi--
CREATE TABLE modulo(
id_modulo INT NOT NULL PRIMARY KEY,
nome VARCHAR (100),
cargahoraria INT,
proj_ind1 VARCHAR(5),
proj_ind2 VARCHAR(5),
proj_grup VARCHAR(5)
);
--
--Entidade 5 - Feito pelo Davi--
CREATE TABLE curso_modulo(
id_curso INT NOT NULL,
id_modulo INT NOT NULL,
PRIMARY KEY (id_curso,id_modulo),
FOREIGN KEY (id_curso) REFERENCES curso(id_curso),
FOREIGN KEY (id_modulo) REFERENCES modulo(id_modulo)
);
--
--Entidade 6 - Feito pelo Douglas--
CREATE TABLE departamento(
id_departamento INTEGER NOT NULL PRIMARY KEY,
nome VARCHAR (50),
setor VARCHAR (50)
);
--
--Entidade 7 - Feito pelo Matheus--
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
--Entidade 8 - Feito pelo Davi--
CREATE TABLE modulo_facilitador(
id_modulo INT NOT NULL,
id_facilitador INT NOT NULL,
PRIMARY KEY (id_modulo,id_facilitador),
FOREIGN KEY (id_modulo) REFERENCES modulo(id_modulo),
FOREIGN KEY (id_facilitador) REFERENCES facilitador(id_facilitador)
);
--finalização das tabelas para cada entidade--
------------------------------------------------------------------
