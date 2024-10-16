CREATE DATABASE cadastro_pets;

USE cadastro_pets;

CREATE TABLE cliente(
	id_cadastro INT PRIMARY KEY AUTO_INCREMENT,
	nome_cliente VARCHAR(50) NOT NULL,
    cpf_cliente VARCHAR(11) NOT NULL,
    telefone VARCHAR(11) NOT NULL,
    e_mail VARCHAR(50) NOT NULL,
    servico_contratado VARCHAR(50) NOT NULL,
    cep VARCHAR(8) NOT NULL,
    numero_casa VARCHAR(4) NOT NULL,
    rua VARCHAR(50) NOT NULL,
    bairro VARCHAR(30) NOT NULL,
    cidade VARCHAR(30) NOT NULL,
    complemento VARCHAR(100) NOT NULL,
    
    nome_pet VARCHAR(50) NOT NULL,
    especie_pet VARCHAR(25) NOT NULL,
    raca_pet VARCHAR(25) NOT NULL,
    porte_pet VARCHAR(25) NOT NULL,
    cor_pet VARCHAR(15) NOT NULL,
    sexo_pet VARCHAR(15) NOT NULL,
    descricao_comportamento_pet VARCHAR(100) NOT NULL,
    saude_pet VARCHAR(100) NOT NULL,
    alergias_pet VARCHAR(100) NOT NULL,
    requisitos_especiais_pet VARCHAR(100),
    informacoes_alimentacao_pet VARCHAR(100),
    interacao_social_pet VARCHAR(100)
);

SELECT * FROM cliente;