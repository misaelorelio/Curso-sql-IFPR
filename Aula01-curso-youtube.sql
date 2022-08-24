DROP DATABASE IF EXISTS aula_banco;
CREATE DATABASE aula_banco;
USE aula_banco;

DROP TABLE IF EXISTS estado;

CREATE TABLE estado ( 
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(200) NOT NULL UNIQUE,
sigla CHAR(2) NOT NULL UNIQUE,
ativo CHAR(1) NOT NULL DEFAULT 'S',
data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
CONSTRAINT coluna_ativo_deve_ser_S_ou_N CHECK (ativo IN ('S', 'N'))
);


INSERT INTO estado (id, nome, sigla, ativo, data_cadastro) VALUES (2, "Paraná", "PR", 'S', '2022-08-24');
INSERT INTO estado (id, nome, sigla, ativo, data_cadastro) VALUES (3, "São Paulo", "SP", 'S', '2022-08-24');

INSERT INTO estado (nome, sigla) VALUES ("Paraná", "PR");
INSERT INTO estado (nome, sigla) VALUES ("São Paulo", "SP");

SELECT * FROM estado;