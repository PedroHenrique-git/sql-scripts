select count(distinct codfornecedor) as total_linhas from basevendas.produto;

select count(*) as total_linhas from basevendas.produto;

select count(distinct principio) as qtde_principios_distintos from basevendas.produto 
where nome not like 'S%';

select sum(pcusto) as somatorio_pcusto from basevendas.produto;

select avg(pcusto) as media_pcusto from basevendas.produto;

select max(pcusto) as maior_custo from basevendas.produto;

select min(pcusto) as menor_custo from basevendas.produto;

select * from produto where estoque > (select avg(estoque) from produto);

select * from produto where estoque = (select min(estoque) from produto);

select * from produto where estoque = (select max(estoque) from produto);

select sum(estoque * pcusto) from produto;

select nome, pcusto, (select avg(pcusto * 1.3) from produto) as pvenda_medio, format((pcusto * 1.3),1) as pvenda 
from produto
where (pcusto * 1.3) > (select avg(pcusto * 1.3) from produto);