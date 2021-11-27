use empresa;

select nome from funcionario where sexo = 'm' and salario < 980 and departamento in ('desenvolvimento');

select * from funcionario 
where ( salario > 2000 and salario <= 3500 ) and ( data_nascimento >= '1985-11-06' and data_nascimento <= '1987-10-03' );

select * from funcionario 
where ( salario > 2000 and salario <= 3500 ) and ( data_nascimento between '1985-11-06' and '1987-10-03' );

select nome, salario from funcionario
order by salario desc;

select nome, salario, sexo from funcionario
order by salario asc, sexo desc;

select * from funcionario
order by nome limit 5,5;

-- delete from funcionario;
-- truncate table funcionario;

delete from funcionario where salario >= 8000;

-- update funcionario set salario = salario * 1.20;

update funcionario set salario = salario * 1.20 where sexo = 'f' and salario < 4000;

select distinct departamento from funcionario order by departamento;

select * from funcionario
where substring(data_nascimento, 6, 2) in ('10', '11');

select distinct 
concat(substring(data_nascimento, 9, 2), '/', substring(data_nascimento, 6, 2), '/', substring(data_nascimento, 1, 4)) as 'Data nascimento' 
from funcionario
order by data_nascimento; 

update funcionario set salario = salario * 1.20 where
concat(substring(data_nascimento, 6, 2), '/', substring(data_nascimento, 1, 4)) = '11/1985';

update funcionario set salario = salario * 1.20 where substring(data_nascimento, 1, 7) = '1985-11';

select concat('O funcionário ', nome, ' ganha um salário de ', round(salario, 2), ' reais') as mensagem from funcionario;

