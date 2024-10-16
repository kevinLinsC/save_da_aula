-- CRIACAO DO BANCO DE DADOS E SUAS TABELAS.
-- -----------------------------------------------------------
CREATE DATABASE locadora;

USE locadora;

CREATE TABLE diretor (
	id_diretor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50)
);

CREATE TABLE filme (
	id_filme INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(100),
    id_diretor INT,
    genero VARCHAR(45),
    ano_lancamento YEAR(4),
    classificacao_indicativa VARCHAR(2),
    FOREIGN KEY (id_diretor) REFERENCES diretor(id_diretor)
);

CREATE TABLE cliente (
	id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50),
    email VARCHAR(50),
    dt_nasc DATE,
    cpf VARCHAR(11),
    sexo CHAR(1)
);

CREATE TABLE locacao (
	id_locacao INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT,
    id_filme INT,
    dt_emprestimo DATE,
    dt_devolucao_prevista DATE,
    dt_baixa_devolucao DATE,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_filme) REFERENCES filme(id_filme)
);

-- -----------------------------------------------------------
-- LISTA DE BUSCA
-- -----------------------------------------------------------
-- 1. Lista de todos os filmes do Steven Spielberg
SELECT f.titulo
FROM diretor AS d
INNER JOIN filme AS F
ON f.id_diretor = d.id_diretor
WHERE d.nome = "Steven Spielberg";

-- 2. Lista de todos os filmes por ordem de lançamento
SELECT f.titulo, f.ano_lancamento
FROM filme AS F
ORDER BY f.ano_lancamento;

-- 3. Lista de todos os filmes por do gênero Drama e Romance
SELECT f.titulo, f.genero
FROM filme AS F
WHERE f.genero = "Drama" OR f.genero = "Romance"
ORDER BY f.genero;

SELECT f.titulo, f.genero
FROM filme AS F
WHERE f.genero = "Drama"
UNION
SELECT f.titulo, f.genero
FROM filme AS F
WHERE f.genero = "Romance";

-- 4. Lista de todos os filmes de terror com classificação de -18 anos
SELECT f.titulo, f.genero, f.classificacao_indicativa
FROM filme AS F
WHERE f.genero = "Terror" AND f.classificacao_indicativa < 18;

-- 5. Qual o nome filme mais locado?
SELECT f.titulo, COUNT(l.id_filme) AS vezes_locacao_filme
FROM locacao AS l
INNER JOIN filme AS f
ON l.id_filme = f.id_filme
GROUP BY l.id_filme
ORDER BY COUNT(l.id_filme) DESC LIMIT 10;

-- 6. Qual o cliente com mais locações?
SELECT c.nome, COUNT(l.id_cliente) AS vezes_locacao_cliente
FROM locacao AS l
INNER JOIN cliente as c
ON l.id_cliente = c.id_cliente
GROUP BY l.id_cliente
ORDER BY vezes_locacao_cliente DESC LIMIT 10;

-- 7. Qual o filme mais locado entre as mulheres?
SELECT f.titulo, COUNT(f.titulo) as vezes_locado
FROM locacao AS l
INNER JOIN cliente AS c
ON l.id_cliente = c.id_cliente
INNER JOIN filme AS f
ON f.id_filme = l.id_filme
WHERE sexo = "F"
GROUP BY f.titulo
ORDER BY vezes_locado DESC LIMIT 5;

-- 8. Qual o filme mais locado entre os homens e do gênero ação?
SELECT f.titulo, COUNT(f.titulo) as vezes_locado
FROM locacao AS l
INNER JOIN cliente AS c
ON l.id_cliente = c.id_cliente
INNER JOIN filme AS f
ON f.id_filme = l.id_filme
WHERE sexo = "M" AND f.genero = "Ação"
GROUP BY f.titulo
ORDER BY vezes_locado DESC LIMIT 2;

-- 9. Qual o filme locado pelo cliente do Id 7, e qual seu nome, e qual a data foi sua data de devolução?
SELECT f.titulo, c.nome, dt_baixa_devolucao AS dt_devolucao
FROM cliente AS c
INNER JOIN locacao AS l
ON l.id_cliente = c.id_cliente
INNER JOIN filme AS f
ON l.id_filme = f.id_filme
WHERE c.id_cliente = 7;

-- 10. Quais os filmes foram devolvidos após a data prevista?
SELECT f.titulo, l.dt_devolucao_prevista, l.dt_baixa_devolucao
FROM locacao AS l
INNER JOIN filme AS f
ON f.id_filme = l.id_filme
WHERE l.dt_devolucao_prevista != l.dt_baixa_devolucao;

-- 11. Quantas vezes o filme “The Dark Knight” foi locado?
SELECT f.titulo, count(f.titulo) AS vezes_locado
FROM filme AS f
INNER JOIN locacao AS l
ON l.id_filme = f.id_filme
WHERE f.titulo = "The Dark Knight";

-- 12. Lista dos 5 filmes mais locados em ordem decrescente
SELECT f.titulo, COUNT(f.titulo) as vezes_locado
FROM filme AS f
INNER JOIN locacao AS l
ON l.id_filme = f.id_filme
GROUP BY f.titulo
ORDER BY vezes_locado DESC LIMIT 5;

-- 13. Lista dos 3 clientes com mais locações em ordem decrescente
SELECT c.nome, COUNT(c.nome) AS vezes_clientes
FROM cliente AS c
INNER JOIN locacao AS l
ON l.id_cliente = c.id_cliente
GROUP BY c.nome
ORDER BY vezes_clientes DESC LIMIT 3;

-- 14. Lista de filmes que não foram devolvidos
SELECT f.titulo
FROM filme AS f
INNER JOIN locacao AS l
ON l.id_filme = f.id_filme
WHERE l.dt_baixa_devolucao = null OR l.dt_baixa_devolucao = "";

-- 15. Lista de filmes sem locação
SELECT f.titulo
FROM filme AS f
INNER JOIN locacao AS l
ON l.id_filme = f.id_filme
WHERE l.dt_emprestimo = null OR l.dt_baixa_devolucao = "";

-- -----------------------------------------------------------
-- Insira 4 novos filmes, 4 novos clientes e 4 novas locações em suas respectivas tabelas 
-- (via sql, não importação, e data de locação sendo hoje)
-- -----------------------------------------------------------
INSERT INTO filme(titulo, id_diretor, genero, ano_lancamento, classificacao_indicativa)
VALUES ("Chaves: A volta dos que não foram", 1, "Drama",    2024, 16),
	   ("The Witcher 3: Caçada Selvagem",    5, "Fantasia", 2015, 18),
       ("Red Dead Redemption 2",             6, "Ação",     2018, 16),
       ("Grand Theft Auto V",                1, "Ação",     2013, 12);
       
INSERT INTO cliente(nome, email, dt_nasc, cpf, sexo)
VALUES("Davy Jones",   "jazereitodososjogos@hotmail.com", "1989-10-10", "11111111111", "M"),
	  ("Andre Young",  "andrezitos@gmail.com",            "1987-11-11", "22222222222", "M"),
      ("Viniccius 13", "vinicin13@hotmail.com",           "1313-09-09", "13131313131", "M"),
      ("Ciri",         "naotenhoemail@hotmail.com",       "1349-01-01", "12345678910", "F");
     
INSERT INTO locacao(id_cliente, id_filme, dt_emprestimo, dt_devolucao_prevista, dt_baixa_devolucao)
VALUES(19, 31, "2024-10-15", "2024-10-18", "2024-10-20"),
      (17, 32, "2024-10-15", "2024-10-19", "2024-10-19"),
      (18, 33, "2024-10-15", "2024-10-19", "2024-10-19"),
      (16, 34, "2024-10-15", "2024-10-16", "2024-10-19");

-- -----------------------------------------------------------
-- VISUALIZAR TABELAS
-- -----------------------------------------------------------
SELECT * FROM cliente;
SELECT * FROM diretor;
SELECT * FROM filme;
SELECT * FROM locacao;