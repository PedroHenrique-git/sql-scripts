create database if not exists empresa;

use empresa;

create table if not exists funcionario(
    id int not null auto_increment primary key,
    nome varchar(60) not null,
    sexo enum('m', 'f') not null,
    salario decimal(9,2) not null default 980.00,
    index idx_funcionario_nome(nome)
)engine=innodb charset=utf8 collate=utf8_unicode_ci auto_increment=1;

describe funcionario;

rename table funcionario to empregados;

alter table funcionario drop index idx_funcionario_nome;

alter table funcionario add unique index idx_funcionario_nome(nome);

alter table funcionario engine=MyISAM;

show index from funcionario; 

show columns from funcionario;

alter table funcionario add column datanascimento date after sexo,
add column departamento varchar(30) not null default "vendas" after salario;

alter table funcionario change column datanascimento data_nascimento date;

alter table functionario drop column departamento;

show columns from funcionario;

