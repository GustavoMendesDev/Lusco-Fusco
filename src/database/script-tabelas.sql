-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!

/*
comandos para mysql server

CREATE DATABASE LuscoFusco;

USE LuscoFusco;

DROP DATABASE luscoFusco;

CREATE TABLE musica (
idMusic INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR (59),
link VARCHAR(255),
artista VARCHAR (59)
);

CREATE TABLE diario (
idDiario INT PRIMARY KEY AUTO_INCREMENT,
relato VARCHAR(999),
dataD DATETIME DEFAULT CURRENT_TIMESTAMP(),
imagem VARCHAR(255),
fkmusica INT,
constraint fkmusica
 foreign key (fkmusica) 
  references musica(idMusic)
);

CREATE TABLE usuario (
idUser INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(59),
email VARCHAR(59),
senha VARCHAR(59),
fkdiario INT,
constraint fkdiary
 foreign key (fkdiario)
  references diario(idDiario)
);
