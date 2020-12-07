create database db_modelo_entidade;

drop database db_modelo_entidade;

use db_modelo_entidade;

select

create table tb_cliente(
id_cliente int not null auto_increment,
nm_cliente varchar(255) not null,
nm_email  varchar(255) not null,
nr_telefone varchar(11) not null,
primary key(id_cliente)
);

create table tb_produto(
id_produto int not null auto_increment,
nm_produto varchar(255) not null,
qt_estoque varchar(100) not null,
vl_venda varchar(255),
primary key(id_produto)
);

create table tb_pedido(
id int not null auto_increment,
id_cliente int not null,
dt_pedido date ,
ds_obs varchar(255) not null,
primary key(id),
foreign key(id_cliente) references tb_cliente(id_cliente)
);


create table tb_item_pedido(
id_pedido int not null ,
id_produto int not null ,
qt_item varchar(255) not null,
vl_item varchar(255) not null,
primary key(id_pedido,id_produto),
foreign key(id_pedido) references tb_pedido(id),
foreign key(id_produto) references tb_produto(id_produto)
);

select*from tb_cliente;
select*from tb_produto
select*from tb_pedido;
select*from tb_item_pedido;

-- Criação da Stored Procedure (SP) - para inserir na tabela tb_cliente --

    DELIMITER $$
CREATE PROCEDURE sp_insere_cliente
(
  IN in_nm_cliente varchar(255),
  IN in_nm_email  varchar(255) ,
  IN in_nr_telefone varchar(11)
)
BEGIN
	INSERT INTO tb_cliente (nm_cliente,nm_email,nr_telefone) VALUES (in_nm_cliente,in_nm_email,in_nr_telefone);
END $$
DELIMITER ;

/*Exemplo de chamada de uma Stored Procedure na tabela tb_cliente*/

CALL sp_insere_cliente('Bruno Victor','bruno.victor32@gmail.com.br','13988123456');

select*from tb_cliente;

-- ----------------------------------------------------------------------------------------------------------------------------------------------- --
-- Criação da Stored Procedure (SP) - para inserir na tabela tb_produto --

    DELIMITER $$
CREATE PROCEDURE sp_insere_produto
(
  IN in_nm_produto varchar(255),
  IN in_qt_estoque  varchar(100) ,
  IN in_vl_venda varchar(255)
)
BEGIN
	INSERT INTO tb_produto (nm_produto,qt_estoque,vl_venda) VALUES (in_nm_produto,in_qt_estoque ,in_vl_venda);
END $$
DELIMITER ;

/*Exemplo de chamada de uma Stored Procedure na tabela tb_produto*/

CALL sp_insere_produto('Assolan','10','R$ 10,00');

select*from tb_produto;

-- ------------------------------------------------------------------------------------------------------------------------------------------------ --
-- Criação da Stored Procedure (SP) - para inserir na tabela tb_pedido --

    DELIMITER $$
CREATE PROCEDURE sp_insere_pedido
(
  IN in_id_cliente int,
  IN in_dt_pedido  date ,
  IN in_ds_obs varchar(255)
)
BEGIN
	INSERT INTO tb_pedido (id_cliente,dt_pedido,ds_obs) VALUES (in_id_cliente,in_dt_pedido ,in_ds_obs);
END $$
DELIMITER ;

/*Exemplo de chamada de uma Stored Procedure na tabela tb_pedido*/

CALL sp_insere_pedido(1,'2012-08-21','Por favor entregar logo');

select*from tb_pedido;

-- ------------------------------------------------------------------------------------------------------------------------------------------------ --
-- Criação da Stored Procedure (SP) - para inserir na tabela tb_item_pedido --

    DELIMITER $$
CREATE PROCEDURE sp_insere_item_pedido
(
  IN in_id_pedido int,
  IN in_id_produto  int ,
  IN in_qt_item varchar(255),
  IN in_vl_item varchar(255)
)
BEGIN
	INSERT INTO tb_item_pedido (id_pedido,id_produto,qt_item,vl_item) VALUES (in_id_pedido,in_id_produto ,in_qt_item,in_vl_item);
END $$
DELIMITER ;

/*Exemplo de chamada de uma Stored Procedure na tabela tb_pedido*/

CALL sp_insere_item_pedido('4','2','4','R$ 40,00');

select*from tb_item_pedido;
-- ------------------------------------------------------------------------------------------------------------------------------------------------ --
-- Criação da Stored Procedure (SP) - para atualizar a tabela tb_cliente --

    DELIMITER $$
CREATE PROCEDURE sp_modifica_cliente
(
  IN in_id_cliente int,
  IN in_nm_cliente VARCHAR(255),
  IN in_nm_email varchar(255),
  IN in_nr_telefone varchar(11)
)
BEGIN
	update tb_cliente SET nm_cliente = in_nm_cliente , nm_email = in_nm_email,nr_telefone = in_nr_telefone  where id_cliente = in_id_cliente  ;/*Aqui e sempre antes o campo da tabela igual o nome que criei na procedure*/
END $$
DELIMITER ;

/*Exemplo de chamada de uma Stored Procedure na tabela tb_cliente*/

CALL sp_modifica_cliente(4,'Macau','macau@gmail.com.br','13911111111');

select * from tb_cliente;

-- ------------------------------------------------------------------------------------------------------------------------------------------------ --

-- Criação da Stored Procedure (SP) - para atualizar a tabela tb_produto --

    DELIMITER $$
CREATE PROCEDURE sp_modifica_produto
(
  IN in_id_produto int,
  IN in_nm_produto VARCHAR(255),
  IN in_qt_estoque varchar(100),
  IN in_vl_venda varchar(255)
)
BEGIN
	update tb_produto SET nm_produto = in_nm_produto , qt_estoque = in_qt_estoque , vl_venda = in_vl_venda  where id_produto = in_id_produto  ;/*Aqui e sempre antes o campo da tabela igual o nome que criei na procedure*/
END $$
DELIMITER ;

/*Exemplo de chamada de uma Stored Procedure na tabela tb_produto*/

CALL sp_modifica_produto(4,'Cloro','50','R$ 100,00');

select * from tb_produto;

-- ------------------------------------------------------------------------------------------------------------------------------------------------ --

-- Criação da Stored Procedure (SP) - para atualizar a tabela tb_pedido --

    DELIMITER $$
CREATE PROCEDURE sp_modifica_pedido
(
  IN in_id int,
  IN in_id_cliente int,
  IN in_dt_pedido date,
  IN in_ds_obs varchar(255)
)
BEGIN
	update tb_pedido SET id_cliente = in_id_cliente , dt_pedido = in_dt_pedido , ds_obs = in_ds_obs  where id = in_id  ;/*Aqui e sempre antes o campo da tabela igual o nome que criei na procedure*/
END $$
DELIMITER ;

/*Exemplo de chamada de uma Stored Procedure na tabela tb_pedido*/

CALL sp_modifica_pedido(6,'3','2019-09-20','Otima entrega');

select * from tb_pedido;

-- ------------------------------------------------------------------------------------------------------------------------------------------------ --

-- Criação da Stored Procedure (SP) - para atualizar a tabela tb_item_pedido --


    DELIMITER $$
CREATE PROCEDURE sp_modifica_item_pedido
(
  IN in_id_pedido int,
  IN in_id_produto int,
  IN in_qt_item varchar(255),
  IN in_vl_item varchar(255)
)
BEGIN
	update tb_item_pedido SET   qt_item = in_qt_item, vl_item = in_vl_item   where id_pedido = in_id_pedido and id_produto = in_id_produto  ;/*Aqui e sempre antes o campo da tabela igual o nome que criei na procedure*/
END $$
DELIMITER ;

/*Exemplo de chamada de uma Stored Procedure na tabela tb_pedido*/

CALL sp_modifica_item_pedido('3','1','5','R$ 60,00');

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

CALL delete_tb_cliente(3);

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
  in in_id int
)
BEGIN
    delete from tb_pedido where id = in_id ;
END $$
DELIMITER ;

/*Exemplo de chamada de uma Stored Procedure na tabela tb_pedido*/

CALL delete_tb_pedido(5);

select*from tb_pedido;

-- -------------------------------------------------------------------------------------------------------------------------------------------------- --
DELIMITER $$
CREATE PROCEDURE delete_tb_item_pedido
(
  in in_id_pedido int,
  in in_id_produto int
)
BEGIN
    delete from tb_item_pedido where id_pedido = in_id_pedido and id_produto = in_id_produto;
END $$
DELIMITER ;

/*Exemplo de chamada de uma Stored Procedure na tabela tb_pedido*/

CALL delete_tb_item_pedido(4,2);

select*from tb_item_pedido;

-- ---------------------------------------------------------------------------------------------------------------------------------------------- --

DELIMITER $$
CREATE PROCEDURE sp_cliente
(
  IN in_acao VARCHAR(1),
  IN in_id_cliente INT,
  IN in_nm_cliente VARCHAR(255),
  IN in_nm_email VARCHAR(255),
  IN in_nr_telefone VARCHAR(11)
)
BEGIN
    IF (in_acao = 'I') THEN
    BEGIN
		INSERT INTO tb_cliente(nm_cliente,nm_email,nr_telefone) VALUES(in_nm_cliente,in_nm_email,in_nr_telefone);
	END;
    ELSEIF (in_acao = 'A') THEN
    BEGIN
		UPDATE tb_cliente SET nm_cliente = in_nm_cliente ,nm_email = in_nm_email,nr_telefone = in_nr_telefone  WHERE id_cliente = in_id_cliente;   
	END;
	ELSEIF (in_acao = 'E') THEN
    BEGIN
		DELETE FROM tb_cliente WHERE id_cliente = in_id_cliente;
    END;
    END IF;
END $$
DELIMITER ;

/*Exemplo 02 de chamada de uma Stored Procedure:*/

	-- Chamada para Inclusão
CALL sp_cliente("I", null, 'Adrianooooo','adriano32@gmail.com.br','13988444444');/*NULL para "id" porque gera automaticamente*/

-- Chamada para Alteração
CALL sp_cliente("A", 5, 'Adriano','adriano32@gmail.com.br','13988444444');

-- Chamada para Exclusão
CALL sp_cliente("E", '4',null,null,null);

-- Select para testar como ficou o dado na tabela
select * from tb_cliente
-- ------------------------------------------------------------------------------------------------------------------------------------------------ --

DELIMITER $$
CREATE PROCEDURE sp_produto
(
  IN in_acao VARCHAR(1),
  IN in_id_produto INT,
  IN in_nm_produto VARCHAR(255),
  IN in_qt_estoque VARCHAR(100),
  IN in_vl_venda VARCHAR(255)
)
BEGIN
    IF (in_acao = 'I') THEN
    BEGIN
		INSERT INTO tb_produto(nm_produto,qt_estoque,vl_venda) VALUES(in_nm_produto,in_qt_estoque,in_vl_venda);
	END;
    ELSEIF (in_acao = 'A') THEN
    BEGIN
		UPDATE tb_produto SET nm_produto = in_nm_produto ,qt_estoque = in_qt_estoque,vl_venda = in_vl_venda  WHERE id_produto = in_id_produto;   
	END;
	ELSEIF (in_acao = 'E') THEN
    BEGIN
		DELETE FROM tb_produto WHERE id_produto = in_id_produto;
    END;
    END IF;
END $$
DELIMITER ;

/*Exemplo 02 de chamada de uma Stored Procedure:*/

	-- Chamada para Inclusão
CALL sp_produto("I", null, 'Omo','30','R$ 20,00');/*NULL para "id" porque gera automaticamente*/

-- Chamada para Alteração
CALL sp_produto("A", 5, 'OmO','30','R$ 20,00');

-- Chamada para Exclusão
CALL sp_produto("E", '5',null,null,null);

-- Select para testar como ficou o dado na tabela
select * from tb_produto

-- --------------------------------------------------------------------------------------------------------------------------------------------------- --

DELIMITER $$
CREATE PROCEDURE sp_pedido
(
  IN in_acao VARCHAR(1),
  IN in_id INT,
  IN in_id_cliente INT,
  IN in_dt_pedido date,
  IN in_ds_obs VARCHAR(255)

)
BEGIN
    IF (in_acao = 'I') THEN
    BEGIN
		INSERT INTO tb_pedido(id_cliente,dt_pedido,ds_obs) VALUES(in_id_cliente,in_dt_pedido,in_ds_obs);
	END;
    ELSEIF (in_acao = 'A') THEN
    BEGIN
		UPDATE tb_pedido SET id_cliente = in_id_cliente ,dt_pedido = in_dt_pedido,ds_obs = in_ds_obs  WHERE id = in_id;   
	END;
	ELSEIF (in_acao = 'E') THEN
    BEGIN
		DELETE FROM tb_pedido WHERE id = in_id;
    END;
    END IF;
END $$
DELIMITER ;

/*Exemplo 02 de chamada de uma Stored Procedure:*/

	-- Chamada para Inclusão
CALL sp_pedido("I", null,'3','2012-08-21','Por favor entregar logo');/*NULL para "id" porque gera automaticamente*/

-- Chamada para Alteração
CALL sp_pedido("A", 7, '4','2012-08-21','Por favor entregar logo');

-- Chamada para Exclusão
CALL sp_pedido("E", '7',null,null,null);

-- Select para testar como ficou o dado na tabela
select * from tb_pedido

-- --------------------------------------------------------------------------------------------------------------------------------------------------- --

DELIMITER $$
CREATE PROCEDURE sp_item_pedido
(
  IN in_acao VARCHAR(1),
  IN in_id_pedido INT,
  IN in_id_produto INT,
  IN in_qt_item VARCHAR(255),
  IN in_vl_item VARCHAR(255)

)
BEGIN
    IF (in_acao = 'I') THEN
    BEGIN
		INSERT INTO tb_item_pedido(id_pedido,id_produto,qt_item,vl_item) VALUES(in_id_pedido,in_id_produto,in_qt_item,in_vl_item);
	END;
    ELSEIF (in_acao = 'A') THEN
    BEGIN
		UPDATE tb_item_pedido SET qt_item = in_qt_item,vl_item = in_vl_item  WHERE id_pedido = in_id_pedido and id_produto = in_id_produto;   
	END;
	ELSEIF (in_acao = 'E') THEN
    BEGIN
		DELETE FROM tb_item_pedido WHERE id_pedido = in_id_pedido and id_produto = in_id_produto;
    END;
    END IF;
END $$
DELIMITER ;

/*Exemplo 02 de chamada de uma Stored Procedure:*/

	-- Chamada para Inclusão
CALL sp_item_pedido("I", '4','3','4','R$ 40,00');/*NULL para "id" porque gera automaticamente*/

-- Chamada para Alteração
CALL sp_item_pedido("A", 4,'3','5','R$ 100,00');

-- Chamada para Exclusão
CALL sp_item_pedido("E", 4,3,null,null);

-- Select para testar como ficou o dado na tabela
select * from tb_item_pedido

-- --------------------------------------------------------------------------------------------------------------------------------------------------- --

drop procedure spp_cliente
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
   IN in_nm_cliente VARCHAR(255),
  IN in_nm_email VARCHAR(255),
  IN in_nr_telefone VARCHAR(11)
)
BEGIN
    IF (in_acao = 'I') THEN
    BEGIN
		INSERT INTO tb_cliente
		(
		nm_cliente,
        nm_email,
		nr_telefone
		)
		VALUES
		(
		  in_nm_cliente,
		 in_nm_email,
         in_nr_telefone
		);
        
      SET in_id_cliente  = ( SELECT MAX(id_cliente) FROM tb_cliente );/* Do exercicio anterior só mudo isso*/ /*Aqui vai pegar o maior id da tabela*/
	END;
    ELSEIF (in_acao = 'A') THEN
    BEGIN
		UPDATE tb_cliente
		SET nm_cliente    = in_nm_cliente,
		   nm_email = in_nm_email,
           nr_telefone = in_nr_telefone
		WHERE id_cliente = in_id_cliente;   
	END;
	ELSEIF (in_acao = 'E') THEN
    BEGIN
		DELETE FROM tb_cliente
        WHERE id_cliente = in_id_cliente;
    END;
    END IF;
END $$
DELIMITER ;

/*Exemplo 03 de chamada de uma Stored Procedure:*/

-- Chamada para Inclusão
/*Para criar uma variavel no mysql eu coloco @ e o nome para ela.Toda variavel tem que ter @*/
/*Aqui eu criei uma variavel "@ID" que estou atribuindo um valor nulo para ela*/
SET @ID = NULL;
CALL spp_cliente("I", @ID, 'Brunooo Victor','bruno.victor32@gmail.com.br','13988123456');/*Aqui estou passando a variavel vazia lá para minha procedure.Essa variavel vai entra no in_id.Si eu passar algum valor
nesse parametro in_id ele vai sofrer alteração dentro do update,insert e delete.E a procedure automaticamente vai escrever o valor que ele processo ai dentro,dentro da variavel que
passo dentro in_id*/
/*SELECT @ID*/
SELECT CONCAT("O ID ", @ID, " foi inserido")

-- Chamada para Alteração
SET @ID = 6;
CALL spp_cliente("A", @ID, 'Bruno Victor','bruno.victor32@gmail.com.br','13988123456');

-- Chamada para Exclusão
SET @ID = 6;
CALL spp_cliente("E", @ID, null, null,null);

-- Select para testar como ficou o dado na tabela
select * from tb_cliente

-- ----------------------------------------------------------------------------------------------------------------------------------- --

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
   IN in_nm_produto VARCHAR(255),
  IN in_qt_estoque VARCHAR(100),
  IN in_vl_venda VARCHAR(255)
)
BEGIN
    IF (in_acao = 'I') THEN
    BEGIN
		INSERT INTO tb_produto
		(
		nm_produto,
        qt_estoque,
		vl_venda
		)
		VALUES
		(
		  in_nm_produto,
		 in_qt_estoque,
         in_vl_venda
		);
        
      SET in_id_produto  = ( SELECT MAX(id_produto) FROM tb_produto );/* Do exercicio anterior só mudo isso*/ /*Aqui vai pegar o maior id da tabela*/
	END;
    ELSEIF (in_acao = 'A') THEN
    BEGIN
		UPDATE tb_produto
		SET nm_produto    = in_nm_produto,
		   qt_estoque = in_qt_estoque,
           vl_venda = in_vl_venda
		WHERE id_produto = in_id_produto;   
	END;
	ELSEIF (in_acao = 'E') THEN
    BEGIN
		DELETE FROM tb_produto
        WHERE id_produto = in_id_produto;
    END;
    END IF;
END $$
DELIMITER ;

/*Exemplo 03 de chamada de uma Stored Procedure:*/

-- Chamada para Inclusão
/*Para criar uma variavel no mysql eu coloco @ e o nome para ela.Toda variavel tem que ter @*/
/*Aqui eu criei uma variavel "@ID" que estou atribuindo um valor nulo para ela*/
SET @ID = NULL;
CALL spp_produto("I", @ID, 'Assolan','10','R$ 10,00');/*Aqui estou passando a variavel vazia lá para minha procedure.Essa variavel vai entra no in_id.Si eu passar algum valor
nesse parametro in_id ele vai sofrer alteração dentro do update,insert e delete.E a procedure automaticamente vai escrever o valor que ele processo ai dentro,dentro da variavel que
passo dentro in_id*/
/*SELECT @ID*/
SELECT CONCAT("O ID ", @ID, " foi inserido")

-- Chamada para Alteração
SET @ID = 6;
CALL spp_produto("A", @ID, 'Assolannnn','10','R$ 10,00');

-- Chamada para Exclusão
SET @ID = 6;
CALL spp_produto("E", @ID, null, null,null);

-- Select para testar como ficou o dado na tabela
select * from tb_produto

-- ----------------------------------------------------------------------------------------------------------------------- --

DELIMITER $$
CREATE PROCEDURE spp_pedido
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
  IN in_id_cliente INT,
   IN in_dt_pedido date,
  IN in_ds_obs VARCHAR(100)
)
BEGIN
    IF (in_acao = 'I') THEN
    BEGIN
		INSERT INTO tb_pedido
		(
		id_cliente,
        dt_pedido,
		ds_obs
		)
		VALUES
		(
		  in_id_cliente,
		 in_dt_pedido,
         in_ds_obs
		);
        
      SET in_id  = ( SELECT MAX(id) FROM tb_pedido );/* Do exercicio anterior só mudo isso*/ /*Aqui vai pegar o maior id da tabela*/
	END;
    ELSEIF (in_acao = 'A') THEN
    BEGIN
		UPDATE tb_pedido
		SET id_cliente   = in_id_cliente,
		   dt_pedido = in_dt_pedido,
           ds_obs = in_ds_obs
		WHERE id = in_id;   
	END;
	ELSEIF (in_acao = 'E') THEN
    BEGIN
		DELETE FROM tb_pedido
        WHERE id = in_id;
    END;
    END IF;
END $$
DELIMITER ;

/*Exemplo 03 de chamada de uma Stored Procedure:*/

-- Chamada para Inclusão
/*Para criar uma variavel no mysql eu coloco @ e o nome para ela.Toda variavel tem que ter @*/
/*Aqui eu criei uma variavel "@ID" que estou atribuindo um valor nulo para ela*/
SET @ID = NULL;
CALL spp_pedido("I", @ID, '4','2020-08-21','Por favor entregar logo');/*Aqui estou passando a variavel vazia lá para minha procedure.Essa variavel vai entra no in_id.Si eu passar algum valor
nesse parametro in_id ele vai sofrer alteração dentro do update,insert e delete.E a procedure automaticamente vai escrever o valor que ele processo ai dentro,dentro da variavel que
passo dentro in_id*/
/*SELECT @ID*/
SELECT CONCAT("O ID ", @ID, " foi inserido")

-- Chamada para Alteração
SET @ID = 8;
CALL spp_pedido("A", @ID, '3','2021-08-21','Por favor entregar logo');

-- Chamada para Exclusão
SET @ID = 8;
CALL spp_pedido("E", @ID, null, null,null);

-- Select para testar como ficou o dado na tabela
select * from tb_pedido

-- ----------------------------------------------------------------------------------------------------------------------- --

DELIMITER $$
CREATE PROCEDURE spp_item_pedido
(
  IN in_acao VARCHAR(1),
  INOUT in_in_pedido INT, /* Do exercicio anterior só mudo isso -- Esse parametro "id" e o "id" da tabela do professor que e gerado automaticamente --
  -- Por exemplo si eu incluir um cara na tabela e eu quiser o "id" que ele acabou de gerar ou seja si eu tenho uma procedure eu quero que ela inclua
  um cara na tabela,mas eu quero que ela me retorne o id que ela incluiu.Quero que ela me retorne alguma informação que ela processo lá dentro dela
  e me retorne isso.--E o cara que eu quero que me retorne e o "id",então ao inves de deixar o parametro como "IN" igual os outros que e um parametro de
  INPUT ou ENTRADA.Agora eu estou deixando com um parametro de input e outpu que significa que eu posso pedir ou seja informar um valor para ele ou seja eu estou dando input
  e ele vai usar la dentro assim como faço com nome e telefone ou seja estou passando um valor que ele vai usar lá dentro ou eu falo assim para ele eu vou te passa
  uma variavel nesse parametro e você por favor processa o "id" ai dentro e no final das contas ele escreve o valor do id que ele gero do cara que ele acabo de incluir.Ele escreve esse valor
  no parametro na variavel que foi passada,ai quando a procedure for executada ver qual esse valor do parametro*/ 
  INOUT in_id_produto INT,
   IN in_qt_item VARCHAR(255),
  IN in_vl_item VARCHAR(100)
)
BEGIN
    IF (in_acao = 'I') THEN
    BEGIN
		INSERT INTO tb_item_pedido(id_pedido,id_produto,qt_item,vl_item) VALUES(in_id_pedido,in_id_produto,in_qt_item,in_vl_item);
      SET in_in_pedido = in_id_produto = ( SELECT MAX(in_pedido = id_produto) FROM tb_item_pedido );/* Do exercicio anterior só mudo isso*/ /*Aqui vai pegar o maior id da tabela*/
	END;
    ELSEIF (in_acao = 'A') THEN
    BEGIN  
        UPDATE tb_item_pedido SET qt_item = in_qt_item,vl_item = in_vl_item  WHERE id_pedido = in_id_pedido and id_produto = in_id_produto;  
	END;
	ELSEIF (in_acao = 'E') THEN
    BEGIN
        DELETE FROM tb_item_pedido WHERE id_pedido = in_id_pedido and id_produto = in_id_produto;
    END;
    END IF;
END $$
DELIMITER ;

/*Exemplo 03 de chamada de uma Stored Procedure:*/

-- Chamada para Inclusão
/*Para criar uma variavel no mysql eu coloco @ e o nome para ela.Toda variavel tem que ter @*/
/*Aqui eu criei uma variavel "@ID" que estou atribuindo um valor nulo para ela*/
SET @ID = NULL;
CALL spp_item_pedido("I", 5,3,'5','R$ 40,00')/*Aqui estou passando a variavel vazia lá para minha procedure.Essa variavel vai entra no in_id.Si eu passar algum valor
nesse parametro in_id ele vai sofrer alteração dentro do update,insert e delete.E a procedure automaticamente vai escrever o valor que ele processo ai dentro,dentro da variavel que
passo dentro in_id*/
/*SELECT @ID*/
SELECT CONCAT("O ID ", @ID, " foi inserido")

-- Chamada para Alteração
SET @ID = 8;
CALL spp_item_pedido("A",@ID, 4,'3','5','R$ 100,00');

-- Chamada para Exclusão
SET @ID = 8;
CALL spp_item_pedido("E", 4,3,null,null);

-- Select para testar como ficou o dado na tabela
select * from tb_item_pedido

 -- ---------------------------------- --

insert tb_cliente (nm_cliente,nm_email,nr_telefone) values   ('Bruno Victor','bruno.victor32@gmail.com.br','13988123456');
insert tb_cliente (nm_cliente,nm_email,nr_telefone) values	 ('Matheus Henrique','matheus32@gmail.com.br','13988222222');
insert tb_cliente (nm_cliente,nm_email,nr_telefone) values   ('Gracineide','gracineide32@gmail.com.br','13988333333');
insert tb_cliente (nm_cliente,nm_email,nr_telefone) values  ('Adrianooooo','adriano32@gmail.com.br','13988444444');
insert tb_cliente (nm_cliente,nm_email,numero_telefone) values  ('Thiago','thiago32@gmail.com.br',null);

insert tb_produto (nm_produto,qt_estoque,vl_venda) values   ('Assolan','10','R$ 10,00');
insert tb_produto (nm_produto,qt_estoque,vl_venda) values	 ('Amaciante','11','R$ 13,00');
insert tb_produto (nm_produto,qt_estoque,vl_venda) values   ('Detergente','25','R$ 15,00');
insert tb_produto (nm_produto,qt_estoque,vl_venda) values  ('Omo','30','R$ 20,00');
insert tb_produto (nm_produto,qt_estoque,vl_venda) values  ('Desenfetante','4','R$ 21,00');

insert tb_pedido (id_cliente,dt_pedido,ds_obs) values   ('4','2012-08-21','Por favor entregar logo');
insert tb_pedido (id_cliente,dt_pedido,ds_obs) values	 ('4','2014-08-27','Por favor entregar logo');
insert tb_pedido (id_cliente,dt_pedido,ds_obs) values   ('2','2016-08-23','Por favor entregar logo');

insert tb_item_pedido (id_pedido,id_produto,qt_item,vl_item) values   ('1','2','4','R$ 40,00');
insert tb_item_pedido (id_pedido,id_produto,qt_item,vl_item) values	 ('5','3','5','R$ 65,00');
insert tb_item_pedido (id_pedido,id_produto,qt_item,vl_item) values   ('5','4','6','R$ 90,00');

select a.id_cliente,
	   a.nm_cliente,
       b.id_cliente
       from tb_cliente a inner join tb_pedido b on (a.id_cliente = b.id_cliente)
       
       select a.id_cliente,
	   a.nm_cliente,
       b.id_produto,
       b.nm_produto
       from tb_cliente a left join tb_produto b on (a.id_cliente = b.id_produto)
       where a.id_cliente = 1
       
         select a.id_cliente as Id-Cliente,
	            a.nm_cliente as Cliente,
       b.nm_produto as Produto,/*Para não mostrar o nome da coluna e sim um nome que eu quero uso o "as"*/
       c.id_produto  as Id-Produto,
       c.id_produto as Id-Produto
              from tb_empregado a left join tb_banco b on (a.id_banco = b.id)
								  inner join tb_item_pedido c on (a.id_profissao = c.id);
                                  
-- Altere a coluna nr_telefone para numero_telefone e seu tipo de dado para varchar(11) NULL --

ALTER TABLE tb_cliente CHANGE nr_telefone numero_telefone varchar(11) NULL;

ALTER TABLE tb_cliente CHANGE numero_telefone nr_telefone varchar(11) NULL;
                                  
   -- Exibir os Clientes --
   select * from tb_cliente;
   
-- Exibir todos os Clientes que não tem telefone --
   SELECT id_cliente,nm_cliente FROM tb_cliente where (nr_telefone is null);
   
 -- Exibir todos os Clientes que tem telefone --
     SELECT id_cliente,nm_cliente FROM tb_cliente where (nr_telefone is not null);

-- Exibir os Produtos --
   select * from tb_produto;
   
   select nm_produto from tb_produto;
   
   -- Exibir todos os Produtos que tem o valor de custo superior a 10 reais e o valor de venda inferior a 20 reais --
   select nm_produto from tb_produto where (vl_venda > 'R$ 10,00') and (vl_venda < 'R$ 20,00');
   
   -- Exibir todos os Produtos que tem o valor de custo superior a 20 reais e quantidade de estoque menor que 5 peças --
   select nm_produto from tb_produto where (vl_venda > 'R$ 20,00') and (qt_estoque < '5');   
   
   -- Exibir as informações de Pedidos, o Nome do Cliente e o Email --
   select a.ds_obs as Informação,
          b.nm_cliente as Nome,
          b.nm_email as Email
          from tb_pedido a inner join tb_cliente b on (a.id = b.id_cliente);

-- Exibir as informações do Id do Pedido, Nome do Produto, Nome do Cliente e Telefone --
   select a.id as IdPedido,
          b.nm_produto as NomeProduto,
          c.nm_cliente as NomeCliente,
          c.nr_telefone as NumeroTelefone
          from tb_pedido a inner join tb_produto b on (a.id = b.id_produto)
                           inner join tb_cliente c on (a.id = c.id_cliente);
                           
	-- Exibir as informações do Id do Pedido, Nome do Produto, Quantidade comprada, Valor de Venda e Nome do Cliente      --
    select a.id as IdPedido,
		   b.nm_produto as NomeProduto,
           b.qt_estoque as QuantidadeComprada,
           b.vl_venda as ValordeVenda,
           c.nm_cliente as Cliente
           from tb_pedido a inner join tb_produto b on (a.id = b.id_produto)
                           inner join tb_cliente c on (a.id = c.id_cliente);
                           
	-- Exibir as informações do Id do Pedido, Nome do Produto, Quantidade comprada, Valor de Venda e Nome do Cliente      --
    select a.id as IdPedido,
		   b.nm_produto as NomeProduto,
           b.qt_estoque as QuantidadeComprada,
           b.vl_venda as ValordeVenda,
           c.nm_cliente as Cliente
           from tb_pedido a left join tb_produto b on (a.id = b.id_produto)
                           left join tb_cliente c on (a.id = c.id_cliente);
           
           
   select*from tb_pedido;