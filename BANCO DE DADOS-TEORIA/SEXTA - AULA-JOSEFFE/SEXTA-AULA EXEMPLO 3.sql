use db_blackboard;

select* from tb_professor; 

/*Exemplo 03 de Criação de Stored Procedure:*/

-- Criação da Stored Procedure (SP)
DELIMITER $$
CREATE PROCEDURE spp_professor
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
  IN in_nome VARCHAR(255),
  IN in_telefone VARCHAR(255)
)
BEGIN
    IF (in_acao = 'I') THEN
    BEGIN
		INSERT INTO tb_professor
		(
		  nome
		 ,telefone
		)
		VALUES
		(
		  in_nome
		 ,in_telefone
		);
        
      SET in_id = ( SELECT MAX(ID) FROM tb_professor );/* Do exercicio anterior só mudo isso*/ /*Aqui vai pegar o maior id da tabela*/
	END;
    ELSEIF (in_acao = 'A') THEN
    BEGIN
		UPDATE tb_professor
		SET nome     = in_nome
		   ,telefone = in_telefone
		WHERE id = in_id;   
	END;
	ELSEIF (in_acao = 'E') THEN
    BEGIN
		DELETE FROM tb_professor
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
CALL spp_professor("I", @ID, "Joseffe Barroso", "1234");/*Aqui estou passando a variavel vazia lá para minha procedure.Essa variavel vai entra no in_id.Si eu passar algum valor
nesse parametro in_id ele vai sofrer alteração dentro do update,insert e delete.E a procedure automaticamente vai escrever o valor que ele processo ai dentro,dentro da variavel que
passo dentro in_id*/
/*SELECT @ID*/
SELECT CONCAT("O ID ", @ID, " foi inserido")

-- Chamada para Alteração
SET @ID = 12;
CALL spp_professor("A", @ID, "Joseffe Oliveira", "013 989786778");

-- Chamada para Exclusão
SET @ID = 12;
CALL spp_professor("E", @ID, null, null);

-- Select para testar como ficou o dado na tabela
select * from tb_professor

