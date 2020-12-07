create database db_consultorio;

drop database db_consultorio;

use db_consultorio;

create table tb_convenio(
 id   int          not null auto_increment,
 nome varchar(255) not null,
 primary key(id)
 );
 
 select * from tb_convenio;
 
 create table tb_medico(
id                  int          not null auto_increment,
nome                varchar(255) not null,
crm                 varchar(10)  not null,
salario             int          not null,
especialidade       varchar(255) not null,
primary key(id)
);

select * from tb_medico;

create table tb_paciente(
 id              int           not null auto_increment,
 nome            varchar(255)  not null,
 sexo            varchar(1)    not null,
 data_nasc       date          not null,
 estado_civil    varchar(50)   null,
 cnpj            varchar(50)   null,
 email           varchar(80)   null,
 cpf             varchar(11)   null,
 endereco        varchar(100)  not null,
 id_convenio     int           null,
 primary key(id),
 foreign key(id_convenio) references tb_convenio(id)
 );
 
 select*from tb_paciente;
 
 create table tb_medico_convenio(
   id          int not null auto_increment,
   id_medico   int not null,
   id_convenio int not null,
   primary key(id),
   foreign key (id_medico) references tb_medico(id),
   foreign key (id_convenio) references tb_convenio(id)
 );
 
 select*from tb_medico_convenio;
 
create table tb_consulta(
id             int          not null auto_increment,
data_hora      datetime     not null,
obs            varchar(255) null,
id_paciente   int           not null,
id_medico     int           not null,
primary key(id),
foreign key(id_paciente) references tb_paciente(id),
foreign key(id_medico) references tb_medico(id)
);

select*from tb_consulta;

-- -------------------------------------------- --
insert into tb_convenio(nome)
values ('Bradesco'),
       ('SulAmerica'),
       ('Unimed'),
       ('Amil'),
       ('BioVida'),
       ('Plena');
       
       insert into tb_medico (nome,crm,salario,especialidade)
values ('Antonio','11111',1000.00,'Dentista'),
       ('Guilherme','22222',2000.00,'Ginecologista'),
       ('Fernadão','33333',3000.00,'Dermatologista'),
       ('Rafael','44444',4000.00,'Clinico Geral'),
       ('Chico','51111',5000.00,'Urologista');

insert into tb_paciente (nome, sexo, data_nasc, estado_civil, cnpj, email, cpf, endereco,id_convenio)
values ('Renato','M','1996-11-24',null,'11462','bruno.victor32@yahoo.com.br','12345678910','Rua:Monteiro da cruz','1'),
       ('Claudia','F','2000-10-22','casada','12463','claudia@yahoo.com.br','11111111111','Rua:São Salvador','3'),
	   ('Fernanda','F','2001-09-19','solteira','13464','fernanda@yahoo.com.br','22222222222','Rua:California','2'),
       ('Wesley','M','1959-08-18','divorciado','15468','wesley@yahoo.com.br','33333333333','Rua:Santos Dumont','5'),
       ('Cleber','M','1844-07-17','amigado','16469','cleber@yahoo.com.br','44444444444','Rua:Monteiro do abacate','5'),
       ('Maiki','M','1997-11-24',null,'13462',null,'12345678910','Rua:Monteiro da cruz','5'),
       ('Denis','M','1965-11-24',null,'11462','denis.victor32@yahoo.com.br','12345678910','Rua:Monteiro da cruz','1');
       

insert into tb_medico_convenio (id_medico,id_convenio)
values  ('1','2'),  
		('2','1'),
        ('3','2'),
        ('1','3'),
        ('3','3'),
        ('4','2'),
        ('2','3');

       insert into tb_consulta (data_hora,obs,id_paciente,id_medico)
values ('2002-08-18 14:29:36','Dentista','1','1'),
       ('2002-08-18 14:29:36','Dentista','3','1'),
       ('2002-08-18 14:29:36','Dentista','2','1'),
       ('2002-08-18 14:29:36','Dentista','4','1'),
       ('2002-08-18 14:29:36','Dentista','5','1'),
       ('2002-08-18 14:29:36','Dentista','5','1'),
	   ('2002-08-18 14:29:36','Dentista','7','1'),
	   ('2011-09-18 16:29:36','Ginecologista','2','2'),
       ('2010-10-18 15:29:36','Raio-x','3','2');

       
select*from  tb_convenio;       
select*from  tb_medico_convenio;
select*from  tb_consulta;
select*from  tb_paciente;
select*from  tb_medico;

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- --  
 -- - Exibir os Pacientes e seu respectivo convênio --
       
       select a.nome,
       b.id,
       b.nome
from   tb_paciente a inner join tb_convenio b on (a.id_convenio = b.id);


        select a.nome,
       b.nome
from   tb_paciente a left join tb_convenio b on (a.id_convenio = b.id);

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- --  
-- - Exibir todos os Pacientes que não tem email --
       
select id,
       nome
from  tb_paciente
where email is null;

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- --  
-- - Exibir os Convênios --
select nome
from  tb_convenio;

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -- 

-- - Exibir todos os Médicos e os convênios que cada médico atende --

 select 
 b.nome
 ,c.nome
 from tb_medico_convenio a inner join tb_medico b on (a.id_medico = b.id)
						   inner join tb_convenio c on (a.id_convenio = c.id);
                            
                            
-- ------------------------------------------------------------------------------------------------------- --
-- - Exibir a quantidade de médicos para cada convênio --

select b.nome  as "Convenio",
       count(*) as "Quantidade de medico para cada convenio"
from tb_medico_convenio a inner join tb_convenio b on (a.id_convenio = b.id)
group by b.nome;

-- ------------------------------------------------------------------------------------------------------- --
-- - Exibir a quantidade de consultas de cada médico --

  select b.nome as "medico",
       count(a.id_paciente)  as "consultas"
from tb_consulta a inner join tb_medico b on (a.id_medico = b.id)
group by b.nome;

-- ---------------------------------------------------------------------------------------------------- ---- 
-- Exibir a quantidade de consultas de cada paciente --

  select b.nome as "Paciente",
       count(a.id_paciente)  as "consultas"
from tb_consulta a inner join tb_paciente b on (a.id_paciente = b.id)
group by b.nome;
-- ---------------------------------------------------------------------------------------------------- --

-- Exibir todos os pacientes de um determinado médico --

select 
a.nome
,b.nome
from tb_medico a inner join tb_paciente b inner join tb_consulta c on (a.id = c.id_medico   and b.id = c.id_paciente ) ;
-- -------------------------------------------------------------------------------------------------- --

-- - Exibir todas as consultas realizadas no mês de outubro para um determinado médico --
SELECT * FROM tb_consulta WHERE MONTH(data_hora) = 10
and id_medico = 1;

-- ---------------------------------------------------------------------------------------------------- --
-- - Exibir todas as consultas realizadas na terceira semana do mês de outubro, contendo o paciente, convênio e médico --
select  a.id_paciente,
		a.id_medico,
        b.nome,
        c.nome
from tb_consulta a inner join tb_paciente b on (a.id_paciente = b.id)
				   inner join tb_medico c on   (a.id_medico = c.id)
	where (FLOOR((DAYOFMONTH(a.data_hora) - 1) / 7) + 1) = 3 ;
    
    select  a.id_paciente,
		a.id_medico,
        b.nome as nome_paciente,
        c.nome as nome_medico,
        b.id_convenio,
        d.nome as convenio
from tb_consulta a inner join tb_paciente b on (a.id_paciente = b.id)
				   inner join tb_medico c on   (a.id_medico = c.id)
                   inner join tb_convenio d on (b.id_convenio = d.id)
where (FLOOR((DAYOFMONTH(a.data_hora) - 1) / 7) + 1) = 3 ;

  -- ---------------------------------------------------------------------------------------------------- --
  -- - Exibir exibir todos os pacientes acima de 60 anos e seus medicos --

select b.id
		, b.nome as paciente
        , c.nome as medico
	from tb_consulta a inner join tb_paciente b on (a.id_paciente = b.id)
						inner join tb_medico c on (a.id_medico = c.id)
    where timestampdiff(year, data_nasc, now()) >60;


-- --------------------------------------------------------------------------------------------------- --

-- Exibir qual é o convênio que possui mais médicos vinculados --
select id_convenio, count(id_convenio) as quantidade from tb_medico_convenio group by id_convenio;

select 
 c.nome
 ,COUNT(*) as quantidade
from tb_medico_convenio a inner join  tb_medico b on (a.id_medico = b.id)
						inner join tb_convenio c on (a.id_convenio = c.id);
                        
                        select  a.id_paciente,
	  a.id_medico,
        b.nome,
        c.nome
from tb_consulta a 
inner join tb_paciente b on (a.id_paciente = b.id)
      inner join tb_medico c on (a.id_medico = c.id)
Where (FLOOR((DAYOFMONTH(a.data_hora) - 1) / 7) + 1) = 3
