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

