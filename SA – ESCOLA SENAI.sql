CREATE DATABASE escola_senai;

USE escola_senai;

CREATE TABLE campus(
	id_campus INT PRIMARY KEY AUTO_INCREMENT,
    cidade VARCHAR(25) NOT NULL,
    endereco VARCHAR(75) NOT NULL
);

CREATE TABLE curso(
	id_curso INT PRIMARY KEY AUTO_INCREMENT,
    nome_curso VARCHAR(50) NOT NULL,
    turno VARCHAR(20) NOT NULL,
    duracao INT(2) NOT NULL,
    valor DECIMAL(6, 2) NOT NULL,
    id_campus INT,
    FOREIGN KEY (id_campus) REFERENCES campus(id_campus)
);

CREATE TABLE aluno(
	id_ra INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(40) NOT NULL,
    dt_nascimento DATE NOT NULL,
    cpf VARCHAR(11) NOT NULL,
    sexo CHAR(1) NOT NULL
);

CREATE TABLE matricula(
	id_matricula INT PRIMARY KEY AUTO_INCREMENT,
    dt_matricula DATE NOT NULL,
    id_ra INT,
    id_curso INT,
    FOREIGN KEY (id_ra) REFERENCES aluno(id_ra),
    FOREIGN KEY (id_curso) REFERENCES curso(id_curso)
);

SELECT * FROM campus;
SELECT * FROM curso;

-- right join
SELECT l.titulo, a.name
FROM livros as l
RIGHT JOIN autores as a
ON a.autor_id = l.autor_id;

-- 1. Lista de todos os cursos do campus de Vitória
SELECT cu.nome_curso, ca.cidade
FROM curso AS cu
INNER JOIN campus as ca
ON ca.cidade = "Vitória";

-- 2. Lista de todos os cursos em ordem Alfabética
SELECT cu.nome_curso
FROM curso AS cu
ORDER BY nome_curso;

-- 3. Quais os 5 cursos mais caros?
SELECT cu.nome_curso, cu.valor
FROM curso AS cu
ORDER BY valor DESC LIMIT 5;

-- 4. Qual curso é o mais barato no Campus da Serra?
SELECT cu.nome_curso, cu.valor, ca.cidade
FROM curso AS cu
INNER JOIN campus as ca
WHERE ca.cidade = "Serra"
ORDER BY cu.valor;