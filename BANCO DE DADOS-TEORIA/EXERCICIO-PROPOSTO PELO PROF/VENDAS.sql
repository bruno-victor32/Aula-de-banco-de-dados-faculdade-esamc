create  database db_faculdade;

drop  database db_faculdade; 

use db_faculdade;

create table tb_cliente(
id_cliente int          not null auto_increment,
nome       varchar(255) not null,
email      varchar(100) not null,
telefone   varchar(30)  null,
primary key(id_cliente)
);

create table tb_produto(
id_produto  int          not null auto_increment,
nome        varchar(255) not null,
qtd_estoque float        not null,
valor_custo float        not null,
valor_venda float        not null,
primary key(id_produto)
);

create table tb_pedido(
id_pedido   int          not null auto_increment,
id_cliente  int          not null,
data_venda  date         not null,
observacao  varchar(255) not null,
valor_total  float       not null,
primary key(id_pedido),
foreign key(id_cliente) references tb_cliente(id_cliente)
);

create table tb_item_pedido(
id 		   int   not null auto_increment,
id_pedido  int   not null,
id_produto int   not null,
quantidade float not null,
valor      float not null,
primary key(id),
foreign key(id_pedido) references tb_pedido(id_pedido),
foreign key(id_produto) references tb_produto(id_produto)
);

show tables;

/*•	Ingestão/Inclusão de dados nas tabelas*/

-- para inserir na tabela tb_cliente --

	INSERT INTO tb_cliente (nome,email,telefone)
    values  ('Bruno Victor','bruno.victor32@gmail.com.br','13988123456'),
			('Matheus Henrique','matheus32@gmail.com.br','13988222222'),
            ('Gracineide','gracineide32@gmail.com.br','13988333333'),
            ('Adrianooooo','adriano32@gmail.com.br','13988444444'),
            ('Thiago','thiago32@gmail.com.br',null);
            
   select * from tb_cliente;
            
-- para inserir na tabela tb_produto --
            
	INSERT INTO tb_produto (nome,qtd_estoque,valor_custo,valor_venda) 
    VALUES ('Assolan'     ,10, 06.00, 10.00),
		   ('Detergente'  ,25,10.00 ,15.00),
		   ('Amaciante'   ,11, 15.00, 20.00),
		   ('Detergente'  ,25,20.00 ,25.00),
		   ('Omo'         ,30, 30.00,35.00),
		   ('Desinfetante',4 , 21.00,25.00);
           
   select * from tb_produto;
           
-- para inserir na tabela tb_pedido --
           
	INSERT INTO tb_pedido (id_cliente,data_venda,observacao,valor_total) 
    VALUES 	('4','2012-08-21','Por favor entregar logo',50.00),
			('2','2013-09-22','Por favor entregar ',60.00),
			('3','2014-10-27','Por favor ',81.00),
			('5','2016-08-23','Por favor entregar logo',99.99);
            
   select * from tb_pedido;
                
-- para inserir na tabela tb_item_pedido --
      
	INSERT INTO tb_item_pedido (id_pedido,id_produto,quantidade,valor) 
    VALUES      ('4','1',3, 40.00),
				('1','3',8,40.00),
				('2','2',9, 65.00),
				('3','5',10, 90.00);
                
   select * from tb_item_pedido;
   
   -- Exibir os Clientes --
   select * from tb_cliente;
   
-- Exibir todos os Clientes que não tem telefone --
   SELECT id_cliente,nome FROM tb_cliente where (telefone is null);
   
 -- Exibir todos os Clientes que tem telefone --
     SELECT id_cliente,nome FROM tb_cliente where (telefone is not null);

-- Exibir os Produtos --
   select * from tb_produto;
   
   select nome from tb_produto;
   
   -- Exibir todos os Produtos que tem o valor de custo superior a 10 reais e o valor de venda inferior a 20 reais --
   select nome from tb_produto where (valor_venda >  10.00) and (valor_venda <  20.00);
   
   -- Exibir todos os Produtos que tem o valor de custo superior a 20 reais e quantidade de estoque menor que 5 peças --
   select nome from tb_produto where (valor_custo > 20.00) and (qtd_estoque < 5);   
   
   -- Exibir as informações de Pedidos, o Nome do Cliente e o Email --
   select a.observacao as Informação,
          b.nome as Nome,
          b.email as Email
          from tb_pedido a inner join tb_cliente b on (a.id_pedido = b.id_cliente);

-- Exibir as informações do Id do Pedido, Nome do Produto, Nome do Cliente e Telefone --
	select a.id_pedido as IdPedido,
          c.nome as NomeProduto,
          d.nome as NomeCliente,
          d.telefone as NumeroTelefone
          from tb_pedido a inner join tb_item_pedido b on (a.id_pedido = b.id_pedido)
                           inner join tb_produto     c on (b.id_produto = c.id_produto)
                           inner join tb_cliente     d on (a.id_cliente = d.id_cliente);
                           
	-- Exibir as informações do Id do Pedido, Nome do Produto, Quantidade comprada, Valor de Venda e Nome do Cliente      --
                           
	select a.id_pedido as IdPedido,
          c.nome as NomeProduto,
		  b.quantidade as QuantidadeComprada,
          c.valor_venda as ValorVenda,
          d.nome as NomeCliente,
          d.telefone as NumeroTelefone
          from tb_pedido a inner join tb_item_pedido b on (a.id_pedido = b.id_pedido)
                           inner join tb_produto     c on (b.id_produto = c.id_produto)
                           inner join tb_cliente     d on (a.id_cliente = d.id_cliente);
                           
                           
                           

                           
