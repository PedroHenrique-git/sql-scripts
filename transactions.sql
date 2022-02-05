create database transacao;
use transacao;

 create table conta(
    id int auto_increment primary key, 
    nome_cliente varchar(20), 
    saldo decimal(10,2) default 0
)engine=innodb;

insert into conta values (1, 'joão', 1000), (2, 'Maria', 1000);

set session autocommit = 0;
set @valorASerTransferido = 555;

update conta set saldo = saldo - @valorASerTransferido where id = 1;

update conta set saldo = saldo + @valorASerTransferido where id = 2;

select * from conta;

rollback;

commit;