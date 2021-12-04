use basevendas;

-- exercise 1

select * from fornecedores where substring(telefone, 2, 2) in ('11', '21');

-- exercise 2

select descricao, concat(cidade, '/', estado) as 'cidade/estado' from fornecedores where estado in('SP', 'RJ', 'MG');

-- exercise 3

select * from produtos where principio like "______" and principio not like "% %";

-- exercise 4

select * from produtos where principio like "A%" and principio not like "% % % %";

-- exercise 5

select nome, cidade, datacadastro from clientes where substring(datacadastro, 6, 2) = '11' and cidade like "M%";

-- exercise 6

select nome, concat(substring(datacadastro, 6, 2), '/', substring(datacadastro, 1, 4)) as 'mes/ano' from clientes where cidade not in ('CORDEIRO', 'NOVA FRIBURGO');

-- exercise 7

select distinct concat(cidade, '/', bairro) as 'cidade/bairro' from clientes 
where cidade != '' and cidade is not null and bairro != '' and bairro is not null;

-- exercise 8

select * from produtos where ( pcusto * .5 ) > 30;

-- exercise 9

select * from produtos where estoque > 0 and apresentacao != '' and apresentacao is not null; 