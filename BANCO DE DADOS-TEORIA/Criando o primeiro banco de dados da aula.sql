creare database db_blackboard

use db_blackboard

create table tb_professor
(
id int auto_increment primary key not null 			/*Aqui e um campo*/
,nome varchar(255) not null							/*Aqui e um campo*/
,telefone varchar(30) not null						/*Aqui e um campo*/
)

drop table tb_professor

show tables

select * from tb_professor

delete from tb_professor
where id = 2

select id
	   ,nome
from tb_professor

'bruno' aspas simples não! -> apóstrofe
"bruno" aspas duplas não!  -> aspas

update

insert into tb_professor (id, nome, telefone) values (1 ,'Bruno','98847672');
insert into tb_professor (id, nome, telefone) values (1 ,'Joseffe','98848972');

insert into tb_professor (nome, telefone) values ('Bruno','98847672');

insert into tb_professor (id, nome, telefone) values (2 ,'João','98847672');
insert into tb_professor (id, nome, telefone) values (4 ,'Maria','98847672');


alter table tb_professor add column ra varchar(10) not null