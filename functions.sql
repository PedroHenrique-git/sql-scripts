use basevendas;

select date_format(data_venda, "%d/%m/%Y") from venda;
select current_date();
select current_time();
select now();
select datediff(current_date(), "2013-09-01");
select dayname("2013-09-01");
select dayofweek("2013-09-01");
select day("2013-09-01");
select month("2013-09-01");
select year("2013-09-01");

select date_add(now(), INTERVAL 12 MONTH);

select sqrt(4), pow(2, 2), mod(3,2);
select greatest(1,2,3,4,5,6), least(5,6,7,8,9);

select ltrim("   xxx"), rtrim("xxx   "), ucase("pedro"), lcase("PEDRO"), replace("BANANA", "NA", "XY");

mysqldump -u root -p --databases basevendas > C:\backup\basevendas.sql;

mysqldump -u root -p --all-databases basevendas > C:\backup\basevendas.sql;

mysqldump -u root -p --databases basevendas fornecedor > C:\backup\basevendas.sql;

mysqldump -u root -p --databases basevendas fornecedor produto > C:\backup\basevendas.sql;