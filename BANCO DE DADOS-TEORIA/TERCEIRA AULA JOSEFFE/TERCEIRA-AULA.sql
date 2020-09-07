use db_blackboard;

show create table tb_professor;/*Comando serve para retornar o script de criação da tabela*/

/*Banco de dados que estamos usando = MySql*/
/*Sql = linguagem que trabalho no banco de dados*/
/*IDE = workbench*/

 select* from tb_professor /*Comando utilizado para ver o conteudo que tem dentro da minha tabela*/
/*Selecione tudo para mim da tabela professor*/

/*Comando para inserir dados na tabela*/
insert into tb_professor (id, nome, telefone) values ( 1 ,' kiemi', "13010101011");

update tb_professor /*Modifique a tabela tb_professor,*/
set nome ='Bruno' /*configurando o nome para Bruno,*/
where id ='2';/*onde o id e igual a 1*/

SET SQL_SAFE_UPDATES = 0;/*Variavel global do MySql,estou desativando e uma proteção do mysql*/

/*Caso eu queira ver um registro especifico faço o seguinte*/
select* from tb_professor
where id=1;

/*ou assim também,que vai mostrar somente nome e id*/
select id,
	   nome
       from tb_professor
       where id = 1;