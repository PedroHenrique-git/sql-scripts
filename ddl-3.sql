use basevendas;

rename table clientes to cliente;
rename table fornecedores to fornecedor;
rename table lotes to lote;
rename table produtos to produto;
rename table produtosvendidos  to produto_vendido;
rename table tiposproduto to tipo_produto;
rename table vendas to venda;
rename table vendedores to vendedor;

alter table cliente engine=INNODB;
alter table fornecedor engine=INNODB;
alter table lote engine=INNODB;
alter table produto engine=INNODB;
alter table produto_vendido engine=INNODB;
alter table tipo_produto engine=INNODB;
alter table venda engine=INNODB;
alter table vendedor engine=INNODB;

truncate table lote;

alter table lote2 modify nlote varchar(20) default 0;

drop table lote;

rename table lote2 to lote;

drop table venda;

rename table venda2 to venda;

show columns from cliente;

describe cliente;

alter table cliente 
change column codCliente id int auto_increment,
change column bairro bairro_descricao varchar(50),
change column cidade cidade_descricao varchar(50),
change column uf uf_sigla char(2),
change column datacadastro data_cadastro date,
change column limitecredito limite_credito decimal(10, 2),
change column codVendedor vendedor_id int;

describe fornecedor;

alter table fornecedor
change column CodFornecedor id int auto_increment,
change column cidade cidade_descricao varchar(60),
change column estado uf_sigla char(2);

describe vendedor;

alter table vendedor
change column CodVendedor id int auto_increment,
change column NOME nome varchar(40),
change column comissao comissao_percentual decimal(9,2);

create table uf (
	id int auto_increment primary key,
	sigla char(2) not null,
	unique index idx_sigla(sigla)
)engine=INNODB charset=utf8 collate=utf8_unicode_cli;

insert into uf(sigla)
(select distinct uf_sigla from cliente
where uf_sigla is not null and uf_sigla <> '');
union
(select distinct uf_sigla from fornecedor 
where uf_sigla is not null and uf_sigla <> '' 
and uf_sigla not in ('ff', 'GH', 'SÃ'))
order by uf_sigla;

alter table cliente add column uf_id int after id;

alter table fornecedor add column uf_id after id;

update cliente c join uf u on(u.sigla = c.uf_sigla)
set c.uf_id = u.id;

update fornecedor f join uf u on(u.sigla = f.uf_sigla)
set f.uf_id = u.id;

alter table cliente drop column uf_sigla;

alter table fornecedor drop column uf_sigla;

create table cidade (
	id int auto_increment primary key,
	uf_id int,
	descricao varchar(40),
	unique index idx_uf_if_descricao(uf_id, descricao)
)engine=innodb charset=utf8 collate=utf8_unicode_ci;

insert into cidade(uf_id, descricao)
(select distinct uf_id, cidade_descricao from cliente where uf_id is not null)
union
(select distinct uf_id, cidade_descricao from fornecedor f where uf_id is not null)
order by cidade_descricao;

alter table cliente add column cidade_id int after uf_id;

alter table fornecedor add column cidade_id int after uf_id;

select 
c.descricao, 
cl.cidade_descricao, 
c.uf_id, 
cl.uf_id,
c.id
from cidade c join cliente cl on(c.uf_id=cl.uf_id and c.descricao=cl.cidade_descricao);

update cidade c join cliente cl on (c.uf_id=cl.uf_id and c.descricao=cl.cidade_descricao)
set cl.cidade_id=c.id;

update fornecedor f join cliente cl on (f.uf_id=cl.uf_id and f.descricao=cl.cidade_descricao)
set cl.cidade_id=f.id;

alter table fornecedor drop column uf_id, drop column cidade_descricao;

alter table cliente drop column uf_id, drop column cidade_descricao;