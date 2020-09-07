create database pizzaria;
use pizzaria;

create table tb_cliente
(
id int unsigned not null auto_increment,
nome varchar(55) not null,
telefone varchar(11) not null,
primary key(id)
);

create table tb_produto
(
id int unsigned not null auto_increment,
nome_produto varchar(255) not null,
preco_produto varchar(20) not null,
qtd_estoque_produto varchar (10)  not null default '0',
primary key(id)
);

create table tb_pedido
(
id int unsigned not null auto_increment,
valor_total varchar(50) not null,
id_cliente int unsigned  not null,
primary key(id),
foreign key(id_cliente) references tb_cliente(id)
);

create table tb_item_pedido
(
id int unsigned not null auto_increment,
id_pedido int unsigned not null,
id_produto int unsigned not null,
qtd_comprada varchar(55) not null default '0',
primary key(id),
foreign key(id_pedido) references tb_pedido(id),
foreign key(id_produto) references tb_produto(id)
);

insert into tb_cliente
(id,nome,telefone)
values
(default,'Ana','13988497096'),
(default,'Pedro','13988615655'),
(default,'Maria','13988745263'),
(default,'João','13988498996'),
(default,'Fernando','13988696655'),
(default,'Alex','13988744563'),
(default,'Jennifer','13988128996'),
(default,'Lesnando','13988696875'),
(default,'Assis','13988745763');

select*
from tb_cliente

