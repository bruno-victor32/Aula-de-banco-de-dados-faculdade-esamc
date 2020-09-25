CREATE DATABASE curso_sql;/*Comando Para criar o banco de dados, "curso_sql" e o nome do banco de dados,sempre utilizar 
letras minusculas e uma boa prática*/

USE curso_sql;/*Comando p/ selecionar o banco de dados que vou utilizar que no caso e o banco "curso_sql"*/

CREATE TABLE funcionarios /*Comando para criar uma tabela que no caso vai ser chamada "funcionarios"*/
(
	id int unsigned not null auto_increment,
    nome varchar(45) not null,/*STRING que tem o valor variavel de 45 posições e isso e o tamanho maximo*/
    salario double not null default '0',/*Vai ser do tipo double,quero trabalhar com numeros decimais e ele também e numerico,default '0' si nenhum valor digitado
    o mysql vai trabalhar com o valor padrão 0 que no caso foi eu que selecionei o valor*/
    departamento varchar(45) not null,
    PRIMARY KEY (id)/*A minha chave primaria vai ser o campo "id"*/
);


CREATE TABLE veiculos
(
	id int unsigned not null auto_increment,
    funcionario_id int unsigned default null,
    veiculo varchar(45) not null default '',/*default '0' vai permitir que o carro ainda não tenha descrição e que um funcionario possa colocar*/
    placa varchar(10) not null default '',/*default vai ficar vazio caso ninguem preencha vai ficar a placa vazia quando carro novo sai,placa vazia pode placa nula não pode*/
    PRIMARY KEY (id),/*A minha chave primaria vai ser o campo "id"*/
    CONSTRAINT fk_veiculos_funcionarios FOREIGN KEY (funcionario_id) REFERENCES funcionarios (id)
);

CREATE TABLE salarios
(
	faixa varchar(45) not null,
    inicio double not null,
    fim double not null,
    PRIMARY KEY (faixa)
);

ALTER TABLE funcionarios CHANGE COLUMN nome nome_func varchar(50) not null;
ALTER TABLE funcionarios CHANGE COLUMN nome_func nome varchar(45) not null;
/*Muito cuidado quando vc altera um campo de varchar que e um campo que recebe nomes e coloca por exemplo um que recebe int ou seja númerico vc pode perde dados*/

DROP TABLE salarios;/*Comando para deletar uma tabela*/

CREATE INDEX departamentos ON funcionarios (departamento);
CREATE INDEX nomes ON funcionarios (nome(6));/*como ele e uma string de 45 posições,eu posso dizer para o mysql que ele não precisa gerenciar as 45 posições e que para mim só importa os 6 primeiros caracteres de cada nome dessa ordenação porque os nomes depois de 6 caracteres
já estão em uma forma mais ordenada.Por exemlo placa de carro que tem 3 letras e 4 numeros quero um indice que ordene somente por 3 letras que são os 3 primeiros caracteres*/

    /*Nota:Vazio e um valor mesmo que um valor vazio*/
    /*Nota:Nulo que dizer omissão de valor*/
    
    /*-------------------Aula 4.2 softblue------------------*/
    
use curso_sql;

/*Inserindo dados na tabela*/

insert into funcionarios (nome, salario, departamento)values ( 'Fernando', '1400', 'Engenharia');
/*Não precisa colocar o id*/
insert into funcionarios (nome, salario, departamento)values ( 'Guilherme', '1400', 'TI');
insert into funcionarios (nome, salario, departamento)values ('Rafael', '1600', 'Engenharia');
insert into funcionarios (nome, salario, departamento)values ('Jose', '1800', 'ADM');
insert into funcionarios (nome, salario, departamento)values ('isabela', '2200', 'Engenharia');

select*from funcionarios;  /*Comando para mostrar os registros da tabela*/

/*Vai trazer somente os funcionarios que tiver o salario acima de 2000 reais*/
select*from funcionarios where salario > 2000;  /*Comando para mostrar os registros da tabela usando filtros*/

/*Vai trazer somente os funcionarios que tem o nome igual a José*/
select*from funcionarios where nome = 'Jose';

/*Trazendo somente o funcionario que tenha o id igual a 3*/
select*from funcionarios where id = 3;

/*Fazendo Alterações no registro*/
/*Por exemplo:Chego o final do ano eu quero dá um aumento de 10% para cada funcionario,eu utilizo o seguinte comando*/
update funcionarios set salario = salario*1.1;
/*Fazendo dessa forma o mysql workbench não vai permite pois ele tem um modo de segurança que não permite alterar todos os registros de um campo de uma vez/*

/*Para autorizar o workebench a desativar essa proteção utilizo o seguinte comando*/
SET SQL_SAFE_UPDATES = 0;
/*Para habilitar novamente o save update faço uso desse seguinte comando*/
SET SQL_SAFE_UPDATES = 1;

/*Caso eu queira dá a bonificação somente para uma pessoa eu faço da seguinte maneira*/
update funcionarios set salario = salario*1.1 where id = 1;

/*A instrução ROUND ela arredonda as casas decimais.O numero 2 e referente aos numeros de casas que voçê quer,que no caso eu quero na casa dos centavos*/
UPDATE funcionarios SET salario = ROUND(salario * 1.1, 2);

/*Para excluir alguns registros da tabela*/
/*Vou deletar o funcionario que tem o id igual 4*/
DELETE FROM funcionarios WHERE id = 4;
    
/*Inserindo dados na tabela veiculos*/    
INSERT INTO veiculos (funcionario_id, veiculo, placa) VALUES (1, 'Carro', 'SB-0001');
INSERT INTO veiculos (funcionario_id, veiculo, placa) VALUES (1, 'Carro', 'SB-0002');

/*Comando para mostrar os registros da tabela*/
select*from veiculos;

/*Quero passar o carro de id = 2 para a Isabela que tem id=5*/
/*Quero fazer uma mudança na tabela veiculos muda o proprietario do carro que estava funcionario 1"Fernando' dono do carro com placa SB-002 para funcionario 5 que é Isabela */
UPDATE veiculos SET funcionario_id = 3 WHERE id = 2;

/*Inserindo dados na tabela salarios*/
INSERT INTO salarios (faixa, inicio, fim) VALUES ('Analista Jr', 1000, 2000);
INSERT INTO salarios (faixa, inicio, fim) VALUES ('Analista Pleno', 2000, 4000);

/*Comando para mostrar os registros da tabela*/
select*from salarios;

/*Apelidando a tabela funcionarios para "f"*/
select*from funcionarios f where salario >2000;

/*O uso de apelido e muito importante pode ter caso de 2 tabelas estarem em um select e terem o mesmo nome*/


/*Adicionando apelido para campo,ou seja, a tabela funcionarios tem o apelido de "f" e o campo "nome" tem o apelido "Funcionário"*/
SELECT nome AS 'Funcionário', salario FROM funcionarios f WHERE f.salario > 2000;

/*O union permite trazer 2 consultas ou mais*/
SELECT * FROM funcionarios WHERE nome = 'Guilherme'
UNION
SELECT * FROM funcionarios WHERE id = 5;

/*O union deleta recursos duplicados,mas o union all ele não deleta recursos duplicados ele mostra tudo*/
SELECT * FROM funcionarios WHERE nome = 'Guilherme'
UNION ALL
SELECT * FROM funcionarios WHERE nome = 'Guilherme';

    /*-------------------Aula 5.2 softblue------------------*/
    
select * from funcionarios;
select * from veiculos;

select * from funcionarios inner join veiculos ON veiculos.funcionario_id = funcionarios.id; -- E o começo do comando que cria relacionamento entre 2 tabelas mostrando o resultado na tela --
/* Informamos o nome da primeira tabela "funcionarios" o tipo de relacionamento que no caso e "INNER JOIN" e o nome da segunda tabela "veiculos"  e o parametro "ON"
 dizendo qual e a relação dessas tabelas,no caso eu posso dizer que o campo funcionario_id da tabela veiculos e igual ao campo "id" da tabela funcionarios*/
 /*veiculos.funcionarios_id e o seguinte veiculos e a tabela,funcionarios_id e o campo*/
 /*funcionarios.id e o seguinte funcionarios e a tabela,id e o campo*/
 
 -- Apelidando as Tabelas*/
select * from funcionarios f inner join veiculos v ON v.funcionario_id = f.id; -- Estou apelidando a tabela funcionario de "f" e a tabela de veiculos de "v" --

-- UTILIZANDO O LEFT JOIN--

    select * from funcionarios left join veiculos ON veiculos.funcionario_id = funcionarios.id;
    /* O LEFT traz todos os registro da tabela  a esquerda que no caso e a tabela "funcionarios" portanto os demais funcionarios que não tenham carros cadastrados
    vão aparecer no resultado*/
    
    
    select * from funcionarios f left join veiculos v ON v.funcionario_id = f.id;
    
    -- UTILIZANDO O RIGHT JOIN--
    
       select * from funcionarios f right join veiculos v ON v.funcionario_id = f.id;
      /* Ele faz a mesma coisa só que para o lado direito que no caso e a tabela "veiculos" que nesse caso só temos 2 veiculos cadastrados na tabela "veiculos"*/
      
      insert into veiculos (funcionario_id,veiculo,placa) values (null,"Moto", "SB-0003");
      
          -- UTILIZANDO O FULL JOIN OU FULL OUTHER JOIN--
 /*Traz todos os registros que tem relacionamento,mais do lado esquerdo e mais do lado direito,ou seja,ele vai juntar o left com right join.Primeiro ele vai trazer os registros 
 com relacionamento,vai trazer também os resultados dos funcionarios que não tem veiculos e vai trazer também os resultados dos veiculos que não tem dono*/
 
 /*O MYSQL não tem o comando Full join,para fazer esse comando utilizamos essa outra forma*/
 
select * from funcionarios f left join veiculos v ON v.funcionario_id = f.id
UNION
select * from funcionarios f right join veiculos v ON v.funcionario_id = f.id;

CREATE TABLE cpfs
(
	id int unsigned not null,
    cpf varchar(14) not null,
    PRIMARY KEY (id),
    CONSTRAINT fk_cpf FOREIGN KEY (id) REFERENCES funcionarios (id)
);

INSERT INTO cpfs (id, cpf) VALUES (1, '111.111.111-11');
INSERT INTO cpfs (id, cpf) VALUES (2, '222.222.222-22');
INSERT INTO cpfs (id, cpf) VALUES (3, '333.333.333-33');
INSERT INTO cpfs (id, cpf) VALUES (5, '555.555.555-55');

SELECT * FROM cpfs;

SELECT * FROM funcionarios INNER JOIN cpfs ON funcionarios.id = cpfs.id;

SELECT * FROM funcionarios INNER JOIN cpfs USING(id);/*O "USING(id)" quer dizer para mysql.Olha usa o campo id que existe em ambas,nesse caso teremos o mesmo resultado
apresentado na tela.Esse comando de cima e igual a esse comando usando "USING(id)"*/

-- UTILIZANDO O SELF JOIN--
/*Quando um relacionamento de uma tabela e feito com ela mesma.Um exemplo que eu acho mais facil de entender e quando temos a tabela "cliente" que tem o campo "quem indicou"
para saber na propria tabela quem indicou para a sua loja e etc*/

CREATE TABLE clientes
(
	id int unsigned not null auto_increment,
    nome varchar(45) not null,
    quem_indicou int unsigned, /*Nesse campo eu não vou simplesmente colocar varchar,porque vai repetir dados que já existem na tabela pois quem indicou já vai fazer parte da tabela "clientes"
    Nesse caso "quem_indicou" vai ser uma chave estrangeira para essa propria tabela apontando para o id do cliente que indicou,por isso vai ser do mesmo tipo do "id".Vou aceitar nulo porque
    algum cliente pode chegar por conta propria*/
    PRIMARY KEY (id),
    CONSTRAINT fk_quem_indicou FOREIGN KEY (quem_indicou) REFERENCES clientes (id)
);
INSERT INTO clientes (id, nome, quem_indicou) VALUES (1, 'André', NULL);
INSERT INTO clientes (id, nome, quem_indicou) VALUES (2, 'Samuel', 1);
INSERT INTO clientes (id, nome, quem_indicou) VALUES (3, 'Carlos', 2);
INSERT INTO clientes (id, nome, quem_indicou) VALUES (4, 'Rafael', 1);

SELECT * FROM clientes;

/*Caso no resultado eu quero mostrar o nome de quem indicou*/

SELECT a.nome AS CLIENTE, b.nome AS "QUEM INDICOU" 
FROM clientes a join clientes b ON a.quem_indicou = b.id;
/* Aqui estou selecionando o campo "nome" da tabela "cliente" quem tem o apelido "a",pois na tabela de apelido "a" tem quem
 indicou e depois quero o campo "nome" da mesma tabela "cliente" de apelido "b",pois a tabela "b" tem o cliente indicado*/
 /*"AS CLIENTE" e ""AS "QUEM INDICOU""" também são apelidos*/
 
 
 -- RELACIONAMENTO COM 3 TABELAS--
 
 SELECT * FROM funcionarios 
INNER JOIN veiculos ON veiculos.funcionario_id = funcionarios.id 
INNER JOIN cpfs ON cpfs.id = funcionarios.id;

 -- VISÕES-BASICAMENTE SÃO CONSULTAS QUE VÃO FICAR ARMAZENADAS NO MEU BANCO DE DADOS--
 
 select*from funcionarios where salario >=1700; /*Nesse comando eu tenho uma consulta SQL,vamos supor que essa consulta no meu
 sistema dezenas de vezes.E que um dia eu tenha que mudar ela para 1800 e eu vou ter que ir nas dezenas de vezes no meu codigo
 nas minhas linguagens de programação e mudar isso ai.Si eu faço a minha linguagem de programação apontar para uma "view" eu mudo 
 apenas na "view" em um unico lugar
 
/*Criando uma "VISÃO" que traga os funcionarios que ganhem mais de 1700*/
CREATE VIEW funcionarios_a AS SELECT * FROM funcionarios WHERE salario >= 1700;
/*"funcionarios_a"  e o nome dessa view*/
/*VIEW funciona como uma TABELA a diferença que internamente o sistema ela não vai armazenar dados e nem ocupa espaço porque ela e uma
consulta realizada em tempo de execução e conforme o sql que vc informou essa view e invocada*/

/*Essa "VIEW" e invocada assim*/
SELECT * FROM funcionarios_a;

/*Agora quero que o  funcionarios de id igual a 3 sofram um update e tenham o salario reduzido*/
UPDATE funcionarios SET salario = 1500 WHERE id = 3;

/*Para deletar uma VIEW*/
DROP VIEW funcionarios_a;

/*Para criar outra VIEW*/
CREATE VIEW funcionarios_a AS SELECT * FROM funcionarios WHERE salario >= 2000;

    /*-------------------Aula 6.2 softblue------------------*/
    
    use curso_sql;
    
    select*from funcionarios;
    
    /*Fazer uma contagem dos registros existentes na tabela funcionarios que dá para ver nesse momento que são quatros*/
    /*A função COUNT vai contar quantos registros vai ser retornado pela sua busca*/
select count(*) from funcionarios; 
    
    /*Si eu quiser uma contagem de quanto registro "funcionarios" recebem um salario acima de 2000 reais*/
select count(*) from funcionarios where salario > 2000;
        
/*Si eu quiser uma contagem de quanto registro "funcionarios" recebem um salario acima de 1600 reais e é do setor de engenharia*/
select count(*) from funcionarios where salario > 1600 and departamento = 'Engenharia';
        
/*Querendo descobrir a soma dos salarios dos funcionarios da empresa*/
select sum(salario) from funcionarios;

/*Quero só a soma dos funcionarios do departamento de engenharia*/
select sum(salario) from funcionarios where departamento = 'Engenharia';

/*Quero descobrir a media dos salarios dos funcionarios da empresa*/
select avg(salario) from funcionarios;

/*Quero descobrir a media dos salarios dos funcionarios do departamento de engenharia*/
select avg(salario) from funcionarios where departamento = 'Engenharia';

/*Quero saber o salario maximo da minha tabela*/
select max(salario) from funcionarios;

/*Quero descobrir o salario maximo dos funcionarios do departamento de engenharia da minha tabela*/
select max(salario) from funcionarios where departamento = 'Engenharia';

/*Quero saber o salario minimo da minha tabela*/
select min(salario) from funcionarios;

/*Quero descobrir o salario minimo dos funcionarios do departamento de engenharia da minha tabela*/
select min(salario) from funcionarios where departamento = 'Engenharia';

/*Para listar os departamentos da empresa,só que esse comando vai listar os departamentos repetidos,ou seja, está trazendo departamento de cada registro da tabela*/
select departamento  from funcionarios;

/*Si eu fizer uso do "distinct" eu trago somente resultados unicos*/
select distinct(departamento)  from funcionarios;

/*Quero listar os departamentos da empresa mas quero que ele sejám retornados em letra maiuscula*/
select upper(departamento)  from funcionarios;

/*Quero listar os departamentos da empresa mas quero que ele sejám retornados em letra maiuscula e somente me traga resultados unicos e não repetidos*/
select distinct(upper(departamento))  from funcionarios;

/*Para fazer ordenação de registro no mysql*/

/*Aqui dessa forma ele traz a lista conforme hora de cadastro desses registros*/
select*from funcionarios;

/*Para eu ordenar por nome*/
select*from funcionarios order by nome;

/*Para trazer ordenado decrescente*/
select*from funcionarios order by nome desc;

/*Para ordenar por salario*/
select*from funcionarios order by salario;

/*Para trazer salario ordenado decrescente*/
select*from funcionarios order by salario desc;

/*Para eu ordenar por departamento*/
select*from funcionarios order by departamento;

/*Para eu ordenar por departamento e por salario,ou seja ele vai ordenar os registros primeiro por  criterio de departamento e para aqueles que forem do mesmo departamento eles 
eles forem usar o salario como novo criterio de ordenação*/
select*from funcionarios order by departamento,salario;

/*Para eu ordenar por departamento e por salario,ou seja ele vai ordenar os registros primeiro por  criterio de departamento e para aqueles que forem do mesmo departamento eles 
eles forem usar o salario como novo criterio de ordenação.Aqui eu coloquei o salario como do maior para o menor*/
select*from funcionarios order by departamento,salario desc;

/*Aqui dessa forma eu vou ter primeiro o setor que tem o salario mais alto p/ o mais baixo */
select*from funcionarios order by departamento desc,salario desc;


/*Comando de paginação*/
/*Para limitar a minha busca para mostrar apenas 2 registros*/
select*from funcionarios limit 2;

/*Quero mostrar 2 funcionarios mas quero pular o primeiro registro*/
/*Em alguns bancos existe os coamdos offset dizendo quantos registros vc deseja pular*/
select*from funcionarios limit 2 offset 1;

/*No mysql esse comando pode ser feito de outra forma*/
select*from funcionarios limit 1, 2;
/*Esse comando diz que quero pular o primeiro registro e somente quero mostrar os dois proximos registros*/

/*Vamos ver agora algumas funções de agrupamento*/

/*Essas funções e quando vc que ter algum resultado de por exemplo alguma operação aritmetica baseado
em um grupo de registros,mas não um grupo especifico*/
/*Por exemplo si eu quiser saber a media salarial de cada departamento*/
select avg(salario) from funcionarios where departamento = 'Engenharia';

select avg(salario) from funcionarios where departamento = 'TI';

/*Si eu quiser ter um comando que faça isso para todos os departamentos,ou seja a  media salarial de cada departamento*/
/*Vou listar os departamentos e mostrar a media salarial dos departamentos*/
select departamento, avg(salario) from funcionarios group by departamento;

/*Para exemplificar a função TRIM,deixei o nome Neuza com bastante espaço nas laterais*/
/*Função TRIM retira os espaços do lado esquerdo e direito*/
insert into funcionarios (nome, salario, departamento)values ( '             Neuza         ', '1400', 'Engenharia');

select * from funcionarios;

/*Esse comando estou fazendo da seguinte maneira,os nomes que estiverem com muito espaço nas laterais vou retirar e mostrar e eu criei 
um apelido para que não mostre na tela trim(nome) e somente nome*/
select trim(nome) as 'Nome' from funcionarios ;

/*A função substring retorna uma parte de caracteres de um string*/
SELECT SUBSTRING('BrunoVictor',5);
/*Aqui nesse exemplo de cima vai mostrar na tela a partir do quinto caracter que no exemplo é  "o"*/

/*Aqui nesse exemplo vai retornar o nome dos funcionarios a partir da quinta letra*/
select SUBSTRING(nome,5) as 'Nome' from funcionarios ;

/*Aqui nesse caso vair retonar o resultado a partir da segunda letra e vai mostrar somente 3 letras*/
select SUBSTRING(nome,2,3) as 'Nome' from funcionarios ;

insert into funcionarios (nome, salario, departamento)values ( 'Michele         ', '1400', 'Engenharia');
insert into funcionarios (nome, salario, departamento)values ( '           Michelle', '1400', 'Engenharia');

select*from funcionarios;

/*A função RTRIM() retira os espaços a direita*/

select RTRIM(nome) as 'Nome' from funcionarios ;

SELECT RTRIM('barbar   ');

/*A função replace substitui uma palavra por outra dentro de uma texto*/
/*Vou trocar todas as letras a por a$a*/
UPDATE funcionarios SET nome = replace( nome, 'a', 'a$a' );

/*Agora vou trocar todas as lestras a$a por a*/
UPDATE funcionarios SET nome = replace( nome, 'a$a', 'a' );

/*Fazendo um Select utilizando a função Replace*/
SELECT replace( nome, 'o', 'oooo' ) as nome FROM funcionarios;
/*Aqui você irá fazer a troca, porém ela não será definitiva, ou seja, só vai aparecer na tela mas não irá gravar no Bando de Dados.*/

/*A função LTRIM retira os espaços a esquerda*/
select LTRIM(nome) as 'Nome' from funcionarios ;

/*A função LOWER() retorna todos os caracteres em minúsculo*/
select LOWER(nome) as 'Nome' from funcionarios ;

/*A função LENGTH retorna a quantidade de caracteres de uma string*/
SELECT LENGTH(nome)as 'Nome' from funcionarios ;

select*from veiculos;

/*A função dayname retorna o nome do dia atual*/
/*Aqui está um exemplo de como extrair o nome do dia da semana de uma coluna ao executar uma consulta em um banco de dados.*/
SELECT
  funcionario_id AS 'Date/Time',
  DAYNAME(funcionario_id) AS 'Weekday Name'
FROM veiculos
WHERE id = 1;

SELECT DAYNAME ('2021-03-16') AS 'Result';

/*Aqui está um exemplo de extração do nome do dia da semana da data e hora atuais (que é retornado usando a NOW()função).*/
SELECT 
    NOW() as 'data',
    DAYNAME(NOW()) as 'dia da semana';
    
    /*A função DATABASE() retorna o banco de dados que você está conectado*/
    select DATABASE();
    
    /*A  função DAY retorna o dia atual*/
    SELECT DAY('2017/08/13 09:08') AS DayOfMonth;
    
    select*from salarios;
    
    /*A função DATEDIFF() retorna a diferença em dias, meses, anos, horas, minutos, segundos entre duas data/hora
   
   /*DATEDIFF()retorna expressão1 - expressão2 expresso como um valor em dias de uma data para a outra. expressão1 e expressão2 são 
   expressões de data ou data e hora. Apenas as partes da data dos valores são usadas no cálculo.*/
   SELECT DATEDIFF('2007-12-31 23:59:59','2007-12-30') as 'diferenca entre as datas';
   
   SELECT DATEDIFF('2010-11-30 23:59:59','2010-12-31');
   SELECT DATEDIFF (  '2004-01-02' , '2004-05-25' );as 'dias';

SELECT DATE_ADD('2018-05-01',INTERVAL 1 DAY);

SELECT DATE_SUB('2018-05-01',INTERVAL 1 YEAR);

SELECT DATE_ADD('2020-12-31 23:59:59',
INTERVAL 1 SECOND);

SELECT DATE_ADD('2018-12-31 23:59:59',
INTERVAL 1 DAY);

SELECT DATE_ADD('2100-12-31 23:59:59',
INTERVAL '1:1' MINUTE_SECOND);

SELECT DATE_SUB('2025-01-01 00:00:00',
INTERVAL '1 1:1:1' DAY_SECOND);

SELECT DATE_ADD('1900-01-01 00:00:00',
INTERVAL '-1 10' DAY_HOUR);

 SELECT DATE_SUB('1998-01-02', INTERVAL 31 DAY);

        
SELECT DATE_ADD('1992-12-31 23:59:59.000002',
INTERVAL '1.999999' SECOND_MICROSECOND);

/*A função CURTIME Retorna a hora atual*/
/*Retorna a hora atual como um valor no formato 'hh:mm:ss'*/
SELECT CURTIME();

/*A função CURDATE retorna a data atual*/
SELECT CURDATE();

SELECT CONVERT('abc' USING utf8mb4);

SELECT CONVERT("11:35:00", YEAR), CONVERT(TIME "11:35:00", YEAR);

/*Aqui nesse comando vou listar todos os departamentos da tabela e mostrar respectivamente as medias salariais*/
SELECT departamento,AVG(salario) FROM funcionarios GROUP BY departamento;

/*HAVING  e tipo de um WHERE para resultados agrupados*/
/*Aqui quero mostrar os departamentos que tem a media salarial acima de 1700*/
SELECT departamento,AVG(salario) FROM funcionarios GROUP BY departamento HAVING AVG(salario) > 1700;

/*COUNT  e uma função para contar registros*/
/*Aqui esse comando mostra quantos funcionarios tem cada departamento*/
select departamento, COUNT(*) FROM funcionarios GROUP BY departamento;

/*Suponha que vc tem um select  que vc quer fazer para mostrar os nome dos funcionarios do departamento cujo a media salarial e acima de 1700/*
/*Primeiro passo,pegar esse comando para ver qual departamento tem a media salarial acima de 1700*/
SELECT departamento,AVG(salario) FROM funcionarios GROUP BY departamento HAVING AVG(salario) > 1700;

/*SELECT nome FROM funcionarios WHERE  departamento = 'T1' OR departamento = 'Engenharia';*/

/*Segundo passo.Aqui vai mostrar os funcionarios do departamento de engenharia*/
SELECT nome FROM funcionarios WHERE  departamento = 'Engenharia';

/*Caso eu queira fazer tudo de uma vez somente,eu faço esse comando;*/
/*O parametro IN vai procurar departamento que faça correspondencia com qualquer valor entre parenteses ()

/*Aqui dessa forma vai trazer os funcionarios do departamento TI e engenharia*/
SELECT nome FROM funcionarios WHERE  departamento IN ('Engenharia','TI');

/*Aqui dessa forma vai trazer os funcionarios do departamento de TI*/
SELECT nome FROM funcionarios WHERE  departamento IN ('TI');

/*Aqui dessa forma vai trazer os funcionarios do departamento de Engenharia*/
SELECT nome FROM funcionarios WHERE  departamento IN ('Engenharia');

/*Aqui eu estou trazendo os nomes dos funcionarios cujo o departamento faça parte da consulta que está entre parenteses.A consulta traz para mim 
dinamicamente os depatamentos da tabela  funcionarios cujo departamento salarial seja acima de 1700 */
SELECT nome FROM funcionarios 
WHERE  departamento IN 
(
SELECT departamento FROM funcionarios GROUP BY departamento HAVING AVG(salario) > 1700
);

/*Funções de Agrupamento geralmente vc manda listar no resultado o campo cujo o resultado está sendo agrupado.
Então si eu estou fazendo um GROUP BY por departamento para obter a media salarial,são esses campos geralmente que eu vou mostrar 
nos resultados ou seja "departamento,AVG(salario)",então faz mais sentido porque ele vai agrupar em um unico registro*/
SELECT departamento,AVG(salario) FROM funcionarios GROUP BY departamento HAVING AVG(salario) > 1700;

/*Para mostrar os nomes fazemos dessa forma*/
SELECT nome FROM funcionarios 
WHERE  departamento IN 
(
SELECT departamento FROM funcionarios GROUP BY departamento HAVING AVG(salario) > 1700
);

/*Porque si for dessa forma vai mostrar somente um unico nome,e não e isso que queremos*/
SELECT nome FROM funcionarios GROUP BY departamento HAVING AVG(salario) > 1700;

/*-----------------AULA - 9.2 ----------------*/
/*STORE PROCEDURES - São ações que vc vai deixar armazenada no banco para que sejam executadas
quando invocadas*/

/*Criar uma tabela de exemplo*/
CREATE TABLE pedidos
(
	id int unsigned not null auto_increment,
    descricao varchar(100) not null,
    valor double not null default '0',/*Caso o valor não seja informado,iremos deixar no valor 0*/
    pago varchar(3) not null default 'Não',/*Por padrão os pedidos serão abertos como não pagos*/ 
    PRIMARY KEY (id)
);

INSERT INTO pedidos (descricao, valor) VALUES ('TV', 3000);
INSERT INTO pedidos (descricao, valor) VALUES ('Geladeira', 1400);
INSERT INTO pedidos (descricao, valor) VALUES ('DVD Player', 300);

SELECT * FROM pedidos;

/*Suponhamos que em tempos em tempos eu preciso limpar a tabela pedido eliminando os pedidos que não foram pagos.
Logicamente eu posso ter uma instrução delete que eu coloco aqui mesmo,mas eu não quero que essa instrução fique aqui.
Vamos supor que a minha ação de limpar pedidos,ela limpa na verdade 4 tabelas ao mesmo tempo,ou seja,limpa da tabela pedido,
limpa da tabela pagamentos,limpa da tabela estoque.Vamos supor que eu tenho um conjunto de ações que preciso executar
na ação de limpar esses pedidos.Então ao inves de eu passar essas ações para todos os meus usuarios,para os meus sistemas
implementados java e php,eu centralizo no banco em uma rotina,em uma store procedure que pode ser invocada pelos meus usuarios,
pelos software escrito em java ou sites em php por exemplo
/* 
Criar Stored Procedures pelo menu lateral, com este SQL:
SET SQL_SAFE_UPDATES = 0;
DELETE FROM pedidos WHERE pago = 'Não';
*/

/*Quando a nossa store procedure deleta dados sem indicar o id e necessario fazer a instrução para fazer o
safe update  SET SQL_SAFE_UPDATES = 0;*/


CALL limpa_pedido();
/*Esse comando vai deletar os pedidos existentes*/
/*Por exemplo:Eu passo para os meus usuarios que vão fazer a limpeza da tabela pedidos,eu passo somente a chamada
ou seja somente esse comando --> CALL limpa_pedido(); <-- .Olha quero que todo dia a meia noite,seu sistema chame
a store procedure "limpa_pedido" e assim toda a logica da "limpa_pedido" vai ficar no banco.Vamos supor que eu tenho um site em php
 e um sistema escrito em java em cada uma das lojas que possam fazer chamadas disso e que eu tenha 10 lojas ao inves de passar
 para essas 10 lojas e para o site essas instruções de quando precisar alterar eu alterar esse dados nos 11 lugares vc deixa tudo centralizado
 no banco e passa apenas o nome da store procedure que esses 11 lugares devem invocar quando vc precisar limpar seu banco*/
 
/*Triggers que também estão relacionadas com store procedures,mas são gatilhos para disparar automaticamente essas store procedures
ou outras ações*/
/*Vamos supor que vc tem uma tabela estoque e toda vez que sua tabela estoque recebe um novo produto, vc quer que nesse momento
seja feito uma chamada para a limpar os pedidos da tabela pedido*/
CREATE TABLE estoque
(
	id int unsigned not null auto_increment,
    descricao varchar(50) not null,
    quantidade int not null,
    PRIMARY KEY (id)
);

select *from estoque;

/*Agora vou criar um trigger que vai disparar camada para limpar pedidos sempre que um registro for adicionado na tabela
estoque*/
CREATE TRIGGER gatilho_limpa_pedidos
BEFORE INSERT/*antes que um registro seja inserido*/
ON estoque   /*no estoque*/
FOR EACH ROW /*por exemplo si eu estou inserindo 10 registro,para cada uma linha de essas 10 chamadas de inserção de registro
algo ocorra que e nosso call */
CALL limpa_pedido();

SELECT * FROM pedidos;

INSERT INTO pedidos (descricao, valor) VALUES ('TV', 3000);
INSERT INTO pedidos (descricao, valor) VALUES ('Geladeira', 1400);
INSERT INTO pedidos (descricao, valor) VALUES ('DVD Player', 300);
UPDATE pedidos SET pago  = 'Sim'  where id = 8;

SELECT * FROM pedidos;

INSERT INTO estoque (descricao, quantidade) VALUES ('Fogão', 5);

SELECT * FROM pedidos;
SELECT * FROM estoque;

INSERT INTO estoque (descricao, quantidade) VALUES ('Forno', 3);
SELECT * FROM pedidos;
SELECT * FROM estoque;

