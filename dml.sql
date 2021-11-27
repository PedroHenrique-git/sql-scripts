use empresa;

insert into funcionario(nome, sexo, data_nascimento, salario, departamento)
values ('Luiz', 'm', '1980-10-30', 3500.00, 'vendas');

insert into funcionario(nome, sexo, data_nascimento, salario, departamento)
values ('Henrique', 'm', '1990-10-30', 3500.00, 'vendas'),
('Simone', 'f', '1980-10-09', 3500.00, 'vendas'),
('Paulo', 'm', '1980-10-31', 3500.00, 'vendas'),
('Lais', 'f', '1980-10-30', 3500.00, 'vendas'),
('Pablo', 'm', '1980-10-30', 3500.00, 'vendas'),
('Marlon', 'm', '1980-10-30', 3500.00, 'vendas'),
('Macedo', 'm', '1980-10-30', 3500.00, 'vendas');

insert into funcionario values(10, 'Dávila', 'f', '1990-06-10', 8000, 'vendas');

insert into funcionario values(11, 'Dávila', 'f', '1990-06-10', 8000, 'vendas'),
(12, 'Marcela', 'f', '1990-06-10', 8000, 'vendas');

select * from funcionario;