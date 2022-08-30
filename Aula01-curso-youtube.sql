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


INSERT INTO estado ( nome, sigla, ativo, data_cadastro) VALUES ("Paraná", "PR", 'S', '2022-08-24');
INSERT INTO estado (nome, sigla, ativo, data_cadastro) VALUES ("São Paulo", "SP", 'S', '2022-08-24');

INSERT INTO estado (nome, sigla) VALUES ("Mato Grosso", "MT");
INSERT INTO estado (nome, sigla) VALUES ("Amazonas", "AM");

SELECT * FROM estado;

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

INSERT INTO cidade(nome, estado_id) VALUES ("Nova Esperança", 1);
INSERT INTO cidade(nome, estado_id) VALUES ("Maringá", 1);
INSERT INTO cidade(nome, estado_id) VALUES ("Paranavaí", 1);

CREATE TABLE fornecedor (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  cnpj VARCHAR(20) NOT NULL,
  telefone VARCHAR(15) NOT NULL,
  contato VARCHAR(20) NOT NULL,
  ativo CHAR(1) NOT NULL DEFAULT 'S',
  data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP,
  cidade_id INT NOT NULL,
  CONSTRAINT fk_fornecedor_cidade FOREIGN KEY (cidade_id) REFERENCES cidade (id)
);
  
INSERT INTO fornecedor(nome, cnpj, telefone, contato, cidade_id) VALUES('Misael', '10000000', '446659898', 'emaill',1);
INSERT INTO fornecedor(nome, cnpj, telefone, contato, cidade_id) VALUES('Amanda', '10000000', '446659898', 'emaill',2);

CREATE TABLE funcionario (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  cpf VARCHAR(15) NOT NULL,
  endereco VARCHAR(100) NOT NULL,
  ativo CHAR(1) NOT NULL DEFAULT 'S',
  data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP,
  cidade_id INT NOT NULL,
  CONSTRAINT fk_funcionario_cidade FOREIGN KEY (cidade_id) REFERENCES cidade (id)
);
  
INSERT INTO funcionario(nome, cpf, endereco, cidade_id)VALUES('Misael', '009919292', 'rua mil e duzentos', 1);
INSERT INTO funcionario(nome, cpf, endereco, cidade_id)VALUES('Fernando', '009919292', 'rua mil e duzentos', 2);

CREATE TABLE telefone (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  descricao VARCHAR(100) NOT NULL,
  telefone VARCHAR(15) NOT NULL,
  ativo CHAR(1) NOT NULL DEFAULT 'S',
  data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP,
  funcionario_id INT NOT NULL,
  CONSTRAINT fk_telefone_funcionario FOREIGN KEY (funcionario_id) REFERENCES funcionario (id)
);

INSERT INTO telefone(descricao, telefone, funcionario_id)VALUES('testando telefone', '4432334455', 1);
INSERT INTO telefone(descricao, telefone, funcionario_id)VALUES('Esse número pertence', '4432334455', 2);

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

INSERT INTO cliente(nome, cpf_cnpj, telefone, contato, cidade_id)VALUES('Pedro', '121323232','4466559888', 'contato@contato', 1);
INSERT INTO cliente(nome, cpf_cnpj, telefone, contato, cidade_id)VALUES('Armando', '88555599','12325665', 'contato@contato', 2);

/*SELECT * FROM cidade;
  
#Aula 03
ALTER TABLE estado ADD COLUMN regiao INT;

SELECT * FROM estado;

DESCRIBE estado;
DESC estado;

ALTER TABLE estado MODIFY COLUMN regiao VARCHAR(100) NOT NULL;

ALTER TABLE estado DROP COLUMN regia_estado;

ALTER TABLE estado ADD COLUMN regiao VARCHAR(100) NOT NULL DEFAULT 'Valor não informado';

ALTER TABLE estado MODIFY COLUMN regiao_estado VARCHAR(100) NOT NULL AFTER sigla;

ALTER TABLE estado CHANGE regiao regiao_estado VARCHAR(100) NOT NULL;

ALTER TABLE estado DROP CONSTRAINT coluna_ativo_deve_ser_S_ou_N;

ALTER TABLE estado MODIFY COLUMN ativo ENUM('S', 'N') NOT null;

INSERT INTO estado (nome, sigla, ativo) VALUES ('Mato Grosso', 'MT', 'A'); */
 

