create database db_sis_notas_disc_facu;

use db_sis_notas_disc_facu;

show tables;

create table tb_aluno(
id_aluno int not null auto_increment,
nome varchar(255) not null,
ra varchar(15) not null,
email varchar(255) not null,
telefone varchar(50) not null,
primary key(id_aluno)
);

create table tb_professor (
id_professor int not null auto_increment,
nome varchar(255) not null,
titulacao varchar(50) not null,
email varchar(255) not null,
telefone varchar(50),
primary key(id_professor)
);

create table tb_curso(
id_curso int not null auto_increment,
nome varchar(255) not null,
qtd_semestres int not null,
turno varchar(50),
primary key(id_curso)
);

create table tb_disciplina(
id_disciplina int not null auto_increment,
nome varchar(100) not null,
carga int not null,
ementa varchar(3000),
primary key(id_disciplina),
id_professorr int not null,
id_cursos int not null,
foreign key(id_professorr) references tb_professor(id_professor),
foreign key(id_cursos) references tb_curso(id_curso)
);

create table tb_grade_aluno(
id_grade_aluno int not null auto_increment,
ano int not null,
semestre int not null,
p1 float not null,
p2 float not null,
primary key(id_grade_aluno),
id_alunos int not null,
id_disciplinas int not null,
foreign key (id_alunos) references tb_aluno(id_aluno),
foreign key (id_disciplinas) references tb_disciplina(id_disciplina)
);

-- --------------------------------------------------------------------------------------------------------------------- --
-- --------------------------------------------------------------------------------------------------------------------- --
-- --------------------------------------------------------------------------------------------------------------------- --
-- --------------------------------------------------------------------------------------------------------------------- --
-- --------------------------------------------------------------------------------------------------------------------- --
DELIMITER $$
CREATE PROCEDURE sp_aluno
(
  IN in_acao VARCHAR(1),
  IN in_id_aluno INT,
  IN in_nome_aluno varchar(255),
  IN in_numero_ra varchar(15),
  IN in_nome_email  varchar(255) ,
  IN in_numero_telefone varchar(50)
)
BEGIN
    IF (in_acao = 'I') THEN
    BEGIN
        INSERT INTO tb_aluno (nome,ra,email,telefone) VALUES (in_nome_aluno,in_numero_ra,in_nome_email,in_numero_telefone);
	END;
    ELSEIF (in_acao = 'A') THEN
    BEGIN
        update tb_aluno SET nome = in_nome_aluno ,ra = in_numero_ra,  email = in_nome_email,telefone = in_numero_telefone  where id_aluno = in_id_aluno  ;
	END;
	ELSEIF (in_acao = 'E') THEN
    BEGIN

        delete from tb_aluno where id_aluno = in_id_aluno ;
    END;
    END IF;
END $$
DELIMITER ;

/*Exemplo 02 de chamada de uma Stored Procedure:*/

	-- Chamada para Inclusão
CALL sp_aluno("I", null, 'Fernando','11170657','fernandoo32@gmail.com.br','13988111111');/*NULL para "id" porque gera automaticamente*/
CALL sp_aluno("I", null, 'Rodrigo','11120457','rodrigo32@gmail.com.br','13988222222');/*NULL para "id" porque gera automaticamente*/
CALL sp_aluno("I", null, 'Allan','11166657','allan32@gmail.com.br','13988333333');/*NULL para "id" porque gera automaticamente*/
CALL sp_aluno("I", null, 'Cleber','11188857','cleber32@gmail.com.br','13988444444');/*NULL para "id" porque gera automaticamente*/


-- Chamada para Alteração
CALL sp_aluno("A", 1, 'Fernando','11111111','adriano3222@gmail.com.br','13988444444');
CALL sp_aluno("A", 2,'Rodrigo','22222222','adriano3222@gmail.com.br','13988444444');
CALL sp_aluno("A", 3,'Allan','33333333','adriano3222@gmail.com.br','13988444444');
CALL sp_aluno("A", 4, 'Cleber','44444444','adriano3222@gmail.com.br','13988444444');


-- Chamada para Exclusão
CALL sp_aluno("E", '4',null,null,null,null);

-- Select para testar como ficou o dado na tabela
select * from tb_aluno;

-- --------------------------------------------------------------------------------------------------------------------- --
-- --------------------------------------------------------------------------------------------------------------------- --
-- --------------------------------------------------------------------------------------------------------------------- --
-- --------------------------------------------------------------------------------------------------------------------- --
-- --------------------------------------------------------------------------------------------------------------------- --
DELIMITER $$
CREATE PROCEDURE sp_professor
(
  IN in_acao VARCHAR(1),
  IN in_id_professor INT,
  IN in_nome_professor varchar(255),
  IN in_nome_titulacao varchar(50),
  IN in_nome_email  varchar(255) ,
  IN in_numero_telefone varchar(50)
)
BEGIN
    IF (in_acao = 'I') THEN
    BEGIN
        INSERT INTO tb_professor (nome,titulacao,email,telefone) VALUES (in_nome_professor,in_nome_titulacao,in_nome_email,in_numero_telefone);
	END;
    ELSEIF (in_acao = 'A') THEN
    BEGIN
        update tb_professor SET nome = in_nome_professor ,titulacao = in_nome_titulacao,  email = in_nome_email,telefone = in_numero_telefone  where id_professor = in_id_professor  ;
	END;
	ELSEIF (in_acao = 'E') THEN
    BEGIN

        delete from tb_professor where id_professor = in_id_professor ;
    END;
    END IF;
END $$
DELIMITER ;

/*Exemplo 02 de chamada de uma Stored Procedure:*/

	-- Chamada para Inclusão
CALL sp_professor("I", null, 'Kauan','Engenheiro','kauan32@gmail.com.br','13988555555');/*NULL para "id" porque gera automaticamente*/
CALL sp_professor("I", null, 'Marco','técnico','marco32@gmail.com.br','13988666666');/*NULL para "id" porque gera automaticamente*/
CALL sp_professor("I", null, 'Nerd','bacharel','nerd32@gmail.com.br','13988777777');/*NULL para "id" porque gera automaticamente*/
CALL sp_professor("I", null, 'Tetrix','advogado','tetrix32@gmail.com.br','13988888888');/*NULL para "id" porque gera automaticamente*/


-- Chamada para Alteração
CALL sp_professor("A", 1, 'Marco','Advogado','marco3222@gmail.com.br','13988444444');
CALL sp_professor("A", 2,'Kauan','técnicoo','kauan3222@gmail.com.br','13988444444');
CALL sp_professor("A", 3,'Nerd','licenciatura','nerd3222@gmail.com.br','13988444444');
CALL sp_professor("A", 4, 'Tetrix','advogado','tetrix3222@gmail.com.br','13988444444');


-- Chamada para Exclusão
CALL sp_professor("E", '4',null,null,null,null);

-- Select para testar como ficou o dado na tabela
select * from tb_professor;

-- --------------------------------------------------------------------------------------------------------------------- --
-- --------------------------------------------------------------------------------------------------------------------- --
-- --------------------------------------------------------------------------------------------------------------------- --
-- --------------------------------------------------------------------------------------------------------------------- --
-- --------------------------------------------------------------------------------------------------------------------- --
DELIMITER $$
CREATE PROCEDURE sp_curso
(
  IN in_acao VARCHAR(1),
  IN in_id_curso INT,
  IN in_nome_curso varchar(255),
  IN in_qtd_semestres int ,
  IN in_turno  varchar(50) 
)
BEGIN
    IF (in_acao = 'I') THEN
    BEGIN
        INSERT INTO tb_curso (nome,qtd_semestres,turno) VALUES (in_nome_curso,in_qtd_semestres,in_turno);
	END;
    ELSEIF (in_acao = 'A') THEN
    BEGIN
        update tb_curso SET nome = in_nome_curso ,qtd_semestres = in_qtd_semestres,  turno = in_turno  where id_curso = in_id_curso  ;
	END;
	ELSEIF (in_acao = 'E') THEN
    BEGIN

        delete from tb_curso where id_curso = in_id_curso ;
    END;
    END IF;
END $$
DELIMITER ;

/*Exemplo 02 de chamada de uma Stored Procedure:*/

	-- Chamada para Inclusão
CALL sp_curso("I", null, 'Eng Computação','10','noturno');/*NULL para "id" porque gera automaticamente*/
CALL sp_curso("I", null, 'Eng Elétrica','10','matutino');/*NULL para "id" porque gera automaticamente*/
CALL sp_curso("I", null, 'Eng Mecanica','10','noturno');/*NULL para "id" porque gera automaticamente*/
CALL sp_curso("I", null, 'Direito','10','matutino');/*NULL para "id" porque gera automaticamente*/


-- Chamada para Alteração
CALL sp_curso("A", 1, 'Eng Elétrica','10','matutino');
CALL sp_curso("A", 2,'Eng Computação','10','noturno');
CALL sp_curso("A", 3,'Direito','10','matutino');
CALL sp_curso("A", 4,'Eng Mecanica','10','noturno');


-- Chamada para Exclusão
CALL sp_curso("E", '4',null,null,null);

-- Select para testar como ficou o dado na tabela
select * from tb_curso;

-- --------------------------------------------------------------------------------------------------------------------- --
-- --------------------------------------------------------------------------------------------------------------------- --
-- --------------------------------------------------------------------------------------------------------------------- --
-- --------------------------------------------------------------------------------------------------------------------- --
-- --------------------------------------------------------------------------------------------------------------------- --
DELIMITER $$
CREATE PROCEDURE sp_disciplina
(
  IN in_acao VARCHAR(1),
  IN in_id_disciplina INT,
  IN in_nome_disciplina varchar(100),
  IN in_carga int ,
  IN in_ementa  varchar(3000),
  IN in_id_professorr int ,
  IN in_id_cursos int 
)
BEGIN
    IF (in_acao = 'I') THEN
    BEGIN
        INSERT INTO tb_disciplina (nome,carga,ementa,id_professorr,id_cursos) VALUES (in_nome_disciplina,in_carga,in_ementa,in_id_professorr,in_id_cursos);
	END;
    ELSEIF (in_acao = 'A') THEN
    BEGIN
        update tb_disciplina SET nome = in_nome_disciplina ,carga = in_carga,  ementa = in_ementa, id_professorr = in_id_professorr, id_cursos = in_id_cursos  where id_disciplina = in_id_disciplina  ;
	END;
	ELSEIF (in_acao = 'E') THEN
    BEGIN

        delete from tb_disciplina where id_disciplina = in_id_disciplina  ;
    END;
    END IF;
END $$
DELIMITER ;

/*Exemplo 02 de chamada de uma Stored Procedure:*/

	-- Chamada para Inclusão
CALL sp_disciplina("I", null, 'Fundamentos de algoritmo','80','Anatomia de um computador','3','2');/*NULL para "id" porque gera automaticamente*/
CALL sp_disciplina("I", null, 'Introdução a informatica','40','Conceitos de informatica','1','2');/*NULL para "id" porque gera automaticamente*/
CALL sp_disciplina("I", null, 'Inglês instrumental','200','Decodificação de textos atuais de informática','2','1');/*NULL para "id" porque gera automaticamente*/
CALL sp_disciplina("I", null, 'Estrutura de dados','350','compreensão de dados','2','3');/*NULL para "id" porque gera automaticamente*/


-- Chamada para Alteração
CALL sp_disciplina("A", 1,'Introdução a informatica','40','Conceitos de informatica','1','2');
CALL sp_disciplina("A", 2, 'Fundamentos de algoritmo','80','Anatomia de um computador','3','2');
CALL sp_disciplina("A", 3, 'Estrutura de dados','350','compreensão de dados','2','3');
CALL sp_disciplina("A", 4,'Inglês instrumental','200','Decodificação de textos atuais de informática','2','1');


-- Chamada para Exclusão
CALL sp_disciplina("E", '4',null,null,null,null,null);

-- Select para testar como ficou o dado na tabela
select * from tb_disciplina;

-- --------------------------------------------------------------------------------------------------------------------- --
-- --------------------------------------------------------------------------------------------------------------------- --
-- --------------------------------------------------------------------------------------------------------------------- --
-- --------------------------------------------------------------------------------------------------------------------- --
-- --------------------------------------------------------------------------------------------------------------------- --
DELIMITER $$
CREATE PROCEDURE sp_grade_aluno
(
  IN in_acao VARCHAR(1),
  IN in_id_grade_aluno INT,
  IN in_ano int,
  IN in_semestre int ,
  IN in_p1  float,
  IN in_p2 float  ,
  IN in_id_alunos int ,
  IN in_id_disciplinas int 
)
BEGIN
    IF (in_acao = 'I') THEN
    BEGIN
        INSERT INTO tb_grade_aluno (ano,semestre,p1,p2,id_alunos,id_disciplinas) VALUES (in_ano,in_semestre,in_p1,in_p2,in_id_alunos,in_id_disciplinas);
	END;
    ELSEIF (in_acao = 'A') THEN
    BEGIN
        update tb_grade_aluno SET ano = in_ano ,semestre = in_semestre,  p1 = in_p1, p2 = in_p2, id_alunos = in_id_alunos,id_disciplinas = in_id_disciplinas   where id_grade_aluno = in_id_grade_aluno  ;
	END;
	ELSEIF (in_acao = 'E') THEN
    BEGIN

        delete from tb_grade_aluno where id_grade_aluno = in_id_grade_aluno  ;
    END;
    END IF;
END $$
DELIMITER ;

/*Exemplo 02 de chamada de uma Stored Procedure:*/

	-- Chamada para Inclusão
CALL sp_grade_aluno("I", null,2020,1,'8.5', '7.5',2,3);/*NULL para "id" porque gera automaticamente*/
CALL sp_grade_aluno("I", null,2020,2, '7.0','6.5',1,1);/*NULL para "id" porque gera automaticamente*/
CALL sp_grade_aluno("I", null,2020,3, '6.5','5.5',3,2);/*NULL para "id" porque gera automaticamente*/
CALL sp_grade_aluno("I", null,2020,4, '5.5','4.5',2,3);/*NULL para "id" porque gera automaticamente*/


-- Chamada para Alteração
CALL sp_grade_aluno("A", 1, 2020,2, '7.0','6.5',1,1);
CALL sp_grade_aluno("A", 2,2020,1,'8.5', '7.5',2,3);
CALL sp_grade_aluno("A", 3,2020,4, '5.5','4.5',2,3);
CALL sp_grade_aluno("A", 4,2020,3, '6.5','5.5',3,2);


-- Chamada para Exclusão
CALL sp_grade_aluno("E", '4',null,null,null,null,null,null);

-- Select para testar como ficou o dado na tabela
select * from tb_grade_aluno;
