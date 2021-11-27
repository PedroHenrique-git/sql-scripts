-- exercise 1

select descricao, endereco from fornecedores where estado = 'SP' and cidade in ('DIADEMA', 'BARUERI');

-- exercise 2

select * from fornecedores where estado = 'SP' and cidade not in ('BROTAS', 'SAO PAULO');

-- exercise 3

select descricao, telefone from fornecedores where estado in ('MG', 'SP') and cidade <> '' and cidade is not null;

-- exercise 4

select * from fornecedores order by descricao limit 4,8;

-- exercise 5

select descricao, pcusto, (pcusto * 1.30) as 'Preço de venda' from produtos where estoque > 0;

-- exercise 6

select descricao, pcusto, estoque, ( (pcusto * 1.25) * estoque ) as 'Balanco' from produtos;

-- exercise 7

select * from produtos where ( pcusto * 1.30 ) > 8 and ( pcusto * 1.30 ) < 10;

-- exercise 8

select * from produtos order by pcusto desc; 

-- exercise 9

select * from clientes where datacadastro > '2002-10-01'; 

-- exercise 10

select * from clientes where datacadastro between '2002-10-01' and '2002-10-16';

-- exercise 11

select * from vendas where ( valorTotal * 0.3 ) > 100; 

-- exercise 12

select *, (valorTotal * 0.03) as 'Comissão vendedor' from vendas; 