CREATE DATABASE jogos;

USE jogos;

CREATE TABLE jogo (
	id_jogo INT PRIMARY KEY AUTO_INCREMENT,
    nome_jogo VARCHAR(50) NOT NULL,
    genero_jogo VARCHAR(50) NOT NULL,
    preco_jogo VARCHAR(10) NOT NULL
);

SELECT * FROM jogo;