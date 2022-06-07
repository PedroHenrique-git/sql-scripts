CREATE PROCEDURE `spShowClients` ()
BEGIN
	select * from cliente;
END

CREATE DEFINER=`root`@`localhost` PROCEDURE `spInsertClient`(in id int, in name varchar(100), in cpf varchar(40))
BEGIN
	insert into cliente(idCliente, NomeCliente, CPF) values(id, name, cpf);
END

CREATE PROCEDURE `spAverageProductPrice` (out param float)
BEGIN
	select avg(Preco) into param from produto; 
END

CREATE PROCEDURE `spFatorial` (inout num int)
BEGIN
	declare i int;
    declare resultado int;
	set i = num - 1;
    
    while (i > 0) do
		set resultado = resultado * i;
		set i = i - 1;
    end while;
    
    select concat("O fatorial de ", num, " é ", resultado);
END

CREATE DEFINER=`root`@`localhost` PROCEDURE `spDeleteOrderItems`(in orderId int)
BEGIN
	delete from itempedidovenda where idPedidoVenda = orderId;  
END

CREATE PROCEDURE `spUpdateProductQuantity` (in productId int, in quantity int)
BEGIN
	update produto set QtdEstoque = quantity where idProduto = productId;   
END

CREATE DEFINER=`root`@`localhost` PROCEDURE `spShowClientsWithMoreThanOneThousandsInOrders`()
BEGIN
	select c.NomeCliente, c.CPF
    from cliente c
    inner join pedidovenda pv
    on (pv.idCliente = c.idCliente)
    where year(pv.DataPedido) = "2020" 
    group by pv.idCliente
    having sum(pv.valor) > 1000;
END

CREATE PROCEDURE `spShowAllUnavailableProducts` ()
BEGIN
	select * from produto where QtdEstoque = 0;
END

CREATE DEFINER=`root`@`localhost` PROCEDURE `spDeleteClientsWithoutOrders`(in clientId int)
BEGIN
	delete 
    from cliente 
    where 
    (select count(*) from PedidoVenda where idCliente = clientId) = 0
    and
    idCliente = clientId;
END

CREATE PROCEDURE `calculareOrderPrice` (in orderId int)
BEGIN
	declare resultado decimal(18,2);
	declare price decimal(18,2);
	declare fim boolean;
    declare c_itemvenda cursor for
		select ipv.Preco
		from itempedidovenda ipv
		inner join pedidovenda pv on(pv.idPedidoVenda = ipv.idPedidoVenda);
	declare continue handler for not found set fim = true;
    open c_itemvenda;
		READ_LOOP:
			LOOP
				FETCH c_itemvenda into price;
				set resultado = resultado + price;
                if fim then
					leave read_loop;
                end if;
            end LOOP;
    close c_itemvenda;
END