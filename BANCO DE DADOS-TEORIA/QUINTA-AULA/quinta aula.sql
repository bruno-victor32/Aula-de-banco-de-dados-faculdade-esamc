use db_blackboard;

show tables;

select * from tb_professor;

-- Criação da Stored Procedure (SP) - para inserir na tabela tb_professor --
DELIMITER $$
CREATE PROCEDURE sp_insere_professor
(
  IN in_nome VARCHAR(255),
  IN in_telefone VARCHAR(255),
  IN in_ra VARCHAR(255)
)
BEGIN
	INSERT INTO tb_professor
    (
      nome
	 ,telefone
     ,ra
    )
    VALUES
    (
      in_nome
     ,in_telefone
     ,in_ra
    );
END $$
DELIMITER ;

/*Exemplo de chamada de uma Stored Procedure:*/

CALL sp_insere_professor("Bruno de Deus", "1234", "N/A");
    
/*---------------------------------------------*/
    
    select * from tb_banco;
    
-- Criação da Stored Procedure (SP) - para inserir na tabela tb_banco --

    DELIMITER $$
CREATE PROCEDURE sp_insere_banco
(
  IN in_nome VARCHAR(255)
)
BEGIN
	INSERT INTO tb_banco
    (
      nome

    )
    VALUES
    (
      in_nome

    );
END $$
DELIMITER ;

/*Exemplo de chamada de uma Stored Procedure:*/

CALL sp_insere_banco("XP-Investe");
    
    /*--------------------------------*/

select*from tb_banco;

-- Criação da Stored Procedure (SP) - para deletar na tabela tb_banco --

DELIMITER $$
CREATE PROCEDURE sp_delete_banco
(
  in in_id INT
)
BEGIN
    delete from tb_banco
    where id = in_id ;
END $$
DELIMITER ;

CALL sp_delete_banco(1);
    
   /*-----------*/ 
   
   select*from tb_banco;
   
  /*  DELIMITER $$
CREATE PROCEDURE sp_modifica_banco
(
  IN in_id int,
  IN in_nome VARCHAR(255)
 
)
BEGIN
	update tb_banco
    SET

      nome = in_nome
     where in_id = id;
    
    
END $$
DELIMITER ;*/

CALL sp_modifica_banco(1,'Itauu');
    

drop PROCEDURE sp_modifica_banco;

-- Criação da Stored Procedure (SP) - para atualizar a tabela tb_banco --

    DELIMITER $$
CREATE PROCEDURE sp_modifica_banco
(
  IN in_id int,
  IN in_nome VARCHAR(255)
 
)
BEGIN
	update tb_banco
    SET

      nome = in_nome
     where id = in_id;/*Aqui e sempre antes o campo da tabela igual o nome que criei na procedure*/
    
    
END $$
DELIMITER ;


/*Retorna todas as procedures do banco*/
SHOW PROCEDURE STATUS WHERE Db = 'db_blackboard';

SHOW PROCEDURE STATUS/*Aqui não retorna dados,e sim meta dados
limpa_pedido


/*CRIAÇÃO DE STORE PROCEDURE PARA TB_PROFESSOR*/

SELECT * FROM tb_professor;

drop procedure insert_tb_professor;

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

idCALL insert_tb_professor ('fer','2222222222');

	update tb_professor SET (nome,telefone) = in_nome
     where id = in_id;
