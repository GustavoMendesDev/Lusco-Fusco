CREATE DATABASE ativbancao;
USE ativbancao;

CREATE TABLE Aluno (
    id_aluno INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE Curso (
    id_curso INT PRIMARY KEY AUTO_INCREMENT,
    nome_curso VARCHAR(100),
    descricao VARCHAR(255)
);

CREATE TABLE Aluno_Curso (
    id_aluno INT,
    id_curso INT,
    data_inscricao DATE,
    PRIMARY KEY (id_aluno, id_curso),
    FOREIGN KEY (id_aluno) REFERENCES Aluno(id_aluno),
    FOREIGN KEY (id_curso) REFERENCES Curso(id_curso)
);

CREATE TABLE Acesso (
    id_aluno INT,
    id_curso INT,
    data_acesso DATETIME,
    duracao_minutos INT,
    PRIMARY KEY (id_aluno, id_curso, data_acesso),
    FOREIGN KEY (id_aluno) REFERENCES Aluno(id_aluno),
    FOREIGN KEY (id_curso) REFERENCES Curso(id_curso)
);

INSERT INTO Aluno (nome, email) VALUES
('Guilherme Mesquista', 'ana@imail.com'),
('Bruno Costa', 'bruno@imail.com'),
('Gutstavo Mendes', 'carla@imail.com');

INSERT INTO Curso (nome_curso, descricao) VALUES
('Banco de Dados', 'Curso de SQL '),
('Lógica de Programação', ' computacional'),
('JavaScript', 'Desenvolvimento web');

INSERT INTO Aluno_Curso (id_aluno, id_curso, data_inscricao) VALUES
(1, 1, '2024-10-01'),
(1, 2, '2024-10-05'),
(2, 1, '2024-10-03'),
(3, 3, '2024-10-07');

INSERT INTO Acesso (id_aluno, id_curso, data_acesso, duracao_minutos) VALUES
(1, 1, '2024-11-01 14:00:00', 30),
(1, 1, '2024-11-02 15:00:00', 45),
(1, 2, '2024-11-03 19:00:00', 20),
(2, 1, '2024-11-01 16:30:00', 25),
(3, 3, '2024-11-02 17:00:00', 50);

SELECT 
    Aluno.nome AS aluno,
    Curso.nome_curso AS curso
FROM Aluno
JOIN Aluno_Curso ON Aluno.id_aluno = Aluno_Curso.id_aluno
JOIN Curso ON Curso.id_curso = Aluno_Curso.id_curso;

SELECT 
    Acesso.data_acesso,
    Acesso.duracao_minutos
FROM Acesso
JOIN Aluno ON Aluno.id_aluno = Acesso.id_aluno
WHERE Aluno.nome = 'Ana Silva';

SELECT 
    Curso.nome_curso,
    COUNT(Aluno_Curso.id_aluno) AS total_alunos
FROM Curso
JOIN Aluno_Curso ON Curso.id_curso = Aluno_Curso.id_curso
GROUP BY Curso.id_curso
HAVING COUNT(Aluno_Curso.id_aluno) > 1;

SELECT 
    Curso.nome_curso,
    AVG(Acesso.duracao_minutos) AS media_duracao
FROM Curso
JOIN Acesso ON Curso.id_curso = Acesso.id_curso
GROUP BY Curso.id_curso;

SELECT 
    Aluno.nome AS aluno,
    Curso.nome_curso AS curso,
    SUM(Acesso.duracao_minutos) AS total_minutos
FROM Acesso
JOIN Aluno ON Aluno.id_aluno = Acesso.id_aluno
JOIN Curso ON Curso.id_curso = Acesso.id_curso
GROUP BY Aluno.id_aluno, Curso.id_curso;

SELECT * FROM Aluno;
SELECT * FROM Curso;
SELECT * FROM Aluno_Curso;
SELECT * FROM Acesso;

SELECT 
    Aluno.nome
FROM Aluno
LEFT JOIN Acesso ON Aluno.id_aluno = Acesso.id_aluno
WHERE Acesso.id_aluno IS NULL;
