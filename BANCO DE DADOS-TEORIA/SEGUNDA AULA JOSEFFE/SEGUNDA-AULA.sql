create database db_blackboard /*Comando para criar um banco de dados*/

create database db_aluno_net /*Criando outro banco de dados*/
/*Tenho 2 bancos de dados criados na minha instancia local,na minha instancia posso ter varios bancos de dados
,e dentro de cada um desses bancos eu posso criar tabelas*/

show databases /*Comando no mysql que mostra todos os bancos de dados criados*/

use db_blackboard /*Comando utilizado para selecionar o banco de dados*/

show tables /*Mostra as tabelas que eu tenho dentro do meu banco de dados selecionado
 que no caso e o db_blackboard*/
 
 select* from tb_professor /*Comando utilizado para ver o conteudo que tem dentro da minha tabela*/
/*Selecione tudo para mim da tabela professor*/

/*Outra forma de ver o que dentro da minha tabela*/
select id,
nome,
telefone
from tb_professor
 
 
 create table tb_professor/*Criando uma tabela chamada tb_professor no banco de dados db_blackboard*/
 (
 id       int            not null, /*Criando uma coluna dentro do banco de dados*/
 nome     varchar(255)   not null,
 telefone varchar(30)	 not null
 );
 
 
 /*Comando para inserir dados na tabela*/
insert into tb_professor (id, nome, telefone) values ( 1 ,' Joseffe', "13010101011");

/*Comando para inserir varias dados ao mesmo tempo na tabela*/
Insert into tb_professor 
(id, nome, telefone) 
values 
( 2 ,' Claudio', '13010101012'),
( 3 ,' MarceloSilvestre', '13010101013'),
( 4 ,' Machado', '13010101014'),
( 5 ,' Eduardo', '13010101016');

