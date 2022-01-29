use basegroupby;

select fabricante, count(*) as QTDE from produto group by fabricante;

select fabricante, sum(pcusto) as TOTAL from produto group by fabricante;

select fabricante, sum(pcusto) as TOTAL from produto
where substring(nome, 1, 1)<>'S'
group by fabricante;

select fabricante, sum(pcusto) as TOTAL from produto
group by fabricante
order by total desc;

select fabricante, sum(pcusto) as TOTAL from produto
group by fabricante
order by total desc
limit 3;

select fabricante, count(*) as QTDE from produto
group by fabricante
having count(*) > 1;

select fabricante, sum(pcusto) as TOTAL from produto
group by fabricante
having sum(pcusto) > 15;

select fabricante from produto
group by fabricante having sum(pcusto) > 15;

select fabricante, count(*) as TOTAL from produto
where substring(nome, 1, 1)<>'S'
group by fabricante having count(*) > 1;

select principio, fabricante, count(*) as TOTAL from produto
group by fabricante, principio;

select f.nome as FABRICANTE, sum(p.pcusto) as TOTAL
from produto p join fabricante f on (p.fabricante_id=f.id)
where substring(p.nome, 1, 1) in ('A','B', 'R', 'L')
group by f.id;
