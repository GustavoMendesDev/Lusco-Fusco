
CREATE DATABASE LuscoFusco ;

USE LuscoFusco;

DROP DATABASE LuscoFusco;

CREATE TABLE usuario (
idUser INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(59),
email VARCHAR(59),
senha VARCHAR(59)
);

CREATE TABLE musica (
idMusic INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(59),
link VARCHAR(255),
artista VARCHAR(59)
);

CREATE TABLE diario (
idDiario INT PRIMARY KEY AUTO_INCREMENT,
relato VARCHAR(999),
dataD DATETIME DEFAULT CURRENT_TIMESTAMP(),
imagem VARCHAR(255),
fkuser INT,
CONSTRAINT fkuserR FOREIGN KEY (fkuser)
REFERENCES usuario(idUser),
fkmusic INT,
CONSTRAINT fkmusicR FOREIGN KEY (fkmusic)
REFERENCES musica(idMusic)
);

select * from usuario;

select * from musica;

select * from diario;

truncate table musica;

delete from musica where idMusic = 1;

select usuario as User, count (artista.idMusic) as Quantidade from diario
JOIN musica ON diario.fkmusic = musica.idMusic
JOIN usuario ON usuario.fkuser = usuario.idUser
 WHERE usuario.idUser = 1
    GROUP BY usuario.nome, artista.nome
    ORDER BY COUNT(diario.idDiario) DESC limit 10;


SELECT imagem FROM diario WHERE idDiario = 3;