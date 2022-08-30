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

CREATE TABLE venda (
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
desconto DECIMAL(8,2) NOT NULL,
total_com_desconto DECIMAL(8,2) NOT NULL,
ativo CHAR(1) NOT NULL DEFAULT 'S',
data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP,
cliente_id INT NOT NULL,
CONSTRAINT fk_venda_cliente FOREIGN KEY (cliente_id) REFERENCES cliente (id)
);

INSERT INTO venda(desconto, total_com_desconto, cliente_id)VALUES(10.6, 150.66, 1);
INSERT INTO venda(desconto, total_com_desconto, cliente_id)VALUES(10.6, 150.66, 1);

CREATE TABLE compra (
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
desconto DECIMAL(8,2) NOT NULL,
total_com_desconto DECIMAL(8,2) NOT NULL,
ativo CHAR(1) NOT NULL DEFAULT 'S',
data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP,
fornecedor_id INT NOT NULL,
CONSTRAINT fk_compra_fornecedor FOREIGN KEY (fornecedor_id) REFERENCES fornecedor (id)
);

INSERT INTO compra(desconto, total_com_desconto, fornecedor_id)VALUES(100.00, 1500.66, 1);
INSERT INTO compra(desconto, total_com_desconto, fornecedor_id)VALUES(1000, 15000.00, 2);

CREATE TABLE produto (
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100) NOT NULL,
descricao VARCHAR(100) NOT NULL,
preco DECIMAL(8,2) NOT NULL,
estoque INT NOT NULL,
ativo CHAR(1) NOT NULL DEFAULT 'S',
data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO produto(nome, descricao, preco, estoque)VALUES('Celular', 'novo', 1000.22, 30);
INSERT INTO produto(nome, descricao, preco, estoque)VALUES('Notebook', '16gb', 5000.22, 5);

CREATE TABLE item_compra (
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
quantidade INT NOT NULL,
preco DECIMAL(8,2) NOT NULL,
compra_id INT NOT NULL,
produto_id INT NOT NULL,
CONSTRAINT fk_compra_item_compra FOREIGN KEY (compra_id) REFERENCES compra (id),
CONSTRAINT fk_produto_item_compra FOREIGN KEY (produto_id) REFERENCES produto (id)
);

INSERT INTO item_compra(quantidade, preco, compra_id, produto_id)VALUES(1, 1000.22, 1, 1);
INSERT INTO item_compra(quantidade, preco, compra_id, produto_id)VALUES(1, 1000.22, 2, 2);

CREATE TABLE item_venda (
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
quantidade INT NOT NULL,
preco DECIMAL(8,2) NOT NULL,
venda_id INT NOT NULL,
produto_id INT NOT NULL,
CONSTRAINT fk_venda_item_venda FOREIGN KEY (venda_id) REFERENCES venda (id),
CONSTRAINT fk_produto_item_venda FOREIGN KEY (produto_id) REFERENCES produto (id)
);

INSERT INTO item_compra(quantidade, preco, compra_id, produto_id)VALUES(1, 1000.22, 1, 1);
INSERT INTO item_compra(quantidade, preco, compra_id, produto_id)VALUES(1, 1000.22, 2, 2);

CREATE TABLE categoria (
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(255) NOT NULL,
descricao VARCHAR(255) NOT NULL,
ativo CHAR(1) NOT NULL DEFAULT 'S',
data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO categoria(nome, descricao)VALUES('Eletrônicos', 'Eletrônicos pequenos');
INSERT INTO categoria(nome, descricao)VALUES('Papelaria', 'Cadernos');

CREATE TABLE produto_categoria (
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
produto_id INT NOT NULL,
categoria_id INT NOT NULL,
ativo CHAR(1) NOT NULL DEFAULT 'S',
data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP,
CONSTRAINT fk_produto_produto_categoria FOREIGN KEY (produto_id) REFERENCES produto(id),
CONSTRAINT fk_categoria_produto_categoria FOREIGN KEY (categoria_id) REFERENCES categoria(id)
);

INSERT INTO produto_categoria(produto_id, categoria_id)VALUES(1,1);
INSERT INTO produto_categoria(produto_id, categoria_id)VALUES(1,2);

CREATE TABLE tipo (
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(255) NOT NULL,
descricao VARCHAR(255) NOT NULL,
ativo CHAR(1) NOT NULL DEFAULT 'S',
data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO tipo(nome, descricao)VALUES('Novos', 'Computador novo');
INSERT INTO tipo(nome, descricao)VALUES('Usados', 'Cadernos');

CREATE TABLE produto_tipo (
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
produto_id INT NOT NULL,
tipo_id INT NOT NULL,
ativo CHAR(1) NOT NULL DEFAULT 'S',
data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP,
CONSTRAINT fk_produto_produto_tipo FOREIGN KEY (produto_id) REFERENCES produto(id),
CONSTRAINT fk_tipo_produto_tipo FOREIGN KEY (tipo_id) REFERENCES tipo(id)
);

INSERT INTO produto_tipo(produto_id, tipo_id)VALUES(1,1);
INSERT INTO produto_tipo(produto_id, tipo_id)VALUES(1,2);

CREATE TABLE recebimento (
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
ativo CHAR(1) NOT NULL DEFAULT 'S',
valor DECIMAL(8,2) NOT NULL,
numero_parcelas INT NOT NULL,
desconto DECIMAL(8,2) NOT NULL,
juros DECIMAL(8,2) NOT NULL,
total_final  DECIMAL(8,2) NOT NULL,
venda_id INT NOT NULL,
CONSTRAINT fk_venda_recebimento FOREIGN KEY (venda_id) REFERENCES venda(id)
);

INSERT INTO recebimento(valor, numero_parcelas, desconto, juros, total_final, venda_id)VALUES(1000.36,3,35,5,1000,1);
INSERT INTO recebimento(valor, numero_parcelas, desconto, juros, total_final, venda_id)VALUES(1006.00,2,21,5,1000,2);

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
 

