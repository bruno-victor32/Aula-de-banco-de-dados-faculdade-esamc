use db_blackboard;

select * from tb_banco;
select * from tb_empregado;
select * from tb_professor;
select * from tb_profissão;

/*Retorna todas as procedures do banco*/
SHOW PROCEDURE STATUS WHERE Db = 'db_blackboard';

SHOW PROCEDURE STATUS/*Aqui não retorna dados,e sim meta dados
limpa_pedido

/*Comando para deletar procedures*/
drop procedure sp_insere_banco;
drop procedure sp_delete_banco;
drop procedure sp_modifica_banco;

desc tb_banco;
desc tb_empregado;
desc tb_professor;
desc tb_profissão;

-- Criação da Stored Procedure (SP) - para inserir na tabela tb_banco --

    DELIMITER $$
CREATE PROCEDURE sp_insere_banco
(
  IN in_nome VARCHAR(255)
)
BEGIN
	INSERT INTO tb_banco (nome) VALUES (in_nome);
END $$
DELIMITER ;

/*Exemplo de chamada de uma Stored Procedure na tabela tb_banco*/

CALL sp_insere_banco("XP-Investe");
    
    /*--------------------------------*/
    
-- Criação da Stored Procedure (SP) - para deletar na tabela tb_banco --

DELIMITER $$
CREATE PROCEDURE sp_delete_banco
(
  in in_id INT
)
BEGIN
    delete from tb_banco where id = in_id ;
END $$
DELIMITER ;

/*Exemplo de chamada de uma Stored Procedure na tabela tb_banco*/

CALL sp_delete_banco(4);

-- Criação da Stored Procedure (SP) - para atualizar a tabela tb_banco --

    DELIMITER $$
CREATE PROCEDURE sp_modifica_banco
(
  IN in_id int,
  IN in_nome VARCHAR(255)
)
BEGIN
	update tb_banco SET nome = in_nome where id = in_id;/*Aqui e sempre antes o campo da tabela igual o nome que criei na procedure*/
END $$
DELIMITER ;

/*Exemplo de chamada de uma Stored Procedure na tabela tb_banco*/

CALL sp_modifica_banco(1,'Bradescoo');

-- --------------------------------------------------------------------------------------------------------------------------------------------------------- --

-- Criação da Stored Procedure (SP) - para inserir na tabela tb_professor --

DELIMITER $$
USE `db_blackboard`$$
CREATE PROCEDURE `insert_tb_professor` (
	IN in_nome varchar(255),
    IN in_tel varchar(30)
)
BEGIN
insert into tb_professor (nome,telefone) values (in_nome,in_tel);
END$$
DELIMITER ;

/*Exemplo de chamada de uma Stored Procedure na tabela tb_professor*/

CALL insert_tb_professor ('fer','2222222222');

-- Criação da Stored Procedure (SP) - para deletar na tabela tb_professor --


DROP procedure IF EXISTS `delete_tb_professor`;

DELIMITER $$
CREATE PROCEDURE delete_tb_professor
(
  in in_id INT
)
BEGIN
    delete from tb_professor where id = in_id ;
END $$
DELIMITER ;

/*Exemplo de chamada de uma Stored Procedure na tabela tb_professor*/

CALL delete_tb_professor(7);

-- Criação da Stored Procedure (SP) - para atualizar a tabela tb_professor --

    DELIMITER $$
CREATE PROCEDURE sp_modifica_professor
(
  IN in_id int,
  IN in_nome VARCHAR(255),
  IN in_telefone varchar(30)
 
)
BEGIN
	update tb_professor SET nome = in_nome , telefone = in_telefone where id = in_id  ;/*Aqui e sempre antes o campo da tabela igual o nome que criei na procedure*/
    
END $$
DELIMITER ;

/*Exemplo de chamada de uma Stored Procedure na tabela tb_professor*/

CALL sp_modifica_professor(2,'Fran','13111111111');

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------- --

-- Criação da Stored Procedure (SP) - para inserir na tabela tb_profissão --

DELIMITER $$
CREATE PROCEDURE `insert_tb_profissao` (

	IN in_nome varchar(50),
    IN in_descricao varchar(30)
)
BEGIN
insert into tb_profissao (nome,descricao) values (in_nome,in_descricao);
END$$
DELIMITER ;

/*Exemplo de chamada de uma Stored Procedure na tabela tb_profissao*/

CALL insert_tb_profissao ('Desenvolvedor','Criar algo novo');

-- Criação da Stored Procedure (SP) - para deletar na tabela tb_profissao --

DELIMITER $$
CREATE PROCEDURE delete_tb_profissao
(
  in in_id INT
)
BEGIN
    delete from tb_profissao where id = in_id ;
END $$
DELIMITER ;

/*Exemplo de chamada de uma Stored Procedure na tabela tb_profissao*/

CALL delete_tb_profissao(5);

-- Criação da Stored Procedure (SP) - para atualizar a tabela tb_profissao --

    DELIMITER $$
CREATE PROCEDURE sp_modifica_profissao
(
  IN in_id int,
  IN in_nome VARCHAR(50),
  IN in_descricao varchar(255)
)
BEGIN
	update tb_profissao SET nome = in_nome , descricao = in_descricao where id = in_id  ;/*Aqui e sempre antes o campo da tabela igual o nome que criei na procedure*/
END $$
DELIMITER ;

/*Exemplo de chamada de uma Stored Procedure na tabela tb_profissao*/

CALL sp_modifica_profissao(4,'analista','superar as dificuldades');

-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------ --

-- Criação da Stored Procedure (SP) - para atualizar a tabela tb_empregado --

    DELIMITER $$
CREATE PROCEDURE sp_modifica_empregado
(
  IN in_id int,
  IN in_nome VARCHAR(255),
  IN in_cpf varchar(11),
  IN in_idbanco int,
  IN in_idprofissao int
)
BEGIN
	update tb_empregado SET nome = in_nome , cpf = in_cpf, id_banco = in_idbanco, id_profissao = in_idprofissao where id = in_id  ;/*Aqui e sempre antes o campo da tabela igual o nome que criei na procedure*/
END $$
DELIMITER ;

/*Exemplo de chamada de uma Stored Procedure na tabela tb_empregado*/

CALL sp_modifica_empregado(2,'brunaoo','242424',3,2);

-- Criação da Stored Procedure (SP) - para inserir na tabela tb_empregado --

DELIMITER $$
CREATE PROCEDURE `insert_tb_empregado` (

  IN in_nome VARCHAR(255),
  IN in_cpf varchar(11),
  IN in_idbanco int,
  IN in_idprofissao int
)
BEGIN
insert into tb_empregado (nome,cpf,id_banco,id_profissao) values (in_nome,in_cpf,in_idbanco,in_idprofissao);
END$$
DELIMITER ;

/*Exemplo de chamada de uma Stored Procedure na tabela tb_empregado*/

CALL insert_tb_empregado('Larissa','12345678911',1,1);

-- Criação da Stored Procedure (SP) - para deletar na tabela tb_empregado --

DELIMITER $$
CREATE PROCEDURE delete_tb_empregado
(
  in in_id INT
)
BEGIN
    delete from tb_empregado where id = in_id ;
END $$
DELIMITER ;

/*Exemplo de chamada de uma Stored Procedure na tabela tb_empregado*/

CALL delete_tb_empregado(7);

-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------ --
/*OUTRA MANEIRA DE FAZER UMA PROCEDURE -AULA 06*/

/*Exemplo 02 de Criação de Stored Procedure:*/
/*Esse "ação" ele vai,quando eu for passar os dados para essa procedure em vez de passar id,nome,telefone,ra que são dados da tabela eu vou passar o parametro "ação"
que ele e um varchar de 1 ou seja e uma string que talvez eu passe uma letra "I" para ele,ou vou passar a letra "A",ou a letra "E"."I" de inclusão,"E" de exclusao e 
"A" de alteração*/
/*Dentro da minha procedure eu fiz uma programação,quando vc vai desenvolver em sql,ele também tem programação ele tem if,case,while por exemplo
Aqui eu criei uma procedure que recebe esses parametros,e além dos parametros que vou usar na tabela eu coloquei um parametro que não vou usar na tabela
mas ele vai ser um parametro de controle dentro da minha procedure.Esse "ação" eu sempre vou passar "I","A" ou "E".Si a "ação" for "I" então eu faço uma inclusao
Si for "A" faz update e si for "E" faz um delete*/

-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------ --

DELIMITER $$
CREATE PROCEDURE sp_professor
(
  IN in_acao VARCHAR(1),
  IN in_id INT,
  IN in_nome VARCHAR(255),
  IN in_telefone VARCHAR(255)
)
BEGIN
    IF (in_acao = 'I') THEN
    BEGIN
		INSERT INTO tb_professor(nome,telefone) VALUES(in_nome,in_telefone);
	END;
    ELSEIF (in_acao = 'A') THEN
    BEGIN
		UPDATE tb_professor SET nome = in_nome ,telefone = in_telefone WHERE id = in_id;   
	END;
	ELSEIF (in_acao = 'E') THEN
    BEGIN
		DELETE FROM tb_professor WHERE id = in_id;
    END;
    END IF;
END $$
DELIMITER ;

/*Exemplo 02 de chamada de uma Stored Procedure:*/

	-- Chamada para Inclusão
CALL sp_professor("I", null, "Joseffe", "1234");/*NULL para "id" porque gera automaticamente*/

-- Chamada para Alteração
CALL sp_professor("A", 8, "Joseffe Oliveira", "013 989786778");

-- Chamada para Exclusão
CALL sp_professor("E", 8, null, null);

-- Select para testar como ficou o dado na tabela
select * from tb_professor

-- ------------------------------------------------------------------------------------------------------------------------------------------------------------- --
DELIMITER $$
CREATE PROCEDURE sp_banco
(
  IN in_acao VARCHAR(1),
  IN in_id INT,
  IN in_nome VARCHAR(255)

)
BEGIN
    IF (in_acao = 'I') THEN
    BEGIN
		INSERT INTO tb_banco(nome) VALUES(in_nome);
	END;
    ELSEIF (in_acao = 'A') THEN
    BEGIN
		UPDATE tb_banco SET nome = in_nome  WHERE id = in_id;   
	END;
	ELSEIF (in_acao = 'E') THEN
    BEGIN
		DELETE FROM tb_banco WHERE id = in_id;
    END;
    END IF;
END $$
DELIMITER ;

/*Exemplo 02 de chamada de uma Stored Procedure:*/

	-- Chamada para Inclusão
CALL sp_banco("I", null, "Nubank");/*NULL para "id" porque gera automaticamente*/

-- Chamada para Alteração
CALL sp_banco("A", 3, "Caixaa");

-- Chamada para Exclusão
CALL sp_banco("E", 5, null);/*Coloquei null no nome porque estou deletando usando o id como parametro para deletar*/

-- Select para testar como ficou o dado na tabela
select * from tb_banco

-- --------------------------------------------------------------------------------------------------------------------------------------------------------------- --
DELIMITER $$
CREATE PROCEDURE sp_empregado
(
  IN in_acao VARCHAR(1),
  IN in_id INT,
  IN in_nome VARCHAR(255),
  IN in_cpf VARCHAR(11),
  IN in_id_banco INT,
  IN in_id_profissao INT

)
BEGIN
    IF (in_acao = 'I') THEN
    BEGIN
		INSERT INTO tb_empregado(id,nome,cpf,id_banco,id_profissao) VALUES(in_id,in_nome,in_cpf,in_id_banco,in_id_profissao);
	END;
    ELSEIF (in_acao = 'A') THEN
    BEGIN
		UPDATE tb_empregado SET nome = in_nome,cpf = in_cpf,id_banco = in_id_banco,id_profissao = in_id_profissao WHERE id = in_id;   
	END;
	ELSEIF (in_acao = 'E') THEN
    BEGIN
		DELETE FROM tb_empregado WHERE id = in_id;
    END;
    END IF;
END $$
DELIMITER ;

/*Exemplo 02 de chamada de uma Stored Procedure:*/

	-- Chamada para Inclusão
CALL sp_empregado("I",null, "Gracineide",'12345678901','1','4');/*NULL para "id" porque gera automaticamente*/

-- Chamada para Alteração
CALL sp_empregado("A", 3,"Gracineideeee",'12345678910','2','3');

-- Chamada para Exclusão
CALL sp_empregado("E", '8',null,null,null,null);/*Coloquei null no nome porque estou deletando usando o id como parametro para deletar*/

-- Select para testar como ficou o dado na tabela
select * from tb_empregado

desc tb_empregado

-- -------------------------------------------------------------------------------------------------------------------------------------------------------------- --
DELIMITER $$
CREATE PROCEDURE sp_profissao
(
  IN in_acao VARCHAR(1),
  IN in_id INT,
  IN in_nome VARCHAR(255),
  IN in_descricao VARCHAR(255)
)
BEGIN
    IF (in_acao = 'I') THEN
    BEGIN
		INSERT INTO tb_profissao(id,nome,descricao) VALUES(in_id,in_nome,in_descricao);
	END;
    ELSEIF (in_acao = 'A') THEN
    BEGIN
		UPDATE tb_profissao SET nome = in_nome,descricao = in_descricao WHERE id = in_id;   
	END;
	ELSEIF (in_acao = 'E') THEN
    BEGIN
		DELETE FROM tb_profissao WHERE id = in_id;
    END;
    END IF;
END $$
DELIMITER ;

/*Exemplo 02 de chamada de uma Stored Procedure:*/

	-- Chamada para Inclusão
CALL sp_profissao("I",null, "DEV",'Desenvolver algo');/*NULL para "id" porque gera automaticamente*/

-- Chamada para Alteração
CALL sp_profissao("A", 6,"DEVVV",'desenvolver algo novo');

-- Chamada para Exclusão
CALL sp_profissao("E", '6',null,null);/*Coloquei null no nome porque estou deletando usando o id como parametro para deletar*/

-- Select para testar como ficou o dado na tabela
select * from tb_profissao

desc tb_profissao

DROP PROCEDURE sp_profissao
