create database diagram;
use diagram;
create table banners(
id varchar(36) primary key,
title varchar(255) not null,
image varchar(200) not null,
summary varchar(200),
link varchar(200),
order_by varchar(255),
status bit default 1
);
drop table banners;
insert into banners(id, title, image, summary, link, order_by, status) values (uuid(),'title', 'link image 1','summary 1','link', 'order by', 1 );
select * from banners;
--
create table contacts(
id varchar(36) primary key,
email varchar(255) not null,
address varchar(200) not null,
message varchar(200),
status bit default 1
);
drop table contacts;
insert into contacts() values();
select * from contacts;
--
create table blogs(
id varchar(36) primary key,
title varchar(255) not null,
image varchar(200) not null,
content varchar(200),
status bit default 1
);
drop table blogs;

create table abouts(
id varchar(36) primary key,
title varchar(255) not null,
image varchar(200) not null,
content varchar(200),
status bit default 1
);
drop table abouts;

create table categorys(
id varchar(36) primary key,
name varchar(255) not null,
keyword varchar(50) not null,
description nvarchar(1000),
description nvarchar(1000),
status bit default 1
);
drop table categorys;

create table customers(
id varchar(36) primary key,
name varchar(255) not null,
address varchar(200) not null,
phone varchar(10) not null,
email varchar(200) not null
);
drop table customers;

create table orders(
id varchar(36) primary key,
customer_id varchar(36), foreign key (customer_id) references customers(id),
total int, check(total >= 0),
status bit default 1
);
drop table orders;
insert into orders(id, customer_id, total, status) values();

create table order_details(
id varchar(36), foreign key (id) references orders(id),
product_id varchar(36), foreign key (product_id) references products(id),
order_id varchar(36),
price float,
quantity int
);
drop table order_details;

create table products(
id varchar(36) primary key,
name varchar(255) not null,
category_id varchar(36), foreign key (category_id) references categorys(id),
image varchar(200) not null,
list_image varchar(10) not null,
price float,
sale_price float,
description nvarchar(1000),
keyword varchar(20),
content nvarchar(5000),
status bit default 1
);
drop table products;

--
create table services(
id varchar(36) primary key,
name varchar(255) not null,
summary varchar(500) not null,
content nvarchar(1000),
image varchar(200),
order_by varchar(255),
status bit default 1
);
drop table services;

create table users(
id varchar(36) primary key
);
drop table users;

create table books(
id varchar(36) primary key,
user_id varchar(36), foreign key (user_id) references users(id),
service_id varchar(36), foreign key (service_id) references services(id),
name varchar(255) not null,
phone int(10) not null,
date date
);
drop table books;

create table comments(
id varchar(36) primary key,
user_id varchar(36), foreign key (user_id) references users(id),
product_id varchar(36), foreign key (product_id) references products(id),
message varchar(255),
status bit default 1
);
drop table comments;

