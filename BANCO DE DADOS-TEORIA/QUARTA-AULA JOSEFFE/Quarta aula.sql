use db_blackboard

select*
from tb_professor

show tables

/*Quando estamos falando de insert,update,delete e select estamos falando de dml instruções que significa data manipulation language
ou seja uma manipulação de dados*/
/*Quando falamos de create,drop,alter estamos falando de DDL que e quando criamos um objeto*/

/*SEMPRE EVITAR DUPLICAR DADOS*/

/*INTEGRIDADE REFERENCIAL CRIA UMA CONEXÃO ENTRE 2 COLUNAS ONDE TUDO TEM NA PRIMEIRA TABELA TEM NA SEGUNDA*/

/*Primeiro sempre criar as tabelas que não tem dependencia com ninguem*/

create table tb_banco
(
id int auto_increment not null,
nome varchar(50) not null,
primary key(id)
);

/*Si colocar o cpf como int e errado porque não vou fazer conta,então sempre utilizo varchar*/
/*O id tem que ser int porque e um campo chave e uma exceção*/
/*No Banco de dados, null e ausencia de valor*/
create table tb_empregado
(
id int auto_increment not null,
nome varchar(255) not null,
cpf varchar(11) not null,
id_banco int null,
/*id_profissao int not null default "0",*/
primary key(id),
foreign key (id_banco) references tb_banco(id)
/*foreign key(id_profissao) references tb_profissao(id)*/
);

create table tb_profissao
(
id int auto_increment not null,
nome varchar(50) not null,
descricao varchar(255) not null,
primary key(id)
);

insert tb_profissao (nome,descricao) values ('Professor','lecionar disciplina da faculdade'),
							  ('Engenheiro','Projetar e ser responsavel por projetos'),
                              ('Diretor','head de um determinado setor'),
                              ('Analista de Sistemas','analisa e sugere soluções sistémicas')

select* from tb_profissao ;

insert tb_banco (nome) values ('Bradesco'),
							  ('Itau'),
                              ('Caixa')
                              
select* from tb_banco;

insert tb_empregado (nome, cpf, id_banco) values ('Bruno','007',1),
												 ('Joseffe','12345678910',null),
                                                 ('Renato','11109876543',2),
                                                 ('Amalia','10119874612',2),
                                                 ('Joaquim','20136547891',3),
                                                 ('Mariana','87456923107',null)
                                                 
select* from tb_empregado;


/*Para exibir o id do empregado o nome e o banco*/
/*Com o inner join não pega valores nulos*/
select a.id,
	   a.nome,
       b.nome
       from tb_empregado a inner join tb_banco b on (a.id_banco = b.id)
/*Explicação desse comando:Quero exibir o id e o nome do empregado e o nome do banco da tabela tb_banco eu coloco 
from especificando de que tabela vem,primeiro vem da tabela tb_empregado que tem relação com a tb_banco  e eu ja dou um apelido a 
ela que e um alias eu falo que ela vai ser a tabela "a" e eu coloco no id a porque vai vim da tabela a que e tb_empregado e tb_banco 
tbm vai ter um apelido que e 'b" e eu utilizo "on" para vincular uma com a outra e em seguida eu coloco a.id_banco que tb_empregado 
tem um campo chamado id_banco que está relacionado com b.id que e o campo id da tabela tb_banco*/
       
/*Com o left join dá para pegar valores nulos e não valores nulos*/
select a.id,
	   a.nome,
       b.nome
       from tb_empregado a left join tb_banco b on (a.id_banco = b.id)
       
/*Quando usar o left join ou inner join,depende da modelagem,ou seja,a modelagem vai dizer no sentido por exemplo o objetivo e
 vincular tb_empregado com a tabela tb_banco e eu vou perguntar quem vai fazer o vinculo que no caso e a chave estrangeira id_banco
 ai vamos saber si essa coluna e not null ou null,no caso na tabela tb_empregado no campo id_banco e null.Quando tiver null sempre 
 iremos usar left join e si for not null iremos usar inner join*/

/*Filtrando os empregados que usam o banco bradesco*/
select a.id,
	   a.nome,
       b.nome
       from tb_empregado a left join tb_banco b on (a.id_banco = b.id)
       where a.id_banco = 1
       
/*Filtrando os empregados que usam o banco itau*/
select a.id,
	   a.nome,
       b.nome
       from tb_empregado a left join tb_banco b on (a.id_banco = b.id)
       where a.id_banco = 2
       
/*Filtrando os empregados que usam o banco caixa*/
select a.id,
	   a.nome,
       b.nome
       from tb_empregado a left join tb_banco b on (a.id_banco = b.id)
       where a.id_banco = 3
       
/*Filtrando os empregados que não usam o banco ou seja e nulo */
select a.id,
	   a.nome,
       b.nome
       from tb_empregado a left join tb_banco b on (a.id_banco = b.id)
       where a.id_banco is null /*E erra do colocar no lugar de " is null " colocar " = null "*/
       
/*Alter table eu atualizo a estrutura da tabela ou seja adicionar e modificar campos*/
alter table tb_empregado
add id_profissao int not null /*si eu fizer dessa forma não vai dá certo porque na tabela 
tb_empregado existe registro dentro e como vou incluir uma nova coluna e essa nova coluna qual vai ser 
o valor do registro si eu estou falando que e obrigatorio que e not null então ela tem que entrar já com um valor
porque ela e not null*/

alter table tb_empregado
add id_profissao int not null default "0"

drop table tb_empregado;
drop table tb_banco;

/*Agora irei dar update em todo mundo referente a sua profissão*/
update tb_empregado
set id_profissao = 2
where id = 1

update tb_empregado
set id_profissao = 1
where id in (2,3)/*Colocando a mesma profissao para 2 pessoas*/

update tb_empregado
set id_profissao = 3
where id =4

update tb_empregado
set id_profissao = 4
where id in (5,6)/*Colocando a mesma profissao para 2 pessoas*/

/*Quero colocar todo mundo que tem esteja nesse momento com a profissão 0 quero modificar para 4*/
update tb_empregado
set id_profissao = 4
where id_profissao = 0

/*Para fazer esse comando de cima tenho que fazer uso do seguinte comando,pois o update está empedindo que vc use sem um campo chave no where*/
  SET SQL_SAFE_UPDATES = 0;
  
  /*Agora vinculando id_profissão da tabela tb_profissao com a tabela tb_empregado de campo id,usando chave estrangeira*/
  alter table tb_empregado
  add foreign key(id_profissao) references tb_profissao(id)
  
  select a.id,
	   a.nome,
       b.nome as banco,/*Para não mostrar o nome da coluna e sim um nome que eu quero uso o "as"*/
       c.nome  as profissao,
       c.descricao
              from tb_empregado a left join tb_banco b on (a.id_banco = b.id)
									inner join tb_profissao c on (a.id_profissao = c.id);