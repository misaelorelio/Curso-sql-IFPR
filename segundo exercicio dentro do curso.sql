DROP DATABASE IF EXISTS aula_banco;
CREATE DATABASE aula_banco;
USE aula_banco;

CREATE TABLE estado ( 
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(200) NOT NULL UNIQUE,
sigla CHAR(2) NOT NULL UNIQUE,
ativo CHAR(1) NOT NULL DEFAULT 'S',
data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
CONSTRAINT coluna_ativo_deve_ser_S_ou_N CHECK (ativo IN ('S', 'N'))
);

INSERT INTO estado (id,nome,sigla,ativo, data_cadastro) VALUES (1,'Minas Gerais','MG', 'S', '2022-08-31');
INSERT INTO estado (id,nome,sigla,ativo, data_cadastro) VALUES (2,'São Paulo','SP', 'S', '2022-08-31');
INSERT INTO estado (id,nome,sigla,ativo, data_cadastro) VALUES (3,'MATO GROSSO','MT', 'S', '2022-08-');

INSERT INTO estado (nome,sigla,ativo, data_cadastro) VALUES ('Bahia','BH', 'S', '2022-08-31');
INSERT INTO estado (nome,sigla,ativo, data_cadastro) VALUES ('Ceará','CE', 'S', '2022-08-31');


INSERT INTO estado (nome,sigla) VALUES ('Rio Grande do Sul','RS');
INSERT INTO estado (nome,sigla) VALUES ('Rio de Janeiro','RJ');


CREATE TABLE cidade (
  id INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(200) NOT NULL,
  data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  ativo CHAR(1) NOT NULL DEFAULT 'S',
  PRIMARY KEY (id),
  estado_id INT NOT NULL,
  CONSTRAINT fk_cidade_estado FOREIGN KEY (estado_id) REFERENCES estado (id),
  CONSTRAINT cidade_ativo_deve_ser_S_ou_N CHECK (ativo IN ('S', 'N')),
  CONSTRAINT cidade_unica UNIQUE(nome, estado_id)
  );
  
INSERT INTO cidade (id, nome, estado_id, data_cadastro) VALUES (1,'BAURU',1, '2022-08-31');
INSERT INTO cidade (id, nome, estado_id, data_cadastro) VALUES (2,'MARINGÁ',1, '2022-08-31');
INSERT INTO cidade (id, nome, estado_id, data_cadastro) VALUES (3,'GUARULHOS',2, '2022-08-31');

INSERT INTO cidade (nome, estado_id, data_cadastro) VALUES ('MARINGÁ',1, '2022-08-31');
INSERT INTO cidade (nome, estado_id, data_cadastro) VALUES ('GUARULHOS',2, '2022-08-31');

INSERT INTO cidade (nome, estado_id) VALUES ('MARINGÁ',1);
INSERT INTO cidade (nome, estado_id) VALUES ('GUARULHOS',2);


#9.	Escreva o comando para alterar o valor de uma coluna de um único registro de uma tabela utilizando como filtro, o Primary Key.

UPDATE estado SET nome ='Misael' WHERE id = 2;
SELECT * FROM cidade;

#10. Refaça o exercício anterior alterando os dados de mais que uma coluna de um único registro sem utilizar como filtro a chave primária. A escolha da coluna do filtro é muito importante – TOME CUIDADO.
UPDATE estado SET nome = 'Acre', sigla = 'AC' WHERE sigla = 'PR';


#11. Alter o valor de uma coluna de todos os registros.
UPDATE cidade SET data_cadastro = '2022-08-30' WHERE id >= 1;
UPDATE cidade SET ativo = 'N' WHERE id >= 1;

#12.Exclua um único registro de uma tabela sem utilizar como filtro, a chave primária.
DELETE FROM cidade WHERE nome = 'BAURU';

#13.Escreva todos os comandos necessários para excluir o cliente com o id “38”.
	#não entendi, era para criar o cliente também?
