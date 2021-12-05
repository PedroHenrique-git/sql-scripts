create database if not exists base_de_dados;

use base_de_dados;

create table users(
	id int unsigned auto_increment primary key,
	first_name varchar(150) not null,
	last_name varchar(150) not null,
	email varchar(255) not null,
	password_hash varchar(255) not null,
	constraint users_email unique (email),
	constraint users_password_hash unique (password_hash)
)engine=innodb charset=utf8 collate=utf8_unicode_ci auto_increment=1;

create table roles(
	id int unsigned auto_increment primary key,
	name varchar(100) not null
)engine=innodb charset=utf8 collate=utf8_unicode_ci auto_increment=1;

create table users_roles(
	user_id int unsigned not null,
	role_id int unsigned not null,
	constraint users_roles_key primary key (user_id, role_id),
	constraint users_roles_pk foreign key (user_id) references users(id) on delete cascade on update cascade,
	constraint users_roles_pk_1 foreign key (role_id) references roles(id) on delete cascade on update cascade
)engine=innodb charset=utf8 collate=utf8_unicode_ci auto_increment=1;

create table profiles(
	id int unsigned auto_increment primary key,
	bio text,
	description text,
	user_id int unsigned,
	constraint user_fgkey foreign key (user_id) references users(id) on delete cascade on update cascade,
	constraint user_unique_id unique key (user_id)
)engine=innodb charset=utf8 collate=utf8_unicode_ci auto_increment=1;

alter table users add column created_at datetime not null default now();

alter table users add column updated_at datetime not null default now();

alter table users modify column updated_at datetime not null default now() on update now();