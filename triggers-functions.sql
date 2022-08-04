select c.NomeCliente, sum(pv.Valor) as Total from cliente c
inner join pedidovenda pv on(pv.idCliente = c.idCliente)
group by c.idCliente; 

delimiter $$
create trigger tgInsert_AtualizaEstoque
before insert on itempedidovenda
for each row
begin
	update produto set QtdEstoque = QtdEstoque - new.Qtd where idProduto = new.idProduto;
end$$

delimiter $$
create trigger tgInsert_AtualizaEstoque
before insert on itempedidovenda
for each row
begin
	update produto set QtdEstoque = QtdEstoque - new.Qtd where idProduto = new.idProduto;
end$$

delimiter $$
create trigger tgUpdate_AtualizaEstoque
before update on itempedidovenda
for each row
begin
	update produto set QtdEstoque = QtdEstoque + old.Qtd where idProduto = old.idProduto;
	update produto set QtdEstoque = QtdEstoque - new.Qtd where idProduto = new.idProduto;
end$$

delimiter $$
create trigger clientLogDelete
before delete on cliente
for each row
	insert into cliente_log(idCliente, NomeCliente, CPF, DataHora, Operacao) 
    values(old.idCliente, old.NomeCliente, old.CPF, now(), "delete");
begin
end$$

delimiter $$
create function getTotalOrdersValue(clientId int)
returns decimal(10, 0) 
begin
	declare totalOrder decimal(10, 0);
    
	select sum(pv.Valor) into totalOrder from cliente c
	inner join pedidovenda pv on(pv.idCliente = c.idCliente)
    	where c.idCliente = clientId
	group by c.idCliente;
    
    return totalOrder;
end$$

select *, getTotalOrdersValue(1) as 'total de pedidos' from cliente where idCliente = 1;
