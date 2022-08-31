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

INSERT INTO estado (nome,sigla) VALUES ('PARANA','PR');
INSERT INTO estado (nome,sigla) VALUES ('SÃO PAULO','SP');
INSERT INTO estado (nome,sigla) VALUES ('MATO GROSSO','MT');
INSERT INTO estado (nome,sigla) VALUES ('SANTA CATARINA','SC');
INSERT INTO estado (nome,sigla) VALUES ('RIO GRANDE DO SUL','RS');

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
  
INSERT INTO cidade (nome, estado_id) VALUES ('Nova Esperança',2);
INSERT INTO cidade (nome, estado_id) VALUES ('MARINGÁ',1);
INSERT INTO cidade (nome, estado_id) VALUES ('Alto Paraná',2);
INSERT INTO cidade (nome, estado_id) VALUES ('Londrina',2);
INSERT INTO cidade (nome, estado_id) VALUES ('Jundiaí',4);
INSERT INTO cidade (nome, estado_id) VALUES ('Salvador',1);
INSERT INTO cidade (nome, estado_id) VALUES ('Curitiba',3);
INSERT INTO cidade (nome, estado_id) VALUES ('Florai',4);
INSERT INTO cidade (nome, estado_id) VALUES ('Mandaguaçu',1);
INSERT INTO cidade (nome, estado_id) VALUES ('Loanda',1);
INSERT INTO cidade (nome, estado_id) VALUES ('Joinvile',4);
INSERT INTO cidade (nome, estado_id) VALUES ('Porto Alegre',5);
INSERT INTO cidade (nome, estado_id) VALUES ('Florianópolis',4);
INSERT INTO cidade (nome, estado_id) VALUES ('Belo Horizonte',3);
INSERT INTO cidade (nome, estado_id) VALUES ('Chapecó',4);
INSERT INTO cidade (nome, estado_id) VALUES ('Bombinhas',4);

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
INSERT INTO cliente(nome, cpf_cnpj, telefone, contato, cidade_id)VALUES('Matheus', '121323232','1212121212', 'contato@contato', 2);
INSERT INTO cliente(nome, cpf_cnpj, telefone, contato, cidade_id)VALUES('Juca', '121323232','3243443', 'contato@contato', 3);
INSERT INTO cliente(nome, cpf_cnpj, telefone, contato, cidade_id)VALUES('Rebeca', '121323232','32343545', 'contato@contato', 2);
INSERT INTO cliente(nome, cpf_cnpj, telefone, contato, cidade_id)VALUES('Ana', '121323232','656543', 'contato@contato', 1);
INSERT INTO cliente(nome, cpf_cnpj, telefone, contato, cidade_id)VALUES('Julia', '121323232','32323', 'contato@contato', 3);
INSERT INTO cliente(nome, cpf_cnpj, telefone, contato, cidade_id)VALUES('Alice', '121323232','4343434', 'contato@contato', 4);
INSERT INTO cliente(nome, cpf_cnpj, telefone, contato, cidade_id)VALUES('Eude', '121323232','323232', 'contato@contato', 1);
INSERT INTO cliente(nome, cpf_cnpj, telefone, contato, cidade_id)VALUES('Marcos', '121323232','3232323', 'contato@contato', 2);
INSERT INTO cliente(nome, cpf_cnpj, telefone, contato, cidade_id)VALUES('Thiago', '121323232','665656', 'contato@contato', 1);
INSERT INTO cliente(nome, cpf_cnpj, telefone, contato, cidade_id)VALUES('Roney', '121323232','9089', 'contato@contato', 2);
INSERT INTO cliente(nome, cpf_cnpj, telefone, contato, cidade_id)VALUES('Zecarlos', '121323232','989898989', 'contato@contato', 1);
INSERT INTO cliente(nome, cpf_cnpj, telefone, contato, cidade_id)VALUES('Amanda', '121323232','76765454', 'contato@contato', 3);
INSERT INTO cliente(nome, cpf_cnpj, telefone, contato, cidade_id)VALUES('Gustavo', '121323232','7675434', 'contato@contato', 1);
INSERT INTO cliente(nome, cpf_cnpj, telefone, contato, cidade_id)VALUES('Keila', '121323232','5453232545', 'contato@contato', 3);
INSERT INTO cliente(nome, cpf_cnpj, telefone, contato, cidade_id)VALUES('Rita', '121323232','8789897', 'contato@contato', 1);
INSERT INTO cliente(nome, cpf_cnpj, telefone, contato, cidade_id)VALUES('Rogerio', '121323232','76765645', 'contato@contato', 3);
INSERT INTO cliente(nome, cpf_cnpj, telefone, contato, cidade_id)VALUES('Jose', '121323232','878989676', 'contato@contato', 1);
INSERT INTO cliente(nome, cpf_cnpj, telefone, contato, cidade_id)VALUES('Willian', '121323232','67676767', 'contato@contato', 1);
INSERT INTO cliente(nome, cpf_cnpj, telefone, contato, cidade_id)VALUES('Vinicius', '121323232','7679895', 'contato@contato', 1);
INSERT INTO cliente(nome, cpf_cnpj, telefone, contato, cidade_id)VALUES('Misael', '121323232','767556454', 'contato@contato', 1);
INSERT INTO cliente(nome, cpf_cnpj, telefone, contato, cidade_id)VALUES('Gustavo', '121323232','656565', 'contato@contato', 1);
INSERT INTO cliente(nome, cpf_cnpj, telefone, contato, cidade_id)VALUES('Pedro', '121323232','6565656', 'contato@contato', 1);
INSERT INTO cliente(nome, cpf_cnpj, telefone, contato, cidade_id)VALUES('Matheus', '121323232','65664534', 'contato@contato', 1);
INSERT INTO cliente(nome, cpf_cnpj, telefone, contato, cidade_id)VALUES('Juca', '121323232','0908787', 'contato@contato', 1);
INSERT INTO cliente(nome, cpf_cnpj, telefone, contato, cidade_id)VALUES('Rebeca', '121323232','09078787', 'contato@contato', 1);
INSERT INTO cliente(nome, cpf_cnpj, telefone, contato, cidade_id)VALUES('Ana', '121323232','1412212', 'contato@contato', 1);
INSERT INTO cliente(nome, cpf_cnpj, telefone, contato, cidade_id)VALUES('Julia', '121323232','3232323', 'contato@contato', 1);
INSERT INTO cliente(nome, cpf_cnpj, telefone, contato, cidade_id)VALUES('Alice', '121323232','3232323', 'contato@contato', 1);
INSERT INTO cliente(nome, cpf_cnpj, telefone, contato, cidade_id)VALUES('Eude', '121323232','3236565', 'contato@contato', 1);
INSERT INTO cliente(nome, cpf_cnpj, telefone, contato, cidade_id)VALUES('Marcos', '121323232','645454545', 'contato@contato', 1);
INSERT INTO cliente(nome, cpf_cnpj, telefone, contato, cidade_id)VALUES('Thiago', '121323232','68989898', 'contato@contato', 1);
INSERT INTO cliente(nome, cpf_cnpj, telefone, contato, cidade_id)VALUES('Roney', '121323232','5454523312', 'contato@contato', 1);
INSERT INTO cliente(nome, cpf_cnpj, telefone, contato, cidade_id)VALUES('Zecarlos', '121323232','2121212', 'contato@contato', 1);
INSERT INTO cliente(nome, cpf_cnpj, telefone, contato, cidade_id)VALUES('Amanda', '121323232','21212545', 'contato@contato', 1);
INSERT INTO cliente(nome, cpf_cnpj, telefone, contato, cidade_id)VALUES('Gustavo', '121323232','54512121', 'contato@contato', 1);
INSERT INTO cliente(nome, cpf_cnpj, telefone, contato, cidade_id)VALUES('Keila', '121323232','878787845', 'contato@contato', 1);
INSERT INTO cliente(nome, cpf_cnpj, telefone, contato, cidade_id)VALUES('Rita', '121323232','77777777', 'contato@contato', 1);
INSERT INTO cliente(nome, cpf_cnpj, telefone, contato, cidade_id)VALUES('Rogerio', '121323232','888888888', 'contato@contato', 1);
INSERT INTO cliente(nome, cpf_cnpj, telefone, contato, cidade_id)VALUES('Jose', '121323232','777777755', 'contato@contato', 1);
INSERT INTO cliente(nome, cpf_cnpj, telefone, contato, cidade_id)VALUES('Willian', '121323232','6666666663', 'contato@contato', 1);
INSERT INTO cliente(nome, cpf_cnpj, telefone, contato, cidade_id)VALUES('Vinicius', '121323232','333333333335', 'contato@contato', 1);
INSERT INTO cliente(nome, cpf_cnpj, telefone, contato, cidade_id)VALUES('Misael', '43434','1111111111', 'contato@contato', 1);
INSERT INTO cliente(nome, cpf_cnpj, telefone, contato, cidade_id)VALUES('Gustavo', '4343434','22222222', 'contato@contato', 1);

#9.Escreva o comando para alterar o valor de uma coluna de um único registro de uma tabela utilizando como filtro, o Primary Key.

UPDATE estado SET nome ='Misael' WHERE id = 2;

#10. Refaça o exercício anterior alterando os dados de mais que uma coluna de um único registro sem utilizar como filtro a chave primária. A escolha da coluna do filtro é muito importante – TOME CUIDADO.
UPDATE estado SET nome = 'Acre', sigla = 'AC' WHERE sigla = 'PR';


#11. Alter o valor de uma coluna de todos os registros.
UPDATE cidade SET data_cadastro = '2022-08-30' WHERE id >= 1;
UPDATE cidade SET ativo = 'N' WHERE id >= 1;

#12.Exclua um único registro de uma tabela sem utilizar como filtro, a chave primária.
DELETE FROM cliente WHERE cidade_id = 2;
DELETE FROM cidade WHERE nome = 'MARINGÁ';

#13.Escreva todos os comandos necessários para excluir o cliente com o id “38”.
DELETE FROM cliente WHERE id = 38;
