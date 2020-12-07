create  database db_faculdade;

use db_faculdade;

create table tb_cliente(
id_cliente int not null auto_increment,
nome varchar(255) not null,
email varchar(100) not null,
telefone varchar(30) null,
primary key(id_cliente)
);

create table tb_produto(
id_produto int not null auto_increment,
nome varchar(255) not null,
qtd_estoque float not null,
valor_custo float not null,
valor_venda float not null,
primary key(id_produto)
);

create table tb_pedido(
id_pedido int not null auto_increment,
id_cliente int not null,
data_venda date not null,
observacao varchar(255) not null,
valor_total float not null,
primary key(id_pedido),
foreign key(id_cliente) references tb_cliente(id_cliente)
);

create table tb_item_pedido(
id int not null auto_increment,
id_pedido int not null,
id_produto int not null,
quantidade float not null,
valor float not null,
primary key(id),
foreign key(id_pedido) references tb_pedido(id_pedido),
foreign key(id_produto) references tb_produto(id_produto)
);

show tables;
-- --------------------------------------------------------------------------------------------------------------------- --
-- Criação da Stored Procedure (SP) - para inserir na tabela tb_cliente --

    DELIMITER $$
CREATE PROCEDURE sp_insere_cliente
(
  IN in_nome_cliente varchar(255),
  IN in_nome_email  varchar(100) ,
  IN in_numero_telefone varchar(30)
)
BEGIN
	INSERT INTO tb_cliente (nome,email,telefone) VALUES (in_nome_cliente,in_nome_email,in_numero_telefone);
END $$
DELIMITER ;

/*Exemplo de chamada de uma Stored Procedure na tabela tb_cliente*/

CALL sp_insere_cliente('Bruno Victor','bruno.victor32@gmail.com.br','13988123456');
CALL sp_insere_cliente('Matheus Henrique','matheus32@gmail.com.br','13988222222');
CALL sp_insere_cliente('Gracineide','gracineide32@gmail.com.br','13988333333');
CALL sp_insere_cliente('Adrianooooo','adriano32@gmail.com.br','13988444444');
CALL sp_insere_cliente('Thiago','thiago32@gmail.com.br',null);

select*from tb_cliente;

-- ----------------------------------------------------------------------------------------------------------------------------------------------- --

drop procedure sp_insere_produto;
-- Criação da Stored Procedure (SP) - para inserir na tabela tb_produto --

    DELIMITER $$
CREATE PROCEDURE sp_insere_produto
(
  IN in_nome_produto varchar(255),
  IN in_quantidade_estoque  float,
  IN in_valor_custo float,
  IN in_valor_venda float
)
BEGIN
	INSERT INTO tb_produto (nome,qtd_estoque,valor_custo,valor_venda) VALUES (in_nome_produto,in_quantidade_estoque ,in_valor_custo,in_valor_venda);
END $$
DELIMITER ;

/*Exemplo de chamada de uma Stored Procedure na tabela tb_produto*/

CALL sp_insere_produto('Assolan',10, 06.00, 10.00);
CALL sp_insere_produto('Detergente',25,10.00,15.00);
CALL sp_insere_produto ('Amaciante',11, 15.00, 20.00);
CALL sp_insere_produto('Detergente',25,20.00,25.00);
CALL sp_insere_produto('Omo',30, 30.00,35.00);
CALL sp_insere_produto ('Desenfetante',4, 21.00,25.00);


select*from tb_produto;

-- ------------------------------------------------------------------------------------------------------------------------------------------------ --
-- Criação da Stored Procedure (SP) - para inserir na tabela tb_pedido --

    DELIMITER $$
CREATE PROCEDURE sp_insere_pedido
(
  IN in_id_cliente int,
  IN in_data_venda date ,
  IN in_observacao varchar(255),
  IN in_valor_total float
)
BEGIN
	INSERT INTO tb_pedido (id_cliente,data_venda,observacao,valor_total) VALUES (in_id_cliente,in_data_venda ,in_observacao,in_valor_total);
END $$
DELIMITER ;

/*Exemplo de chamada de uma Stored Procedure na tabela tb_pedido*/

CALL sp_insere_pedido(4,'2012-08-21','Por favor entregar logo',50.00);
CALL sp_insere_pedido('2','2013-09-22','Por favor entregar ',60.00);
CALL sp_insere_pedido('3','2014-10-27','Por favor ',81.00);
CALL sp_insere_pedido('5','2016-08-23','Por favor entregar logo',99.99);

select*from tb_pedido;

-- ------------------------------------------------------------------------------------------------------------------------------------------------ --
-- Criação da Stored Procedure (SP) - para inserir na tabela tb_item_pedido --

    DELIMITER $$
CREATE PROCEDURE sp_insere_item_pedido
(
  IN in_id_pedido int,
  IN in_id_produto  int ,
  IN in_quantidade float,
  IN in_valor float
)
BEGIN
	INSERT INTO tb_item_pedido (id_pedido,id_produto,quantidade,valor) VALUES (in_id_pedido,in_id_produto ,in_quantidade,in_valor);
END $$
DELIMITER ;

/*Exemplo de chamada de uma Stored Procedure na tabela tb_pedido*/

CALL sp_insere_item_pedido('4','1',3, 40.00);
CALL sp_insere_item_pedido('1','3',8,40.00);
CALL sp_insere_item_pedido('2','2',9, 65.00);
CALL sp_insere_item_pedido('3','5',10, 90.00);

select*from tb_item_pedido;
-- ------------------------------------------------------------------------------------------------------------------------------------------------ --

-- ------------------------------------------------------------------------------------------------------------------------------------------------ --
-- Criação da Stored Procedure (SP) - para atualizar a tabela tb_cliente --

    DELIMITER $$
CREATE PROCEDURE sp_modifica_cliente
(
  IN in_id_cliente int,
  IN in_nome_cliente varchar(255),
  IN in_nome_email  varchar(100) ,
  IN in_numero_telefone varchar(30)
)
BEGIN
	update tb_cliente SET nome = in_nome_cliente , email = in_nome_email,telefone = in_numero_telefone  where id_cliente = in_id_cliente  ;/*Aqui e sempre antes o campo da tabela igual o nome que criei na procedure*/
END $$
DELIMITER ;

/*Exemplo de chamada de uma Stored Procedure na tabela tb_cliente*/


CALL sp_modifica_cliente('1','Brunooo Victor','bruno.victor32@gmail.com.br','13988123456');

select * from tb_cliente;

-- ------------------------------------------------------------------------------------------------------------------------------------------------ --

-- Criação da Stored Procedure (SP) - para atualizar a tabela tb_produto --

    DELIMITER $$
CREATE PROCEDURE sp_modifica_produto
(
  IN in_id_produto int,
  IN in_nome_produto varchar(255),
  IN in_quantidade_estoque  float,
  IN in_valor_custo float,
  IN in_valor_venda float
)
BEGIN
	update tb_produto SET nome = in_nome_produto , qtd_estoque = in_quantidade_estoque ,valor_custo = in_valor_custo, valor_venda = in_valor_venda  where id_produto = in_id_produto  ;/*Aqui e sempre antes o campo da tabela igual o nome que criei na procedure*/
END $$
DELIMITER ;

/*Exemplo de chamada de uma Stored Procedure na tabela tb_produto*/

CALL sp_modifica_produto('1','bombril',10, 05.00, 10.00);


select * from tb_produto;

-- ------------------------------------------------------------------------------------------------------------------------------------------------ --

-- Criação da Stored Procedure (SP) - para atualizar a tabela tb_pedido --

    DELIMITER $$
CREATE PROCEDURE sp_modifica_pedido
(
  IN in_id_pedido int,
  IN in_id_cliente int,
  IN in_data_venda date ,
  IN in_observacao varchar(255),
  IN in_valor_total float
)
BEGIN
	update tb_pedido SET id_cliente = in_id_cliente , data_venda = in_data_venda , observacao = in_observacao,valor_total = in_valor_total   where id_pedido = in_id_pedido ;/*Aqui e sempre antes o campo da tabela igual o nome que criei na procedure*/
END $$
DELIMITER ;

/*Exemplo de chamada de uma Stored Procedure na tabela tb_pedido*/

CALL sp_modifica_pedido(4,4,'2012-08-21','Otimo',50.00);


select * from tb_pedido;

-- ------------------------------------------------------------------------------------------------------------------------------------------------ --

-- Criação da Stored Procedure (SP) - para atualizar a tabela tb_item_pedido --


    DELIMITER $$
CREATE PROCEDURE sp_modifica_item_pedido
(
  IN in_id int,
  IN in_id_pedido int,
  IN in_id_produto  int ,
  IN in_quantidade float,
  IN in_valor float
)
BEGIN
	update tb_item_pedido SET   id_pedido = in_id_pedido,id_produto = in_id_produto, quantidade =  in_quantidade ,valor = in_valor  where id = in_id ;/*Aqui e sempre antes o campo da tabela igual o nome que criei na procedure*/
END $$
DELIMITER ;

/*Exemplo de chamada de uma Stored Procedure na tabela tb_pedido*/

CALL sp_modifica_item_pedido('1','3','1',3, 50.00);


select * from tb_item_pedido;

-- ------------------------------------------------------------------------------------------------------------------------------------------------ --
-- Criação da Stored Procedure (SP) - para deletar na tabela tb_cliente --

DELIMITER $$
CREATE PROCEDURE delete_tb_cliente
(
  in in_id_cliente INT
)
BEGIN
    delete from tb_cliente where id_cliente = in_id_cliente ;
END $$
DELIMITER ;

/*Exemplo de chamada de uma Stored Procedure na tabela tb_cliente*/

CALL delete_tb_cliente(1);

select*from tb_cliente;

-- -------------------------------------------------------------------------------------------------------------------------------------------------- --

DELIMITER $$
CREATE PROCEDURE delete_tb_produto
(
  in in_id_produto int
)
BEGIN
    delete from tb_produto where id_produto = in_id_produto ;
END $$
DELIMITER ;

/*Exemplo de chamada de uma Stored Procedure na tabela tb_produto*/

CALL delete_tb_produto(4);

select*from tb_produto;

-- -------------------------------------------------------------------------------------------------------------------------------------------------- --

DELIMITER $$
CREATE PROCEDURE delete_tb_pedido
(
  in in_id_pedido int
)
BEGIN
    delete from tb_pedido where id_pedido = in_id_pedido ;
END $$
DELIMITER ;

/*Exemplo de chamada de uma Stored Procedure na tabela tb_pedido*/

CALL delete_tb_pedido(1);

select*from tb_pedido;

-- -------------------------------------------------------------------------------------------------------------------------------------------------- --
drop procedure delete_tb_item_pedido;

DELIMITER $$
CREATE PROCEDURE delete_tb_item_pedido
(

  in in_id int
)
BEGIN
    delete from tb_item_pedido where id = in_id ;
END $$
DELIMITER ;

/*Exemplo de chamada de uma Stored Procedure na tabela tb_pedido*/

CALL delete_tb_item_pedido(4);

select*from tb_item_pedido;

-- ---------------------------------------------------------------------------------------------------------------------------------------------- --
-- ---------------------------------------------------------------------------------------------------------------------------------------------- --
-- ---------------------------------------------------------------------------------------------------------------------------------------------- --
-- ---------------------------------------------------------------------------------------------------------------------------------------------- --
-- ---------------------------------------------------------------------------------------------------------------------------------------------- --
-- ---------------------------------------------------------------------------------------------------------------------------------------------- --

DELIMITER $$
CREATE PROCEDURE sp_cliente
(
  IN in_acao VARCHAR(1),
  IN in_id_cliente INT,
  IN in_nome_cliente varchar(255),
  IN in_nome_email  varchar(100) ,
  IN in_numero_telefone varchar(30)
)
BEGIN
    IF (in_acao = 'I') THEN
    BEGIN
        INSERT INTO tb_cliente (nome,email,telefone) VALUES (in_nome_cliente,in_nome_email,in_numero_telefone);
	END;
    ELSEIF (in_acao = 'A') THEN
    BEGIN
        update tb_cliente SET nome = in_nome_cliente , email = in_nome_email,telefone = in_numero_telefone  where id_cliente = in_id_cliente  ;
	END;
	ELSEIF (in_acao = 'E') THEN
    BEGIN

        delete from tb_cliente where id_cliente = in_id_cliente ;
    END;
    END IF;
END $$
DELIMITER ;

/*Exemplo 02 de chamada de uma Stored Procedure:*/

	-- Chamada para Inclusão
CALL sp_cliente("I", null, 'Fernando','fernandoo32@gmail.com.br','13988123456');/*NULL para "id" porque gera automaticamente*/


-- Chamada para Alteração
CALL sp_cliente("A", 4, 'Adriano','adriano3222@gmail.com.br','13988444444');


-- Chamada para Exclusão
CALL sp_cliente("E", '3',null,null,null);

-- Select para testar como ficou o dado na tabela
select * from tb_cliente
-- ------------------------------------------------------------------------------------------------------------------------------------------------ --
-- ---------------------------------------------------------------------------------------------------------------------------------------------- --
-- ---------------------------------------------------------------------------------------------------------------------------------------------- --
-- ---------------------------------------------------------------------------------------------------------------------------------------------- --
-- ---------------------------------------------------------------------------------------------------------------------------------------------- --
-- ---------------------------------------------------------------------------------------------------------------------------------------------- --
-- ---------------------------------------------------------------------------------------------------------------------------------------------- --

DELIMITER $$
CREATE PROCEDURE sp_produto
(
  IN in_acao VARCHAR(1),
  IN in_id_produto INT,
  IN in_nome_produto varchar(255),
  IN in_quantidade_estoque  float,
  IN in_valor_custo float,
  IN in_valor_venda float
)
BEGIN
    IF (in_acao = 'I') THEN
    BEGIN
        INSERT INTO tb_produto (nome,qtd_estoque,valor_custo,valor_venda) VALUES (in_nome_produto,in_quantidade_estoque ,in_valor_custo,in_valor_venda);
	END;
    ELSEIF (in_acao = 'A') THEN
    BEGIN
        	update tb_produto SET nome = in_nome_produto , qtd_estoque = in_quantidade_estoque ,valor_custo = in_valor_custo, valor_venda = in_valor_venda  where id_produto = in_id_produto  ;
	END;
	ELSEIF (in_acao = 'E') THEN
    BEGIN
            delete from tb_produto where id_produto = in_id_produto ;
    END;
    END IF;
END $$
DELIMITER ;

/*Exemplo 02 de chamada de uma Stored Procedure:*/

	-- Chamada para Inclusão
CALL sp_produto("I", null, 'Papel Higienico',10, 06.00, 10.00);/*NULL para "id" porque gera automaticamente*/


-- Chamada para Alteração
CALL sp_produto("A",'7','Veja',10, 05.00, 10.00);


-- Chamada para Exclusão
CALL sp_produto("E", '8',null,null,null,null);

-- Select para testar como ficou o dado na tabela
select * from tb_produto

-- ------------------------------------------------------------------------------------------------------------------------------------------------ --
-- ---------------------------------------------------------------------------------------------------------------------------------------------- --
-- ---------------------------------------------------------------------------------------------------------------------------------------------- --
-- ---------------------------------------------------------------------------------------------------------------------------------------------- --
-- ---------------------------------------------------------------------------------------------------------------------------------------------- --
-- ---------------------------------------------------------------------------------------------------------------------------------------------- --
-- ---------------------------------------------------------------------------------------------------------------------------------------------- --

DELIMITER $$
CREATE PROCEDURE sp_pedido
(
  IN in_acao VARCHAR(1),
  IN in_id_pedido INT,
  IN in_id_cliente int,
  IN in_data_venda date ,
  IN in_observacao varchar(255),
  IN in_valor_total float  

)
BEGIN
    IF (in_acao = 'I') THEN
    BEGIN
        INSERT INTO tb_pedido (id_cliente,data_venda,observacao,valor_total) VALUES (in_id_cliente,in_data_venda ,in_observacao,in_valor_total);
	END;
    ELSEIF (in_acao = 'A') THEN
    BEGIN
        	update tb_pedido SET id_cliente = in_id_cliente , data_venda = in_data_venda , observacao = in_observacao,valor_total = in_valor_total   where id_pedido = in_id_pedido ;
	END;
	ELSEIF (in_acao = 'E') THEN
    BEGIN
		delete from tb_pedido where id_pedido = in_id_pedido ;
    END;
    END IF;
END $$
DELIMITER ;

/*Exemplo 02 de chamada de uma Stored Procedure:*/

	-- Chamada para Inclusão
CALL sp_pedido("I", null,4,'2012-08-21','Por favor entregar logo',50.00);/*NULL para "id" porque gera automaticamente*/


-- Chamada para Alteração
CALL sp_pedido("A", 3,2,'2016-08-21','Thanks',50.00);


-- Chamada para Exclusão
CALL sp_pedido("E", '5',null,null,null,null);

-- Select para testar como ficou o dado na tabela
select * from tb_pedido

-- ------------------------------------------------------------------------------------------------------------------------------------------------ --
-- ---------------------------------------------------------------------------------------------------------------------------------------------- --
-- ---------------------------------------------------------------------------------------------------------------------------------------------- --
-- ---------------------------------------------------------------------------------------------------------------------------------------------- --
-- ---------------------------------------------------------------------------------------------------------------------------------------------- --
-- ---------------------------------------------------------------------------------------------------------------------------------------------- --
-- ---------------------------------------------------------------------------------------------------------------------------------------------- --
DELIMITER $$
CREATE PROCEDURE sp_item_pedido
(
  IN in_acao VARCHAR(1),
  IN in_id INT,
  IN in_id_pedido int,
  IN in_id_produto  int ,
  IN in_quantidade float,
  IN in_valor float

)
BEGIN
    IF (in_acao = 'I') THEN
    BEGIN
        	INSERT INTO tb_item_pedido (id_pedido,id_produto,quantidade,valor) VALUES (in_id_pedido,in_id_produto ,in_quantidade,in_valor);
	END;
    ELSEIF (in_acao = 'A') THEN
    BEGIN 
        	update tb_item_pedido SET   id_pedido = in_id_pedido,id_produto = in_id_produto, quantidade =  in_quantidade ,valor = in_valor  where id = in_id ;
	END;
	ELSEIF (in_acao = 'E') THEN
    BEGIN
        delete from tb_item_pedido where id = in_id ;
    END;
    END IF;
END $$
DELIMITER ;

/*Exemplo 02 de chamada de uma Stored Procedure:*/

	-- Chamada para Inclusão
CALL sp_item_pedido("I",null, '3','1',3, 40.00);/*NULL para "id" porque gera automaticamente*/


-- Chamada para Alteração
CALL sp_item_pedido("A", '1','2','2',2, 50.00);


-- Chamada para Exclusão
CALL sp_item_pedido("E", 6,null,null,null,null);

-- Select para testar como ficou o dado na tabela
select * from tb_item_pedido

-- ------------------------------------------------------------------------------------------------------------------------------------------------ --
-- ---------------------------------------------------------------------------------------------------------------------------------------------- --
-- ---------------------------------------------------------------------------------------------------------------------------------------------- --
-- ---------------------------------------------------------------------------------------------------------------------------------------------- --
-- ---------------------------------------------------------------------------------------------------------------------------------------------- --
-- ---------------------------------------------------------------------------------------------------------------------------------------------- --
-- ---------------------------------------------------------------------------------------------------------------------------------------------- --
drop procedure spp_cliente;
/*Exemplo 03 de Criação de Stored Procedure:*/

-- Criação da Stored Procedure (SP)
DELIMITER $$
CREATE PROCEDURE spp_cliente
(
  IN in_acao VARCHAR(1),
  INOUT in_id_cliente INT, /* Do exercicio anterior só mudo isso -- Esse parametro "id" e o "id" da tabela do professor que e gerado automaticamente --
  -- Por exemplo si eu incluir um cara na tabela e eu quiser o "id" que ele acabou de gerar ou seja si eu tenho uma procedure eu quero que ela inclua
  um cara na tabela,mas eu quero que ela me retorne o id que ela incluiu.Quero que ela me retorne alguma informação que ela processo lá dentro dela
  e me retorne isso.--E o cara que eu quero que me retorne e o "id",então ao inves de deixar o parametro como "IN" igual os outros que e um parametro de
  INPUT ou ENTRADA.Agora eu estou deixando com um parametro de input e outpu que significa que eu posso pedir ou seja informar um valor para ele ou seja eu estou dando input
  e ele vai usar la dentro assim como faço com nome e telefone ou seja estou passando um valor que ele vai usar lá dentro ou eu falo assim para ele eu vou te passa
  uma variavel nesse parametro e você por favor processa o "id" ai dentro e no final das contas ele escreve o valor do id que ele gero do cara que ele acabo de incluir.Ele escreve esse valor
  no parametro na variavel que foi passada,ai quando a procedure for executada ver qual esse valor do parametro*/ 
  IN in_nome_cliente varchar(255),
  IN in_nome_email  varchar(100) ,
  IN in_numero_telefone varchar(30)
)
BEGIN
    IF (in_acao = 'I') THEN
    BEGIN
            INSERT INTO tb_cliente (nome,email,telefone) VALUES (in_nome_cliente,in_nome_email,in_numero_telefone);
        SET in_id_cliente  = ( SELECT MAX(id_cliente) FROM tb_cliente );/* Do exercicio anterior só mudo isso*/ /*Aqui vai pegar o maior id da tabela*/
	END;
    ELSEIF (in_acao = 'A') THEN
    BEGIN
			update tb_cliente SET nome = in_nome_cliente , email = in_nome_email,telefone = in_numero_telefone  where id_cliente = in_id_cliente  ;
	END;
	ELSEIF (in_acao = 'E') THEN
    BEGIN
		DELETE FROM tb_cliente WHERE id_cliente = in_id_cliente;
    END;
    END IF;
END $$
DELIMITER ;

/*Exemplo 03 de chamada de uma Stored Procedure:*/

-- Chamada para Inclusão
/*Para criar uma variavel no mysql eu coloco @ e o nome para ela.Toda variavel tem que ter @*/
/*Aqui eu criei uma variavel "@ID" que estou atribuindo um valor nulo para ela*/
SET @ID = NULL;
CALL spp_cliente("I", @ID, 'Maria','maria64@gmail.com.br','13911113333');/*Aqui estou passando a variavel vazia lá para minha procedure.Essa variavel vai entra no in_id.Si eu passar algum valor
nesse parametro in_id ele vai sofrer alteração dentro do update,insert e delete.E a procedure automaticamente vai escrever o valor que ele processo ai dentro,dentro da variavel que
passo dentro in_id*/
/*SELECT @ID*/
SELECT CONCAT("O ID ", @ID, " foi inserido")

-- Chamada para Alteração
SET @ID = 7;
CALL spp_cliente("A", @ID, 'Leticia Maria','leticia@gmail.com.br','13922223333');

-- Chamada para Exclusão
SET @ID = 7;
CALL spp_cliente("E", @ID, null, null,null);

-- Select para testar como ficou o dado na tabela
select * from tb_cliente

-- ---------------------------------------------------------------------------------------------------------------------------------------------- --
-- ---------------------------------------------------------------------------------------------------------------------------------------------- --
-- ---------------------------------------------------------------------------------------------------------------------------------------------- --
-- ---------------------------------------------------------------------------------------------------------------------------------------------- --
-- ---------------------------------------------------------------------------------------------------------------------------------------------- --
-- ---------------------------------------------------------------------------------------------------------------------------------------------- --
-- ---------------------------------------------------------------------------------------------------------------------------------------------- --

-- Criação da Stored Procedure (SP)
DELIMITER $$
CREATE PROCEDURE spp_produto
(
  IN in_acao VARCHAR(1),
  INOUT in_id_produto INT, /* Do exercicio anterior só mudo isso -- Esse parametro "id" e o "id" da tabela do professor que e gerado automaticamente --
  -- Por exemplo si eu incluir um cara na tabela e eu quiser o "id" que ele acabou de gerar ou seja si eu tenho uma procedure eu quero que ela inclua
  um cara na tabela,mas eu quero que ela me retorne o id que ela incluiu.Quero que ela me retorne alguma informação que ela processo lá dentro dela
  e me retorne isso.--E o cara que eu quero que me retorne e o "id",então ao inves de deixar o parametro como "IN" igual os outros que e um parametro de
  INPUT ou ENTRADA.Agora eu estou deixando com um parametro de input e outpu que significa que eu posso pedir ou seja informar um valor para ele ou seja eu estou dando input
  e ele vai usar la dentro assim como faço com nome e telefone ou seja estou passando um valor que ele vai usar lá dentro ou eu falo assim para ele eu vou te passa
  uma variavel nesse parametro e você por favor processa o "id" ai dentro e no final das contas ele escreve o valor do id que ele gero do cara que ele acabo de incluir.Ele escreve esse valor
  no parametro na variavel que foi passada,ai quando a procedure for executada ver qual esse valor do parametro*/ 
  IN in_nome_produto varchar(255),
  IN in_quantidade_estoque  float,
  IN in_valor_custo float,
  IN in_valor_venda float
)
BEGIN
    IF (in_acao = 'I') THEN
    BEGIN
        	INSERT INTO tb_produto (nome,qtd_estoque,valor_custo,valor_venda) VALUES (in_nome_produto,in_quantidade_estoque ,in_valor_custo,in_valor_venda);
        
      SET in_id_produto  = ( SELECT MAX(id_produto) FROM tb_produto );/* Do exercicio anterior só mudo isso*/ /*Aqui vai pegar o maior id da tabela*/
	END;
    ELSEIF (in_acao = 'A') THEN
    BEGIN
        	update tb_produto SET nome = in_nome_produto , qtd_estoque = in_quantidade_estoque ,valor_custo = in_valor_custo, valor_venda = in_valor_venda  where id_produto = in_id_produto  ;
	END;
	ELSEIF (in_acao = 'E') THEN
    BEGIN
        delete from tb_produto where id_produto = in_id_produto ;
    END;
    END IF;
END $$
DELIMITER ;

/*Exemplo 03 de chamada de uma Stored Procedure:*/

-- Chamada para Inclusão
/*Para criar uma variavel no mysql eu coloco @ e o nome para ela.Toda variavel tem que ter @*/
/*Aqui eu criei uma variavel "@ID" que estou atribuindo um valor nulo para ela*/
SET @ID = NULL;
CALL spp_produto("I", @ID, 'pano',100, 2.50, 05.50);/*Aqui estou passando a variavel vazia lá para minha procedure.Essa variavel vai entra no in_id.Si eu passar algum valor
nesse parametro in_id ele vai sofrer alteração dentro do update,insert e delete.E a procedure automaticamente vai escrever o valor que ele processo ai dentro,dentro da variavel que
passo dentro in_id*/
/*SELECT @ID*/
SELECT CONCAT("O ID ", @ID, " foi inserido")

-- Chamada para Alteração
SET @ID = 9;
CALL spp_produto("A", @ID,'Refrigerante',99, 06.00, 10.00);

-- Chamada para Exclusão
SET @ID = 9;
CALL spp_produto("E", @ID, null, null,null,null);

-- Select para testar como ficou o dado na tabela
select * from tb_produto

-- ---------------------------------------------------------------------------------------------------------------------------------------------- --
-- ---------------------------------------------------------------------------------------------------------------------------------------------- --
-- ---------------------------------------------------------------------------------------------------------------------------------------------- --
-- ---------------------------------------------------------------------------------------------------------------------------------------------- --
-- ---------------------------------------------------------------------------------------------------------------------------------------------- --
-- ---------------------------------------------------------------------------------------------------------------------------------------------- --
-- ---------------------------------------------------------------------------------------------------------------------------------------------- --

DELIMITER $$
CREATE PROCEDURE spp_pedido
(
  IN in_acao VARCHAR(1),
  INOUT in_id_pedido INT, /* Do exercicio anterior só mudo isso -- Esse parametro "id" e o "id" da tabela do professor que e gerado automaticamente --
  -- Por exemplo si eu incluir um cara na tabela e eu quiser o "id" que ele acabou de gerar ou seja si eu tenho uma procedure eu quero que ela inclua
  um cara na tabela,mas eu quero que ela me retorne o id que ela incluiu.Quero que ela me retorne alguma informação que ela processo lá dentro dela
  e me retorne isso.--E o cara que eu quero que me retorne e o "id",então ao inves de deixar o parametro como "IN" igual os outros que e um parametro de
  INPUT ou ENTRADA.Agora eu estou deixando com um parametro de input e outpu que significa que eu posso pedir ou seja informar um valor para ele ou seja eu estou dando input
  e ele vai usar la dentro assim como faço com nome e telefone ou seja estou passando um valor que ele vai usar lá dentro ou eu falo assim para ele eu vou te passa
  uma variavel nesse parametro e você por favor processa o "id" ai dentro e no final das contas ele escreve o valor do id que ele gero do cara que ele acabo de incluir.Ele escreve esse valor
  no parametro na variavel que foi passada,ai quando a procedure for executada ver qual esse valor do parametro*/ 
  IN in_id_cliente int,
  IN in_data_venda date ,
  IN in_observacao varchar(255),
  IN in_valor_total float
)
BEGIN
    IF (in_acao = 'I') THEN
    BEGIN
        	INSERT INTO tb_pedido (id_cliente,data_venda,observacao,valor_total) VALUES (in_id_cliente,in_data_venda ,in_observacao,in_valor_total);
        
      SET in_id_pedido  = ( SELECT MAX(id_pedido) FROM tb_pedido );/* Do exercicio anterior só mudo isso*/ /*Aqui vai pegar o maior id da tabela*/
	END;
    ELSEIF (in_acao = 'A') THEN
    BEGIN
        	update tb_pedido SET id_cliente = in_id_cliente , data_venda = in_data_venda , observacao = in_observacao,valor_total = in_valor_total   where id_pedido = in_id_pedido ;
	END;
	ELSEIF (in_acao = 'E') THEN
    BEGIN
			delete from tb_pedido where id_pedido = in_id_pedido ;
    END;
    END IF;
END $$
DELIMITER ;

/*Exemplo 03 de chamada de uma Stored Procedure:*/

-- Chamada para Inclusão
/*Para criar uma variavel no mysql eu coloco @ e o nome para ela.Toda variavel tem que ter @*/
/*Aqui eu criei uma variavel "@ID" que estou atribuindo um valor nulo para ela*/
SET @ID = NULL;
CALL spp_pedido("I", @ID, 4,'2012-08-21','Not',50.00);/*Aqui estou passando a variavel vazia lá para minha procedure.Essa variavel vai entra no in_id.Si eu passar algum valor
nesse parametro in_id ele vai sofrer alteração dentro do update,insert e delete.E a procedure automaticamente vai escrever o valor que ele processo ai dentro,dentro da variavel que
passo dentro in_id*/

/*SELECT @ID*/
SELECT CONCAT("O ID ", @ID, " foi inserido")

-- Chamada para Alteração
SET @ID = 6;
CALL spp_pedido("A", @ID, '3','2021-08-21','Por favor entregar logo',100.00);

-- Chamada para Exclusão
SET @ID = 6;
CALL spp_pedido("E", @ID, null, null,null,null);

-- Select para testar como ficou o dado na tabela --
select * from tb_pedido

-- ---------------------------------------------------------------------------------------------------------------------------------------------- --
-- ---------------------------------------------------------------------------------------------------------------------------------------------- --
-- ---------------------------------------------------------------------------------------------------------------------------------------------- --
-- ---------------------------------------------------------------------------------------------------------------------------------------------- --
-- ---------------------------------------------------------------------------------------------------------------------------------------------- --
-- ---------------------------------------------------------------------------------------------------------------------------------------------- --
-- ---------------------------------------------------------------------------------------------------------------------------------------------- --

DELIMITER $$
CREATE PROCEDURE spp_item_pedido
(
  IN in_acao VARCHAR(1),
  INOUT in_id INT, /* Do exercicio anterior só mudo isso -- Esse parametro "id" e o "id" da tabela do professor que e gerado automaticamente --
  -- Por exemplo si eu incluir um cara na tabela e eu quiser o "id" que ele acabou de gerar ou seja si eu tenho uma procedure eu quero que ela inclua
  um cara na tabela,mas eu quero que ela me retorne o id que ela incluiu.Quero que ela me retorne alguma informação que ela processo lá dentro dela
  e me retorne isso.--E o cara que eu quero que me retorne e o "id",então ao inves de deixar o parametro como "IN" igual os outros que e um parametro de
  INPUT ou ENTRADA.Agora eu estou deixando com um parametro de input e outpu que significa que eu posso pedir ou seja informar um valor para ele ou seja eu estou dando input
  e ele vai usar la dentro assim como faço com nome e telefone ou seja estou passando um valor que ele vai usar lá dentro ou eu falo assim para ele eu vou te passa
  uma variavel nesse parametro e você por favor processa o "id" ai dentro e no final das contas ele escreve o valor do id que ele gero do cara que ele acabo de incluir.Ele escreve esse valor
  no parametro na variavel que foi passada,ai quando a procedure for executada ver qual esse valor do parametro*/ 
  IN in_id_pedido int,
  IN in_id_produto  int ,
  IN in_quantidade float,
  IN in_valor float
)
BEGIN
    IF (in_acao = 'I') THEN
    BEGIN
        	INSERT INTO tb_item_pedido (id_pedido,id_produto,quantidade,valor) VALUES (in_id_pedido,in_id_produto ,in_quantidade,in_valor);
      SET in_id = ( SELECT MAX(id) FROM tb_item_pedido );/* Do exercicio anterior só mudo isso*/ /*Aqui vai pegar o maior id da tabela*/
	END;
    ELSEIF (in_acao = 'A') THEN
    BEGIN  
        	update tb_item_pedido SET   id_pedido = in_id_pedido,id_produto = in_id_produto, quantidade =  in_quantidade ,valor = in_valor  where id = in_id ;
	END;
	ELSEIF (in_acao = 'E') THEN
    BEGIN
            delete from tb_item_pedido where id = in_id ;
    END;
    END IF;
END $$
DELIMITER ;

/*Exemplo 03 de chamada de uma Stored Procedure:*/

-- Chamada para Inclusão
/*Para criar uma variavel no mysql eu coloco @ e o nome para ela.Toda variavel tem que ter @*/
/*Aqui eu criei uma variavel "@ID" que estou atribuindo um valor nulo para ela*/
SET @ID = NULL;
CALL spp_item_pedido("I",@ID,'3','2',3, 40.00);/*Aqui estou passando a variavel vazia lá para minha procedure.Essa variavel vai entra no in_id.Si eu passar algum valor
nesse parametro in_id ele vai sofrer alteração dentro do update,insert e delete.E a procedure automaticamente vai escrever o valor que ele processo ai dentro,dentro da variavel que
passo dentro in_id*/
/*SELECT @ID*/
SELECT CONCAT("O ID ", @ID, " foi inserido")

-- Chamada para Alteração
SET @ID = 8;
CALL spp_item_pedido("A",@ID, 3,'3',5,100.00);

-- Chamada para Exclusão
SET @ID = 8;
CALL spp_item_pedido("E",@ID,null,null,null,null);

-- Select para testar como ficou o dado na tabela
select * from tb_item_pedido


-- ---------------------------------------------------------------------------------------------------------------------------------------------- --
-- ---------------------------------------------------------------------------------------------------------------------------------------------- --
-- ---------------------------------------------------------------------------------------------------------------------------------------------- --
-- ---------------------------------------------------------------------------------------------------------------------------------------------- --
-- ---------------------------------------------------------------------------------------------------------------------------------------------- --
-- ---------------------------------------------------------------------------------------------------------------------------------------------- --
-- ---------------------------------------------------------------------------------------------------------------------------------------------- --

 -- Exibir os Clientes --
   select * from tb_cliente;
   
   -- Utilizando views "Exibir os Clientes" --
create view vw_clientes 
as
select nome,
       email,
       telefone
from tb_cliente;

-- Exibindo os clientes utilizando a view criada*/
select * from vw_clientes;
-- ----------------------------------------------------------------------------------------------- --
   
-- Exibir todos os Clientes que não tem telefone --
   SELECT id_cliente,nome FROM tb_cliente where (telefone is null);
   
 -- Utilizando views "Exibir todos os Clientes que não tem telefone " --
   create view vw_not_telefone
   as
   select id_cliente,
		  nome
from tb_cliente
where (telefone is null);

/* Exibir todos os clientes que não tem telefone,utilizando a view criada*/

select * from vw_not_telefone;
   
-- ----------------------------------------------------------------------------------------------- --   
   
 -- Exibir todos os Clientes que tem telefone --
     SELECT id_cliente,nome FROM tb_cliente where (telefone is not null);
     
 -- Criando uma view para exibir todos os clientes que tem telefone --    
     create view vw_tel_existente
     as
     select id_cliente,
			nome
	from tb_cliente
    where (telefone is not null);
    
--  Exibir todos os clientes que tem telefone,utilizando a view criada --

select * from vw_tel_existente;

-- ----------------------------------------------------------------------------------------------- --   

-- Exibir os Produtos --
   select * from tb_produto;
   
-- Criar uma view para exibir os produtos --
create view vw_prod
as 
select id_produto,
	   nome,
       qtd_estoque,
       valor_custo,
       valor_venda
from tb_produto;

-- Exibir os produtos,utilizando a view criada --
select* from vw_prod;

-- ----------------------------------------------------------------------------------------------- -- 
-- Exibir os nomes dos produtos --
   select nome from tb_produto;
   
-- Criar uma view para exibir o nome dos produtos -- 
create view vw_nome_produto
as
select nome
from tb_produto;

-- Exibir o nome dos produtos utilizando view --
select*from vw_nome_produto;

-- ----------------------------------------------------------------------------------------------- -- 
   
   -- Exibir todos os Produtos que tem o valor de custo superior a 10 reais e o valor de venda inferior a 20 reais --
   select nome from tb_produto where (valor_venda >  10.00) and (valor_venda <  20.00);
   
   -- Criar uma view para exibir todos os Produtos que tem o valor de custo superior a 10 reais e o valor de venda inferior a 20 reais --
   create view vw_prod_custo_sup_10_valor_inferior_20
   as
   select nome
   from tb_produto
   where (valor_venda >  10.00) and (valor_venda <  20.00);
   
   -- Exibir todos os Produtos que tem o valor de custo superior a 10 reais e o valor de venda inferior a 20 reais, utilizando a view --
   
   select*from vw_prod_custo_sup_10_valor_inferior_20;
   -- ----------------------------------------------------------------------------------------------- -- 
   
   -- Exibir todos os Produtos que tem o valor de custo superior a 20 reais e quantidade de estoque menor que 5 peças --
   select nome from tb_produto where (valor_venda > 20.00) and (qtd_estoque < 5);   
   
   -- Criar uma view para exibir todos os Produtos que tem o valor de custo superior a 20 reais e quantidade de estoque menor que 5 peças --
   create view vw_prod_custo_sup_20_quant_esto_menor_5
   as
   select nome
   from tb_produto
   where (valor_venda > 20.00) and (qtd_estoque < 5);
   
--  Exibir todos os Produtos que tem o valor de custo superior a 20 reais e quantidade de estoque menor que 5 peças,utilizando a view --  
   
select * from vw_prod_custo_sup_20_quant_esto_menor_5;

   -- ----------------------------------------------------------------------------------------------- -- 
   
   -- Exibir as informações de Pedidos, o Nome do Cliente e o Email --
   select a.observacao as Informação,
          b.nome as Nome,
          b.email as Email
          from tb_pedido a inner join tb_cliente b on (a.id_pedido = b.id_cliente);
          
-- Criar uma view para exibir as informações de Pedidos, o Nome do Cliente e o Email --
create view vw_info_pedidos_nome_cliente_email
as
select a.observacao as Informação,
          b.nome as Nome,
          b.email as Email
from tb_pedido a inner join tb_cliente b on (a.id_pedido = b.id_cliente);

-- Exibir as informações de Pedidos, o Nome do Cliente e o Email,utilizando uma view

select*from vw_info_pedidos_nome_cliente_email;

   -- ----------------------------------------------------------------------------------------------- -- 

-- Exibir as informações do Id do Pedido, Nome do Produto, Nome do Cliente e Telefone --
   select a.id_pedido as IdPedido,
          b.nome as NomeProduto,
          c.nome as NomeCliente,
          c.telefone as NumeroTelefone
          from tb_pedido a inner join tb_produto b on (a.id_pedido = b.id_produto)
                           inner join tb_cliente c on (a.id_pedido = c.id_cliente);
                           
-- Criar uma view para exibir as informações do Id do Pedido, Nome do Produto, Nome do Cliente e Telefone --
create view vw_info_idped_nomeprod_nomeclien_tel
as
select a.id_pedido as IdPedido,
          b.nome as NomeProduto,
          c.nome as NomeCliente,
          c.telefone as NumeroTelefone
          from tb_pedido a inner join tb_produto b on (a.id_pedido = b.id_produto)
                           inner join tb_cliente c on (a.id_pedido = c.id_cliente);
				
-- Exibir as informações do Id do Pedido, Nome do Produto, Nome do Cliente e Telefone,utilizando uma view --

select * from vw_info_idped_nomeprod_nomeclien_tel;

   -- ----------------------------------------------------------------------------------------------- -- 
                           
	-- Exibir as informações do Id do Pedido, Nome do Produto, Quantidade comprada, Valor de Venda e Nome do Cliente      --
    select a.id_pedido as IdPedido,
		   b.nome as NomeProduto,
           b.qtd_estoque as QuantidadeComprada,
           b.valor_venda as ValordeVenda,
           c.nome as Cliente
           from tb_pedido a inner join tb_produto b on (a.id_pedido = b.id_produto)
                           inner join tb_cliente c on (a.id_pedido = c.id_cliente);
                           
-- Criar uma view para exibir as informações do Id do Pedido, Nome do Produto, Quantidade comprada, Valor de Venda e Nome do Cliente      --
 create view vw_idped_nomeprod_quant_valorvenda_nomeclient
 as
select a.id_pedido as IdPedido,
		   b.nome as NomeProduto,
           b.qtd_estoque as QuantidadeComprada,
           b.valor_venda as ValordeVenda,
           c.nome as Cliente
           from tb_pedido a inner join tb_produto b on (a.id_pedido = b.id_produto)
                           inner join tb_cliente c on (a.id_pedido = c.id_cliente);
                           
	-- Exibir as informações do Id do Pedido, Nome do Produto, Quantidade comprada, Valor de Venda e Nome do Cliente,utilizando a view     --  
    
    select * from  vw_idped_nomeprod_quant_valorvenda_nomeclient;
    
       -- ----------------------------------------------------------------------------------------------- -- 
                           
                           
	-- Exibir as informações do Id do Pedido, Nome do Produto, Quantidade comprada, Valor de Venda e Nome do Cliente      --
    select a.id_pedido as IdPedido,
		   b.nome as NomeProduto,
           b.qtd_estoque as QuantidadeComprada,
           b.valor_venda as ValordeVenda,
           c.nome as Cliente
           from tb_pedido a left join tb_produto b on (a.id_pedido = b.id_produto)
                           left join tb_cliente c on (a.id_pedido = c.id_cliente);
                           
-- Criar uma view para exibir as informações do Id do Pedido, Nome do Produto, Quantidade comprada, Valor de Venda e Nome do Cliente      --
 create view idped_nmprod_qtcomprada_vlvenda_nmcliente
 as
select a.id_pedido as IdPedido,
		   b.nome as NomeProduto,
           b.qtd_estoque as QuantidadeComprada,
           b.valor_venda as ValordeVenda,
           c.nome as Cliente
           from tb_pedido a left join tb_produto b on (a.id_pedido = b.id_produto)
                           left join tb_cliente c on (a.id_pedido = c.id_cliente);
                           
 	-- Exibir as informações do Id do Pedido, Nome do Produto, Quantidade comprada, Valor de Venda e Nome do Cliente,utilizando a view      --     
    
    select * from idped_nmprod_qtcomprada_vlvenda_nmcliente;
           
           
   select*from tb_pedido;