use basevendas;

-- exercise 1 
select c.nome, v.data_venda from cliente c
inner join venda v on (v.cliente_id = c.id)
where v.valor_total > (select avg(valor_total) from venda);

-- exercise 2
select descricao from produto
where preco_custo = (select max(preco_custo) from produto);

-- exercise 3
select c.nome, sum(v.valor_total) as total from cliente c
inner join venda v on(v.cliente_id = c.id)
where substring(v.data_venda, 1, 4) = '2006'
group by c.nome
order by total desc
limit 10;

-- exercise 4
select p.descricao, sum(pv.quantidade) as total from produto p
inner join produto_vendido pv on (pv.produto_id = p.id)
inner join venda v on(pv.venda_id = v.id)
where substring(v.data_venda, 1, 4) = '2006'
group by p.descricao
order by total desc
limit 5;

-- exercise 5
select f.nome from fornecedor f
inner join cidade c on (f.cidade_id = c.id)
inner join uf u on (c.uf_id = u.id)
inner join produto p on (p.fornecedor_id = f.id)
where u.sigla = 'SP'
group by p.fornecedor_id
having count(*) > 5
order by  count(*) desc; 