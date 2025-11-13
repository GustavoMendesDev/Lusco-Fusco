-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!

/*
comandos para mysql server

create database LuscoFusco;

use LuscoFusco;

create table usuario (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(59),
email VARCHAR(59),
senha VARCHAR(59)
);
