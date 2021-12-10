use base_de_dados;

select u.id as "user id", p.id as "profile id" from users u inner join profiles p on (p.user_id=u.id);

select u.id as "user id", p.id as "profile id" from users u left outer join profiles p on (p.user_id=u.id);

select u.id as "user id", p.id as "profile id" from users u right outer join profiles p on (p.user_id=u.id);

select round(rand() * 10000, 2);
update users set salary = round(rand() * 10000, 2);

insert into roles (name) values 
('POST'), ('PUT'), ('DELETE'), ('GET');

insert into users_roles (user_id, role_id)
values (5, 4);

select user_id, role_id from users_roles ur where user_id = 5 and role_id = 4;

insert ignore into users_roles (user_id, role_id)
select id,
(select id from roles order by rand() limit 1)
from users order by rand() limit 50;

select 
u.id as "user id", u.first_name, p.bio, ur.role_id, r.name 
from  users u
left outer join profiles p on (u.id = p.user_id)
inner join users_roles ur on (ur.user_id = u.id)
inner join roles r on (ur.role_id = r.id)
order by u.id;

select u.first_name, p.bio from users u
inner join profiles p
on p.user_id = u.id 
where u.first_name = "Katelyn";

-- select u.first_name, p.bio from users u
update users u
inner join profiles p
on p.user_id = u.id
set p.bio = concat(p.bio, ' atualizado'); 
where u.first_name = "Katelyn";

delete u 
from users u
inner join profiles p
on p.user_id = u.id 
where u.first_name = "Katelyn";