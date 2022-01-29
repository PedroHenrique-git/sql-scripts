use basevendas;

-- exercise 1 
select distinct f.nome from fornecedor f
inner join produto p on (p.fornecedor_id = f.id)
inner join produto_vendido pv on (pv.produto_id = p.id)
inner join venda v on (pv.venda_id = v.id)
where p.estoque > (select avg(estoque) from produto)
and
substring(v.data_venda, 1, 4) = '2006'
order by p.estoque desc
limit 1000;

-- exercise 2
select ve.nome, SUM((v.valor_total * ve.comissao_percentual) / 100) as COMISSAO from vendedor ve
inner join cliente c on (c.vendedor_id = ve.id)
inner join venda v on (v.cliente_id = c.id)
group by ve.id
having COMISSAO > 200;

-- exercise 3
select concat(c.nome, ' - ', u.sigla) as "CIDADE - UF", count(*) as "QUANTIDADE FORNECEDORES" from cidade c
inner join uf u on (c.uf_id = u.id)
inner join fornecedor f on (f.cidade_id = c.id)
group by c.nome, u.sigla
order by count(*) desc;
 
-- exercise 4
 select distinct substring(data_cadastro, 1, 4) from cliente;
 
-- exercise 5 - a
 desc produto;
 
-- exercise 5 - b
drop table produto;
  
-- exercise 6 - a
select * from cliente 
where nome like "%SILVA";

-- exercise 6 - b
select * from cliente 
where nome like "MARIA%";

-- exercise 6 - c
select * from cliente 
where nome like "%CARLOS%";