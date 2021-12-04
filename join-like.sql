use basevendas;

-- LIKE

select nome from clientes where nome like "%DROG%";

select nome from clientes where nome like "%ANA%";

select nome from clientes where nome like "%MARIA%";

select nome from clientes where nome like "%MARIA";

select nome from clientes where nome like "____ %";

select nome from clientes where nome like "_____ _____";

select nome from clientes where nome like "%ANA%" and nome not like "% % %";

select nome from clientes where nome like "%MARIA%" and nome not like "% % % %";

select nome from clientes where nome like "MARIA CLARA";

-- JOIN

select f.descricao, p.descricao from fornecedores f 
inner join produtos p 
on (f.CodFornecedor=p.CodProduto)
where f.cidade = "SAO PAULO"; 

select f.descricao, p.descricao from fornecedores f 
right outer join produtos p 
on (f.CodFornecedor=p.CodProduto)
where f.cidade = "SAO PAULO";

select f.descricao, p.descricao from fornecedores f, produtos p
where (f.CodFornecedor=p.CodProduto);

