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

#5. Escreva o comando para inserir 3 registros da tabela estado com todas as colunas. 

INSERT INTO estado (id,nome,sigla,ativo, data_cadastro) VALUES (1,'Minas Gerais','MG', 'S', '2022-08-31');
INSERT INTO estado (id,nome,sigla,ativo, data_cadastro) VALUES (2,'São Paulo','SP', 'S', '2022-08-31');
INSERT INTO estado (id,nome,sigla,ativo, data_cadastro) VALUES (3,'MATO GROSSO','MT', 'S', '2022-08-');

#6. Escreva o comando para inserir 2 registros da tabela estado, definindo todos os dados, exceto a chave  primária que é auto incremento. 

INSERT INTO estado (nome,sigla,ativo, data_cadastro) VALUES ('Bahia','BH', 'S', '2022-08-31');
INSERT INTO estado (nome,sigla,ativo, data_cadastro) VALUES ('Ceará','CE', 'S', '2022-08-31');

#7. Escreva o comando para inserir 2 registros da tabela estado, definindo somente os dados necessários. 

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


#8. Escreva o comando para inserir registros da tabela cidade das 3 formas apresentadas nos exercícios  anteriores.  

INSERT INTO cidade (id, nome, estado_id, data_cadastro) VALUES (1,'BAURU',1, '2022-08-31');
INSERT INTO cidade (id, nome, estado_id, data_cadastro) VALUES (2,'Campinas',1, '2022-08-31');
INSERT INTO cidade (id, nome, estado_id, data_cadastro) VALUES (3,'Salvador',2, '2022-08-31');

INSERT INTO cidade (nome, estado_id, data_cadastro) VALUES ('Londrina',1, '2022-08-31');
INSERT INTO cidade (nome, estado_id, data_cadastro) VALUES ('Nova Esperança',2, '2022-08-31');

INSERT INTO cidade (nome, estado_id) VALUES ('MARINGÁ',1);
INSERT INTO cidade (nome, estado_id) VALUES ('GUARULHOS',2);

CREATE TABLE cliente (
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100) NOT NULL,
cpf_cnpj VARCHAR(15) NOT NULL,
telefone VARCHAR(100) NOT NULL,
contato VARCHAR(20) NOT NULL,
ativo CHAR(1) NOT NULL DEFAULT 'S',
data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP,
cidade_id INT NOT NULL,
CONSTRAINT fk_cliente_cidade FOREIGN KEY (cidade_id) REFERENCES cidade (id)
);

#9. Faça a inserção de 2 registros de cliente.  

INSERT INTO cliente(nome, cpf_cnpj, telefone, contato, cidade_id)VALUES('Pedro', '121323232','4466559888', 'contato@contato', 1);
INSERT INTO cliente(nome, cpf_cnpj, telefone, contato, cidade_id)VALUES('Matheus', '11111111','1212121212', 'contato@contato', 2);


#10. DESAFIO!!! Tente fazer todas as inserções necessárias para que se tenha um item de caixa. Na medida  que esteja digitando o código, tente associar os dados inseridos com o contexto real.
