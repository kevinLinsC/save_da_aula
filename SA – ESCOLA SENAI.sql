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

-- 1. Lista de todos os cursos do campus de Vitória - PRONTO
SELECT c.nome_curso, ca.cidade
FROM curso AS c
INNER JOIN campus as ca
ON c.id_campus = ca.id_campus
WHERE ca.cidade = "Vitória";

-- 2. Lista de todos os cursos em ordem Alfabética - PRONTO
SELECT c.nome_curso
FROM curso AS c
ORDER BY nome_curso;

-- 3. Quais os 5 cursos mais caros? - PRONTO
SELECT c.nome_curso, c.valor
FROM curso AS c
ORDER BY c.valor DESC LIMIT 5;

-- 4. Qual curso é o mais barato no Campus da Serra? - PRONTO
SELECT c.nome_curso, c.valor, ca.cidade
FROM curso AS c
INNER JOIN campus as ca
ON c.id_campus = ca.id_campus
WHERE ca.cidade LIKE "Serra"
ORDER BY c.valor ASC LIMIT 1;

-- 5. Qual o turno com mais cursos disponíveis? - PRONTO
SELECT c.turno, count(c.turno) as contagem
FROM curso as c
GROUP BY c.turno LIMIT 1;

-- 6. Quantos cursos duram mais de dois anos e meio? - PRONTO
SELECT count(c.nome_curso) as cursos_mais_dois_e_meio
FROM curso as c
WHERE c.duracao > 5;

-- 7. Quais os cursos com maior quantidade de alunos inscritos? - TERMINAR
SELECT c.nome_curso, ma.id_curso
FROM curso as c
INNER JOIN matricula as ma
ON c.id_curso = ma.id_curso;


SELECT c.nome_curso, ma.id_ra, al.id_ra, al.nome
FROM curso as c
INNER JOIN aluno as al
INNER JOIN matricula as ma
ON ma.id_ra = al.id_ra;

SELECT c.nome_curso, c.valor, ca.cidade
FROM curso AS c
INNER JOIN campus as ca
ON c.id_campus = ca.id_campus
WHERE ca.cidade LIKE "Serra"
ORDER BY c.valor ASC LIMIT 1;


-- 8. Qual a média de preço dos cursos listados? - PRONTO
SELECT sum(c.valor) / count(c.valor) as media_preco
FROM curso as c;

-- 9. Quais cursos duram mais tempo?

-- 10. Quantos alunos estão matriculados em cada turno?

-- 11. Qual o campus com mais cursos? - PRONTO
SELECT ca.cidade, ca.endereco, count(c.nome_curso) as cursos
FROM curso as c
INNER JOIN campus as ca
ON ca.id_campus = c.id_campus
GROUP BY ca.cidade
ORDER BY cursos DESC LIMIT 1;

-- 12. Quais cursos não possuem alunos cadastrados?

-- 13. Quem se matriculou em 2021?

-- 14. Qual a data de matrícula da aluna “Fernanda Lima”?

-- 15. Quais alunos não se cadastraram em nenhum curso?

-- 16. Quantas alunas matriculadas até o momento?

-- 17. Quais alunos estão matriculados 3 cursos?

-- 18. Qual o curso do aluno “Guilherme Costa”?

-- 19. Quais os alunos matriculados em “Ciência da computação”

-- 20. Relação completa de todos os alunos e seus cursos


SELECT * FROM campus;
SELECT * FROM curso;
SELECT * FROM matricula;
SELECT * FROM aluno;