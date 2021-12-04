use basevendas;

-- exercise 1

select * from clientes
where datacadastro between '2004-01-10' and '2005-12-20'
and bairro = "CENTRO"
and cidade in ("NOVA FRIBURGO", "CORDEIRO", "CANTAGALO", "BOM JARDIM")
and endereco != ''
and endereco is not null order by CodCliente;

-- exercise 2

select * from clientes 
where cidade not in ("CORDEIRO", "ITAOCARA", "CANTAGALO");

-- exercise 3

select f.descricao, p.descricao, p.estoque 
from fornecedores f 
inner join produtos p on (f.CodFornecedor=p.codfornecedor);

-- exercise 4

select f.descricao, p.descricao, p.estoque 
from fornecedores f
right outer join produtos p 
on (f.CodFornecedor=p.codfornecedor);

-- exercise 5

select f.descricao, p.descricao, p.estoque
from fornecedores f
left outer join produtos p
on (f.CodFornecedor=p.codfornecedor);

-- exercise 5

select concat(substring(vda.datavenda, 9, 2), '/', substring(vda.datavenda, 6, 2), '/', substring(vda.datavenda, 1, 4)) as 'Data venda', c.nome as 'Nome cliente', vdo.NOME as 'Nome vendedor', vdo.COMISSAO as 'Valor comissao'
from clientes c
inner join vendas vda on (vda.CodCliente=c.CodCliente)
inner join vendedores vdo on (vdo.CodVendedor=c.codvendedor);

-- exercise 6

select p.descricao as 'Nome produto', f.descricao as 'Nome fornecedor',  p.pcusto as 'Preço de custo', round((p.pcusto * 1.25), 2) as 'Preço venda', round(( (p.pcusto * 1.25) - pcusto ), 2) as 'Lucro'
from produtos p
inner join fornecedores f 
on (f.CodFornecedor=p.codfornecedor)
inner join tiposproduto tp
on (tp.CodTipo=p.codtipo)
where f.estado = "SP" and tp.descricao = "MEDICAMENTOS";

-- exercise 7

select p.descricao 
from produtos p
inner join produtosvendidos pv
on (pv.codproduto=p.CodProduto)
inner join vendas v
on (v.CodVendas=pv.codvendas)
inner join clientes c 
on (c.CodCliente=v.CodCliente)
where c.cidade = "NOVA FRIBURGO";

-- exercise 8

select * from vendas v
inner join clientes c
on (c.CodCliente=v.CodCliente)
inner join vendedores vdo
on (vdo.CodVendedor=c.codvendedor)
where substring(vdo.NOME, 1, 1) = "P";

-- exercise 9

select
	p.descricao as 'nome produto',
    f.descricao as 'nome fornecedor',
    vda.datavenda as 'data da venda',
    c.nome as 'nome cliente',
    vdo.NOME as 'nome vendedor'
from produtos p
inner join fornecedores f
on (f.CodFornecedor = p.codfornecedor)
inner join produtosvendidos pv
on (pv.codproduto=p.CodProduto)
inner join vendas vda
on (vda.CodVendas=pv.codvendas)
inner join clientes c
on (c.CodCliente=vda.CodCliente)
inner join vendedores vdo
on (vdo.CodVendedor=c.codvendedor)
where substring(vda.datavenda, 6, 2) in ('06', '08', '10');
    




