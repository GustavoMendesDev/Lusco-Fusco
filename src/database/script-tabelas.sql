-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!

/*
comandos para mysql server

CREATE DATABASE LuscoFusco;

USE LuscoFusco;

DROP DATABASE luscoFusco;

CREATE TABLE usuario (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(59),
email VARCHAR(59),
senha VARCHAR(59),
fkdiario INT 
);

CREATE TABLE diario (
id INT PRIMARY KEY AUTO_INCREMENT,
relato VARCHAR(999),
dataD DATETIME DEFAULT CURRENT_TIMESTAMP(),
fkmusica INT
);

CREATE TABLE musica (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR (59),
link VARCHAR(255),
artista VARCHAR (59)
);

ALTER TABLE usuario ADD
CONSTRAINT CnxDiario
FOREIGN KEY (fkdiario)
REFERENCES diario(id);

ALTER TABLE diario ADD
CONSTRAINT CnxMusica
FOREIGN KEY (fkmusica)
REFERENCES musica(id);

