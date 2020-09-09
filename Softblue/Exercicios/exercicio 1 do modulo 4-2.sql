/*CRIANDO O BANCO DE DADOS*/
create database softblue default charset=latin1;

/*SELECIONANDO O BANCO DE DADOS*/
use softblue;

/*Criando a tabela TIPO*/
create table tipo(
codigo int unsigned not null auto_increment,
tipo varchar(32) not null,
primary key(codigo)								/*Define o campo CODIGO como PK (Primary Key)*/
);

/*Criando a tabela iNSTRUTOR*/
create table instrutor(
codigo int unsigned not null auto_increment,
instrutor varchar(64) not null,					/*Nome com até 64 caracteres*/
telefone varchar(9) null,						/*Telefone, podendo ser nulo caso não tenha*/
primary key(codigo)								/*Define o campo CODIGO como PK (Chave primaria)*/
);

/*Criando a tabela Curso*/
create table curso(
codigo int unsigned not null auto_increment,
curso varchar(64) not null,						
tipo int unsigned not null,						/*Codigo do tipo de curso (idêntico a Chave primaria na tabela curso)*/
instrutor int unsigned not null,				/*Codigo do instrutor (idêntico a Chave primaria na tabela Instrutor)*/
valor double not null,							/*Valor do curso*/
primary key(codigo),							/*O campo codigo será uma chave primaria*/
Index fk_tipo(tipo),							/*Define o campo tipo como um indice*/
index fk_instrutor(instrutor),					/*Define o campo instrutor como um indice*/
foreign key(tipo) references tipo(codigo),		/*O campo tipo será uma chave estrangeira que ira se relacionar com a tabela "tipo" campo "codigo"*/
foreign key(instrutor) references instrutor(codigo)/*O CAMPO INSTRUTOR SERÁ UMA CHAVE ESTRANGEIRA QUE IRA SE RELACIONAR COM A TABELA "INSTRUTOR" DE CAMPO "CODIGO"*/
);

-- Cria a tabela ALUNO
--
CREATE TABLE ALUNO (
	CODIGO INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,	-- Código interno (PK)
	ALUNO VARCHAR(64) NOT NULL,				-- Nome com até 64 caracteres
	ENDERECO VARCHAR(230) NOT NULL,				-- Endereço com até 230 caracteres
	EMAIL VARCHAR(128) NOT NULL,				-- E-mail com até 128 caracteres
	PRIMARY KEY(CODIGO)					-- Define o campo CODIGO como PK (Primary Key)
);

-- Cria a tabela PEDIDO
--
CREATE TABLE PEDIDO (
	CODIGO INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,	-- Código interno (PK)
	ALUNO INTEGER UNSIGNED NOT NULL,			-- Código do aluno (idêntico a PK em ALUNO)
	DATAHORA DATETIME NOT NULL,				-- Armazena data e hora em uma única coluna
	PRIMARY KEY(CODIGO),					-- Define o campo CODIGO como PK (Primary Key)
	INDEX FK_ALUNO(ALUNO),					-- Define o campo ALUNO como um índice
	FOREIGN KEY(ALUNO) REFERENCES ALUNO(CODIGO)		-- Cria o relacionamento (FK) com a tabela ALUNO
);

-- Cria a tabela PEDIDO_DETALHE
--
CREATE TABLE PEDIDO_DETALHE (
	PEDIDO INTEGER UNSIGNED NOT NULL,			-- Código do pedido (idêntico a PK em PEDIDO)
	CURSO INTEGER UNSIGNED NOT NULL,			-- Código do curso (idêntico a PK em CURSO)
	VALOR DOUBLE NOT NULL,					-- Valor do curso
	INDEX FK_PEDIDO(PEDIDO),				-- Define o campo ALUNO como um índice
	INDEX FK_CURSO(CURSO),					-- Define o campo ALUNO como um índice
	PRIMARY KEY(PEDIDO, CURSO),				-- Define a chave primária composta
	FOREIGN KEY(PEDIDO) REFERENCES PEDIDO(CODIGO),		-- Cria o relacionamento (FK) com a tabela PEDIDO
	FOREIGN KEY(CURSO) REFERENCES CURSO(CODIGO)		-- Cria o relacionamento (FK) com a tabela CURSO
);

-- Inclua a coluna DATA_NASCIMENTO na tabela ALUNO do tipo string,de tamanho 10 caracteres--
ALTER TABLE aluno ADD data_nascimento VARCHAR(10);

/*Mostrar o que tem dentro da minha tabela*/
select*from aluno;

-- Altere a coluna DATA_NASCIMENTO para NASCIMENTO e seu tipo de dado para DATE --
alter table aluno change data_nascimento nascimento date null;

-- Crie um novo índice na tabela ALUNO, para o campo ALUNO --
alter table aluno add index index_aluno(aluno);

-- Inclua a coluna email na tabela INSTRUTOR do tipo string,de tamanho 100caracteres--
ALTER TABLE INSTRUTOR ADD EMAIL VARCHAR(100);

-- Crie um novo índice na tabela CURSO, para o campo INSTRUTOR
--
ALTER TABLE CURSO ADD INDEX INDEX_INSTRUTOR(INSTRUTOR);

--
-- Remova o campo EMAIL da tabela INSTRUTOR
--
ALTER TABLE INSTRUTOR DROP EMAIL;