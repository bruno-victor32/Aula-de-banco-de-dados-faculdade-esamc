CREATE DATABASE curso_sql;/*Comando Para criar o banco de dados, "curso_sql" e o nome do banco de dados,sempre utilizar 
letras minusculas e uma boa prática*/

USE curso_sql;/*Comando p/ selecionar o banco de dados que vou utilizar que no caso e o banco "curso_sql"*/

CREATE TABLE funcionarios /*Comando para criar uma tabela que no caso vai ser chamada "funcionarios"*/
(
	id int unsigned not null auto_increment,
    nome varchar(45) not null,/*STRING que tem o valor variavel de 45 posições e isso e o tamanho maximo*/
    salario double not null default '0',/*Vai ser do tipo double,quero trabalhar com numeros decimais e ele também e numerico,
    default '0' si nenhum valor digitado o mysql vai trabalhar com o valor padrão 0 que no caso foi eu que selecionei o valor*/
    departamento varchar(45) not null,
    PRIMARY KEY (id)/*A minha chave primaria vai ser o campo "id"*/
);


CREATE TABLE veiculos
(
	id int unsigned not null auto_increment,
    funcionario_id int unsigned default null,
    veiculo varchar(45) not null default '',/*default '0' vai permitir que o carro ainda não tenha descrição e que um funcionario possa colocar*/
    placa varchar(10) not null default '',/*default vai ficar vazio caso ninguem preencha vai ficar a placa vazia quando carro 
    novo sai,placa vazia pode placa nula não pode*/
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
/*Muito cuidado quando vc altera um campo de varchar que e um campo que recebe nomes e coloca por exemplo um que recebe int ou 
seja númerico vc pode perde dados*/

DROP TABLE salarios;/*Comando para deletar uma tabela*/

CREATE INDEX departamentos ON funcionarios (departamento);
CREATE INDEX nomes ON funcionarios (nome(6));/*como ele e uma string de 45 posições,eu posso dizer para o mysql que ele
 não precisa gerenciar as 45 posições e que para mim só importa os 6 primeiros caracteres de cada nome dessa ordenação porque os 
 nomes depois de 6 caracteres já estão em uma forma mais ordenada.Por exemlo placa de carro que tem 3 letras e 4 numeros quero um indice que ordene 
somente por 3 letras que são os 3 primeiros caracteres*/

    /*Nota:Vazio e um valor mesmo que um valor vazio*/
    /*Nota:Nulo que dizer omissão de valor*/
    
    /*-------------------Aula 4.2 softblue------------------*/
    
use curso_sql;

/*Inserindo dados na tabela*/

insert into funcionarios (id,nome, salario, departamento)values (1, 'Fernando', '1400', 'Engenharia');
/*Não precisa colocar o id*/
insert into funcionarios (id,nome, salario, departamento)values (1, 'Guilherme', '1400', 'TI');
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
/*Quero fazer uma mudança na tabela veiculos muda o proprietario do carro que estava funcionario 1"Fernando' dono do carro com
 placa SB-002 para funcionario 5 que é Isabela */
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

    