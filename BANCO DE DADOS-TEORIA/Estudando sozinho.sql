/*Comando para criar o banco de dados chamado "cadastro"*/
create database cadastro;

/*Para selecionar e abrir um banco de dados uso*/
use cadastro;

/*Criando uma tabela chamada pessoas*/
create table pessoas(
nome           varchar(30),
idade		   tinyint, /*O tinyint você não tem obrigatoriedade de colocar o (3) pode colocar só  tinyint que ele indica que só está ocupando 3 bits*/
sexo		   char(1), /*Sempre vai guardar uma letra independente si eu coloque ou não o sexo ele vai colocar só um espaço ali*/
peso		   float,
altura		   float,
nacionalidade  varchar(20)
);

/*Para ver a estrutura interna de uma tabela*/
describe pessoas;

/*Comando para apagar um banco de dado*/
drop database cadastro;

create database cadastro
default character set utf8mb4 /*O utf8 são caracteres acentuados no padrão da lingua portuguesa,eles tem que ser minusculos*/
default collate utf8mb4_general_ci;

create table pessoas(
id int not null auto_increment,/*Estou criando um identificador para a pessoa que vai ser do tipo numerico "Int",meu campo vai ser id,ele vai ser not null porque vc não pode ser um aluno de uma faculdade si vc não tem matricula,ele vai obrigar vc a digitar,a constrain auto-increment a primeira pessoa que eu cadastrar vai ser codigo 1,a segunda vai ser codigo 2,a terceira codigo 3 tudo isso automaticamente*/
nome varchar(30) not null, /*NOT NULL indica que esse campo será obrigatorio digitar,vai ter que informar o nome*/
nascimento date,
sexo enum ('M','F'),/*Só vai permitir que digite a letra M ou F*/
peso decimal (5,2),/*O 5 indica o total de casa e o 2 indica a quantidade de casas que vão ficar apos a virgula*/
altura decimal (3,2),/*O 3 indica o total de casa e o 2 indica a quantidade de casas que vão ficar apos a virgula*/
nacionalidade varchar(20) default'Brasil', /*Significa o seguinte a nacionalidade si ninguem digitar nada por padrão e Brasil*/
primary key (id)/*Para definir o ID como chave primaria eu vou na ultima linha,depois de nacionalidade*/
)default charset utf8mb4; /*E importante na criação da tabela definir o conjunto de caracteres por padrão que vão ser suportados*/

/*Um campo chamado Chave Primaria e um campo que não se repete*/

/*====== AULA 5 -Curso MySQL #05 - Inserindo Dados na Tabela (INSERT INTO) ===========================*/

/*As datas dos bancos de dados Mysql são dados da seguinte maneira,primeiro o ano - mês - dia*/

/*Inserindo dados na tabela*/
insert into pessoas
(nome,nascimento,sexo,peso,altura,nacionalidade)/*Aqui eu não preciso colocar id,pois está como auto increment que serve para cada vez que uma pessoa nova e cadastrada o proprio sistema decida,defina sequencialmente como o codigo vai ser gerador*/
values
('Gracindei','1984-01-03','M','78.5','1.83','Brasil');

/*Inserindo dados na tabela e verificando si está default '' colocado em nacionalidade está funcionando*/
insert into pessoas
(nome,nascimento,sexo,peso,altura)/* devido ao default '' na nacionalidade si ninguem digitar nada por padrão e Brasil*/
values
('Adriano','1984-01-03','M','78.5','1.83');

/*Si a ordem da minha tabela é
	id
    nome
    nascimento
    sexo
    peso
    altura
    nacionalidade
    eu simplesmente não preciso informar os campos no inicio,ou seja si fomos inserir dados e a ordem dos campos forem exatamente a ordem que foi 
    definida nos campos então não precisamos dizer os campos igual o exemplo abaixo*/
    
    insert into pessoas values
    (default,'Neuza','1996-12-30','F','50.2','1.65',default);/*No lugar id e nacionalidade coloquei default que é padrão si ele estiver como alto incremento ele vai ser o padrão*/

/*Inserindo varios dados ao mesmo tempo*/
insert into pessoas
(id,nome,nascimento,sexo,peso,altura,nacionalidade)
values
(default,'Ana','1975-12-22','F','52.3','1.45','EUA'),
(default,'Pedro','2020-07-15','M','52.3','1.45','Brasil'),
(default,'Maria','1999-12-22','F','75.3','1.45','Portugal');

/*Esse comando serve para mostrar si os dados foram inseridos na tabela(CONSULTA)*/
select*from pessoas;

/*=========Curso MySQL #06 - Alterando a Estrutura da Tabela (ALTER TABLE e DROP TABLE)==========*/

/*O comando describe ou des utilizamos para mostrar as colunas*/
desc pessoas;
/*ou dessa maneira*/
describe pessoas;

/*Comando para adicionar um novo campo na tabela*/
alter table pessoas
add column profissao varchar(10);/*não pode ter acento profissao,os campos sempre serao em letras minusculas*/

/*Removendo uma coluna da tabela*/
alter table pessoas
drop column profissao;

/*Escolhendo a posição da coluna na tabela*/
alter table pessoas
add column profissao varchar(10) after nome;/*After significa depois,ou seja depois da coluna nome iremos colocar profissão*/

/*Para adicionar uma coluna na primeira posição da tabela*/
alter table pessoas
add column codigo int first;/*Vou adicionar o campo codigo*//*A palavra column e opcional si eu colocar ou não,vao funcionar*/

/*Si a gente quiser colocar depois de qualquer um campo usamos after
  Si a gente quiser que seja o primeiro campo coloco first*/
  
  alter table pessoas
  modify column profissao varchar(20);/*Conseguimos alterar o tipo primitivo do campo e todas as constrains,só não conseguimos renomear as constrains
  Por exemplo renomear profissao p/ prof nao conseguimos*/
  
  SET SQL_SAFE_UPDATES = 0;/*Variavel global do MySql,estou desativando e uma proteção do mysql*/
  
update pessoas set profissao='' where profissao is null;/*Modifique a tabela pessoas,configurando a profissão para valor vazio,onde profissao e nulo*/

 /*Nesse caso aqui,eu não posso deixar somente o not null,pois ele diz que vc e obrigatorio a escrever algo,mas como estamos dizendo que essa coluna
  e nova não vai ter nada escrito por isso vai ter o conflito.Para evitar esse conflito colocamos o default para vazio*/
  alter table pessoas
  modify column profissao varchar(20) not null default'';
  
  /*Renomeando colunas*/
  Alter table pessoas
  change column profissao prof varchar(20);/*No change temos que colocar o nome velho e o nome novo*/
  
  /*Renomeando a Tabela*/
  alter table pessoas
  rename to gafanhotos;
  
show tables;/*Comando usado para pedir pro sistema exibir todas as tabelas presentes no banco de dados selecionado:*/


/*Criando mais uma tabela*/
create table if not exists cursos(/*if not exists ou if exists e um parametro que só vai criar uma tabela,banco de dados si ele não existir ou existir*/
nome varchar (30) not null unique,/*Unique e o seguinte eu ñ estou dizendo que o nome e uma chave primaria ele nãao vai identificar os registros,mas ele não vai deixar colocar 2 cursos com o mesmo nome*/
descricao text,/*text e usado para textos longos*/
carga int unsigned,/*significa sem sinal,só armazena numero positivos,vai economizar um bit para cada registro que tem carga registrada*/
totaulas int,
ano year default '2016'
)default charset = utf8mb4;


/*Adicionando uma Chave Primaria p/ uma tabela já existente
1° Passo: colocar o codigo do curso no primeiro lugar*/
alter table cursos
add column idcurso int first;/*Add a coluna "idcurso" como um inteiro na tabela como primeira coluna*/
/*2°Passo:colocar a chave primaria*/
alter table cursos
add primary key(idcurso);


describe cursos;

/*Comando para apagar a tabela inteira*/
drop table cursos;