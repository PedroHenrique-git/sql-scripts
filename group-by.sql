select id, first_name, count(id) as total from users
group by first_name
order by total desc;

alter table users add column salario double not null default 10000;

update users set users.salario = rand() * 10000;

select 
max(u.salario) as max_salary,
min(u.salario) as min_salary,
avg(u.salario) as average,
sum(u.salario) as sum_salary,
count(u.salario) as count_salary
from users u
where first_name = "Carly"
group by u.first_name;