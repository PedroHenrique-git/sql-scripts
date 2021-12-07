use base_de_dados;

show tables;

describe users;

insert into users(first_name, last_name, email, password_hash) values
('Pedro', 'Henrique', 'p@email.com', '12312312asdad'),
('Luiz', 'Henrique', 'l@email.com', 'asdasd123123123');

select * from users;
select first_name, last_name, email from users;
select * from users where id >= 2 and first_name <> '';
select * from users where first_name like "%Pedro%";
select * from users where created_at between '2021-08-28 16:36:43' and '2021-12-06 21:13:30';
select * from users where id in (1,2,3,4,5,6,7,8,9,10,11,12,70,40);
select * from users where first_name like "he%";
select * from users where first_name like "%he";
select * from users where substring(first_name, 1, 1) = 'P';
select * from users order by first_name asc;
select * from users limit 5 offset 0;

insert into profiles (bio, description, user_id)
select concat('bio de ', first_name), concat('description de ', first_name), id from users;

delete from profiles;
