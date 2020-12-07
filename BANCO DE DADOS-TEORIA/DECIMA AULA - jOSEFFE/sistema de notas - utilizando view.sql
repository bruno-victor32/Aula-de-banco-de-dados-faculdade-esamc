create database sist_notas_joseffe;

use sist_notas_joseffe;

create table tb_aluno
(
  id       int auto_increment not null,
  nome     varchar(255)       not null,
  ra int                      not null,
  email    varchar(255)       not null,
  telefone varchar(50)        not null,
  primary key (id)
);
 
create table tb_professor
(
  id        int auto_increment not null,
  nome      varchar(255)       not null,
  titulacao varchar(255)      not null,
  email     varchar(255)       not null,
  telefone  varchar(50)            null,
  primary key (id)
);
 
create table tb_curso
(
id            int auto_increment not null,
nome          varchar(255)       not null,
qtd_semestres int          not null,
turno         varchar(50)        not null,
primary key (id)
);
 
create table tb_disciplina
(
 id          int auto_increment not null,
 nome         varchar(100)       not null,
 carga        int                not null,
 ementa       varchar(3000)      not null,
 id_professor int            not null,
 foreign key (id_professor) references tb_professor (id),
 id_curso      int              not null,
 foreign key (id_curso) references tb_curso (id),
 primary key (id)
);
 
create table tb_grade_aluno
(
  id       int auto_increment not null,
  ano      int                not null,
  semestre int                not null,
  p1       float              null,
  p2       float              null,
  id_aluno int                not null,
  foreign key (id_aluno) references tb_aluno (id),
  id_disciplina int           not null,
  foreign key (id_disciplina) references tb_disciplina (id),
  primary key (id)
);

insert into tb_professor (nome, titulacao, email, telefone)
values ('Renato', 'Mestre', 'renato@gmail.com', '1234566789'),
       ('Joseffe', 'Mestre', 'joseffe@gmail.com', '1234566789'),
       ('Anderson Brasil', 'Mestre', 'brasil@gmail.com', '1234566789'),
       ('Claudio', 'Doutor', 'claudio@gmail.com', '1234566789'),
       ('Amália', 'Doutor', 'amalia@gmail.com', '1234566789');
      
      insert into tb_aluno (nome, ra, email, telefone)
values ('João', '12345', 'joao@gmail.com', '1122334455'),
      ('Maria', '22345', 'maria@gmail.com', '1122334455'),
      ('José', '32345', 'jose@gmail.com', '1122334455'),
      ('Luizinho', '42345', 'luizinho@gmail.com', '1122334455'),
      ('Iguinho', '52345', 'iguinho@gmail.com', '1122334455');
      
      insert into tb_curso (nome, qtd_semestres, turno)
values('Engenharia da Computação', 10, 'Manhã'),
      ('Engenharia da Computação', 10, 'Noite'),
      ('Engenharia Elétrica', 10, 'Manhã'),
      ('Engenharia Elétrica', 10, 'Noite'),
      ('Engenharia Mecânica', 10, 'Manhã'),
      ('Engenharia Mecânica', 10, 'Noite'),
      ('Engenharia Química', 10, 'Manhã'),
      ('Engenharia Química', 10, 'Noite');
     
     insert into tb_disciplina (nome, carga, ementa, id_professor, id_curso)
values ('Banco de Dados', 80, 'Ementa...', 2, 2),
       ('Programação I', 40, 'Ementa...', 2, 2),
       ('Programação II', 80, 'Ementa...', 1, 2),
       ('Arquitetura de Computadores', 80, 'Ementa...', 2, 4),
       ('Interface Humano Computador', 40, 'Ementa...', 2, 5),
       ('Compiladores', 40, 'Ementa...', 2, 1),
       ('Tecnologia Web', 40, 'Ementa...', 1, 2),
       ('Programação Orientada à Objetos', 40, 'Ementa...', 2, 3);
      
      insert into tb_grade_aluno (ano, semestre, p1, p2, id_aluno, id_disciplina)
values (2020, 1, null, null, 4, 5),
       (2020, 1, null, null, 4, 2),
       (2020, 1, null, null, 4, 4),
       (2020, 1, null, null, 2, 1),
       (2020, 1, null, null, 2, 3),
       (2020, 1, null, null, 2, 4),
       (2020, 1, null, null, 5, 5),
       (2020, 1, null, null, 5, 4),
       (2020, 1, null, null, 5, 2);
       
-- - Exibir os professores e sua titulação --
       
select nome,
       titulacao
from   tb_professor;

-- Criar uma view para exibir os professores e sua titulação --

 create view prof_titulacao
 as
select nome,
       titulacao
from   tb_professor;

-- - Exibir os professores e sua titulação,utilizando a view  --

select*from prof_titulacao;

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- --  

-- - Exibir as disciplinas de um determinado curso --

select id,
       nome
from  tb_disciplina
where id_curso = 1;

/*Aqui vai exibir as disciplinas por exemplo do curso "engenharia da computação" ou sejá o id_curso que vai ser o filtro*/

-- Criar uma view para exibir as disciplinas de um determinado curso --

create view vw_disc_curso
as
select id,
       nome
from  tb_disciplina
where id_curso = 1;

-- -- - Exibir as disciplinas de um determinado curso,utilizando a view --

select*from vw_disc_curso;



-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- --  

-- - Exibir as disciplinas com carga superior a 40h --
select id,
       nome
from tb_disciplina
where carga > 40;

-- Criar uma view para exibir as disciplinas com carga superior a 40h --

create view vw_disc_superior40
as
select id,
       nome
from tb_disciplina
where carga > 40;

-- - Exibir as disciplinas com carga superior a 40h,utilizando a view --

select*from vw_disc_superior40;

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- --  

-- - Exibir os professores de um determinado curso --
select b.id,
       b.nome
from tb_disciplina a inner join tb_professor b on (a.id_professor = b.id)
where a.id_curso = 2
group by b.id,
         b.nome
         
-- Criar uma view para exibir os professores de um determinado curso --  

create view vw_prof
as       
select b.id,
       b.nome
from tb_disciplina a inner join tb_professor b on (a.id_professor = b.id)
where a.id_curso = 2
group by b.id,
         b.nome;
         
-- - Exibir os professores de um determinado curso,utilizando a view --  

select*from vw_prof;       
         
/*Group by vai retirar repetições ou sejá não vai mais apareçer professores repetidos igual abaixo*/         
/*Aqui eu estou exibindo os professores da engenharia da computação*/
         
         /*OU*/
         
select b.id,
       b.nome
from tb_disciplina a inner join tb_professor b on (a.id_professor = b.id)    
                     inner join tb_curso c on (a.id_curso = b.id)  
where a.id_curso = 2

/*Aqui eu estou exibindo os professores da engenharia da computação,aqui eu pego os professores da tabela tb_disciplina si mais de um professor dá aula para mais de uma disciplina ele vai
apareçer 2 vezes*/
         
/*A tabela tb_disciplina e a primeira do select por que a partir dela eu chego nas outras tabelas, si eu começar da tabela tb_professor eu não consigo chegar na tabela tb_disciplina
 devido a tabela tb_professor não ter uma chave estrangeira.Quem tem as chaves estrangeiras e a tabela tb_disciplina relacionadas com a tb_professor e tb_curso*/
/*Nota: na tabela tb_disciplina  existe 2 chaves estrangeiras "id_professor e id_curso" si esses campos forem not null eu vou utilizar inner join,si for null vou left join*/


-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- --  
         
-- - Exibir todos os alunos matriculados em uma determinada disciplina ordenado por nome --

select b.nome
from tb_grade_aluno a inner join tb_aluno b on (a.id_aluno = b.id)
where a.id_disciplina = 4
order by b.nome;

/*order by = ordene por ...*/

-- Criar uma view para exibir todos os alunos matriculados em uma determinada disciplina ordenado por nome --

create view vw_alunos_matriculados
as
select b.nome
from tb_grade_aluno a inner join tb_aluno b on (a.id_aluno = b.id)
where a.id_disciplina = 4
order by b.nome;

-- - Exibir todos os alunos matriculados em uma determinada disciplina ordenado por nome --

select*from  vw_alunos_matriculados;
									/*OU*/
                                    
 select c.nome
 from tb_grade_aluno a inner join tb_disciplina b on (a.id_disciplina = b.id)
					   inner join tb_aluno      c on (a.id_aluno = c.id)
where a.id_disciplina = 4
order by c.nome                                    
-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- --  

-- - Exibir todos os alunos que tiveram média superior a 8,5 no primeiro semestre de 2020 --
select b.nome
from tb_grade_aluno a inner join tb_aluno b on (a.id_aluno = b.id)
where ((a.p1+a.p2)/2) > 8.5
  and a.ano = 2020
  and a.semestre = 1

/*Para colocar mais filtros coloco um "and"*/
/*Não aparece notas devido eu ter deixado nulo,si eu tivesse inserido as notas tinha aparecido*/
/*Esse "a" que colocamos ai e chamado em inglês de alian que significa apelido*/

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- --  

-- - Exibir o nome do professor e disciplina dos alunos que tiveram média igual a 10 no primeiro semestre de 2020 --
select c.nome,
       b.nome
from tb_grade_aluno a inner join tb_disciplina b on (a.id_disciplina = b.id)
                      inner join tb_professor  c on (b.id_professor = c.id)
where a.p1 = 10
  and a.p2 = 10
  and a.ano = 2020
  and a.semestre = 1
  
  -- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- --  
  
  -- - Exibir a quantidade de disciplinas alocadas para cada professor --
  
  select b.nome,
       count(a.nome)
from tb_disciplina a inner join tb_professor b on (a.id_professor = b.id)
group by b.nome

/*O group by,ele retira as repetições,mas quando ele retira as repetições,ele pode alem de tirar as repetições,ele guarda a 
quantidade de vezes que repetiu para cada professor,ele guarda isso.Esse guardar vou exibir em razão do count*/
-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- --  

-- - Exibir a quantidade de disciplinas que cada aluno está cursando no primeiro semestre de 2020 --

select b.nome,
      count(c.nome)
from tb_grade_aluno a inner join tb_aluno      b on (a.id_aluno = b.id)
                      inner join tb_disciplina c on (a.id_disciplina = c.id)
where a.ano = 2020
  and a.semestre = 1
group by b.nome

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -- 

-- Exibir todos os alunos matriculados em uma determinada disciplina --
 select c.nome
 from tb_grade_aluno a inner join tb_disciplina b on (a.id_disciplina = b.id)
					   inner join tb_aluno      c on (a.id_aluno = c.id)
where a.id_disciplina = 4

SHOW CREATE VIEW