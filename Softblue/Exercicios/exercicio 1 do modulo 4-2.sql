/*CRIANDO O BANCO DE DADOS*/
create database softblue default charset=latin1;

/*DELETAR UM BANCO DE DADOS*/
Drop database softblue;

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
foreign key(instrutor) references instrutor(codigo)/*O CAMPO INSTRUTOR SERÁ UMA CHAVE ESTRANGEIRA QUE IRA SE RELACIONAR COM A TABELA "INSTRUTOR" 
DE CAMPO "CODIGO"*/
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

show tables;
select*from aluno;
describe aluno;

-- Inclua a coluna DATA_NASCIMENTO na tabela ALUNO do tipo string,de tamanho 10 caracteres--
ALTER TABLE aluno ADD data_nascimento VARCHAR(10);

/*Mostrar o que tem dentro da minha tabela*/
select*from aluno;

-- Altere a coluna DATA_NASCIMENTO para NASCIMENTO e seu tipo de dado para DATE --
alter table aluno change data_nascimento nascimento date null;

-- Crie um novo índice na tabela ALUNO, para o campo ALUNO --
alter table aluno add index index_aluno(aluno);

describe instrutor;

-- Inclua a coluna email na tabela INSTRUTOR do tipo string,de tamanho 100caracteres--
ALTER TABLE INSTRUTOR ADD EMAIL VARCHAR(100);

describe curso;index_aluno
-- Crie um novo índice na tabela CURSO, para o campo INSTRUTOR
--
ALTER TABLE curso ADD INDEX INDEX_INSTRUTOR(INSTRUTOR);

--
-- Remova o campo EMAIL da tabela INSTRUTOR
--
ALTER TABLE INSTRUTOR DROP EMAIL;

-- INSERINDO DADOS NA TABELA TIPO --

insert into tipo(tipo) values('Banco de dados'),
							 ('Programação'),
                             ('Modelagem de dados');
                             
select*from tipo;

describe instrutor;

insert into instrutor(instrutor,telefone) values('André Milani','1111-1111'),
												('Carlos Tosin','1212-1212');
                                                
select*from curso;

insert into curso(curso,tipo,instrutor,valor) values('Java Fundamentos','2','2','270'),
												    ('Java Avançado','2','2','330'),
                                                    ('SQL Completo','1','1','170'),
                                                    ('Php Básico','2','1','272');
                                                    
select*from aluno;

insert into aluno(aluno,endereco,email) values(' José',' Rua XV de Novembro 72','jose@softblue.com.br'),
												    (' Wagner',' Av. Paulista','wagner@softblue.com.br'),
                                                    (' Emílio',' Rua Lajes 103, ap: 701','emilio@softblue.com.br'),
                                                    (' Cris',' Rua Tauney 22','cris@softblue.com.br'),
                                                    (' Regina',' Rua Salles 305','regina@softblue.com.br'),
                                                    (' Fernando',' Av. Central 30','fernando@softblue.com.br');
                                                
                                                
select*from pedido;
desc pedido;

insert into pedido(aluno,datahora) values(' 2','15/04/2010 11:23:32'),
										(' 2','15/04/2010  14:36:21'),
										(' 3','16/04/2010  11:17:45'),
                                        (' 4','17/04/2010  14:27:22'),
                                        (' 5','18/04/2010  11:18:19'),
										(' 6','19/04/2010  13:47:35'),
                                        (' 6','20/04/2010  18:13:44');
                                        
                                        -- Tabela PEDIDO:
--
INSERT INTO PEDIDO (CODIGO, ALUNO, DATAHORA) VALUES (1, 2, '2010-04-15 11:23:32');
INSERT INTO PEDIDO VALUES (2, 2, '2010-04-15 14:36:21');
INSERT INTO PEDIDO VALUES (3, 3, '2010-04-16 11:17:45');
INSERT INTO PEDIDO VALUES (4, 4, '2010-04-17 14:27:22');
INSERT INTO PEDIDO VALUES (5, 5, '2010-04-18 11:18:19');
INSERT INTO PEDIDO VALUES (6, 6, '2010-04-19 13:47:35');
INSERT INTO PEDIDO VALUES (7, 6, '2010-04-20 18:13:44');

desc pedido_detalhe;
select*from pedido_detalhe;

insert into pedido_detalhe(pedido,curso,valor) values(1,1,'270'),
										(1,2,'330'),
										(' 2','1',270),
                                        (' 2','2',330),
                                        (' 2','3',170),
										(' 3','4',270),
                                        (' 4','2',330),
										(' 4','4',270),
                                        (' 5','3',170),
										(' 6','3',170),
                                        (' 7','4',270);
                                        
/*Exibir todas as informações de todos os alunos;*/                                        
select*from aluno;

-- Exibir somente o título de cada curso da Softblue --
select * from curso;

SELECT CURSO, VALOR FROM CURSO WHERE VALOR > 200;

select a.pedido,
	   a.curso,
       b.nome
       from pedido_detalhe a left join curso b on (a.id_banco = b.id)
