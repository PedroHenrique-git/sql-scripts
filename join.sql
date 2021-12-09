use base_de_dados;

select u.id as "user id", p.id as "profile id" from users u inner join profiles p on (p.user_id=u.id);

select u.id as "user id", p.id as "profile id" from users u left outer join profiles p on (p.user_id=u.id);

select u.id as "user id", p.id as "profile id" from users u right outer join profiles p on (p.user_id=u.id);

select round(rand() * 10000, 2);
update users set salary = round(rand() * 10000, 2);