use basevendas;

select nome from clientes where nome like "%DROG%";

select nome from clientes where nome like "%ANA%";

select nome from clientes where nome like "%MARIA%";

select nome from clientes where nome like "%MARIA";

select nome from clientes where nome like "____ %";

select nome from clientes where nome like "_____ _____";

select nome from clientes where nome like "%ANA%" and nome not like "% % %";

select nome from clientes where nome like "%MARIA%" and nome not like "% % % %";

select nome from clientes where nome like "MARIA CLARA";

