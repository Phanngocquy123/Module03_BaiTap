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
address nvarchar(200) not null,
message nvarchar(200),
status bit default 1
);
drop table contacts;
insert into contacts(id, email, address, message, status) values(uuid(), 'email 1', 'address 1', 'message 1', 0);
select * from contacts;
--
create table blogs(
id varchar(36) primary key,
title nvarchar(255) not null,
image varchar(200) not null,
content nvarchar(200),
status bit default 1
);
drop table blogs;

create table abouts(
id varchar(36) primary key,
title nvarchar(255) not null,
image varchar(200) not null,
content nvarchar(255),
status bit default 1
);
drop table abouts;

create table categorys(
id int primary key,
name varchar(60) not null,
keyword varchar(50) not null,
description varchar(255),
status bit default 1
);
drop table categorys;
INSERT INTO categorys (id,name, keyword, description, status) VALUES 
(1,'Electronics', 'electronics, gadgets, technology', 'Electronics and gadgets category', 1),
(2,'Clothing', 'clothing, fashion, apparel', 'Clothing and fashion category', 1),
(3,'Books', 'books, literature, reading', 'Books and literature category', 1)
;
select * from categorys;

create table customers(
id int primary key,
name varchar(60) not null,
address varchar(200) not null,
phone int(10) not null,
email nvarchar(200) not null
);
drop table customers;
insert into customers(id, name, address, phone, email) values
	(1, 'Phan Văn A', 'HN', 1234567890, 'pva@gmail.com'),
    (2, 'Phan Văn B', 'HCM', 1234567890, 'pvb@gmail.com'),
    (3, 'Phan Văn C', 'DN', 1234567890, 'pvc@gmail.com'),
    (4, 'Phan Văn D', 'CT', 1234567890, 'pvd@gmail.com'),
    (5, 'Phan Văn E', 'LA', 1234567890, 'pve@gmail.com')
    ;
select * from customers;

create table orders(
id int primary key,
customer_id int, foreign key (customer_id) references customers(id),
total int, check(total >= 0),
status bit default 1
);
drop table orders;
insert into orders(id, customer_id, total, status) values
(1,1,50, 1),
(2,3,60, 1),
(3,1,20, 1),
(4,2,10, 1)
;
select * from orders;
-- Bài tập-- 1. Hiển thị danh sách các hóa đơn bao gồm: Mã đơn hàng, Tên khách hàng, Tổng tiền, Trạng thái
select o.id, c.name as custormer_name, o.total, o.status  from orders o
inner join customers c on o.customer_id = c.id
;
-- 2. Hiển thị danh Danh sách khách hàng gồm: Mã KH, Tên KH, Tổng ĐH đã mua
select c.id as id_customer,  c.name as name_customer, count(o.id) as total_bought 
from orders o
right join customers c on o.customer_id = c.id
group by c.id,c.name
having total_bought >0
order by total_bought
;
-- 3. Hiển thị danh sách sản phẩm kèm số lượng đã bán gồm: Mã SP, Tên SP, Số lượng (đã bán)



create table order_details(
id int, foreign key (id) references orders(id),
product_id varchar(36), foreign key (product_id) references products(id),
order_id varchar(36),
price float, check(price > 0),
quantity int, check(quantity > 0)
);
drop table order_details;
insert into order_details(id, product_id, order_id, price, quantity) values();

create table products(
id varchar(2) primary key,
name varchar(60) not null,
category_id varchar(36), foreign key (category_id) references categorys(id),
image varchar(200) not null,
list_image varchar(10) not null,
price float,
sale_price float,
description varchar(1000),
keyword varchar(20),
content varchar(5000),
status bit default 1
);
drop table products;
INSERT INTO products (id, name, category_id, image, list_img, price, sale_price, description, keyword, content, status) VALUES 
('1', 'Smartphone X', 1, 'image_url', 'list_image_url', 500, 450, 'Description of Smartphone X', 'smartphone, tech', 'Product content goes here', 1),
('2', 'Laptop Y', 1, 'image_url', 'list_image_url', 800, NULL, 'Description of Laptop Y', 'laptop, tech', 'Product content goes here', 1),
('3', 'T-Shirt Z', 2, 'image_url', 'list_image_url', 20, NULL, 'Description of T-Shirt Z', 'clothing, fashion', 'Product content goes here', 1),
('4', 'Book A', 3, 'image_url', 'list_image_url', 15, NULL, 'Description of Book A', 'books, literature', 'Product content goes here', 1),
('5', 'Tablet Z', 1, 'tablet_image_url', 'tablet_list_image_url', 300, NULL, 'Description of Tablet Z', 'tablet, tech', 'Product content goes here', 1),
('6', 'Smartwatch Q', 1, 'smartwatch_image_url', 'smartwatch_list_image_url', 150, NULL, 'Description of Smartwatch Q', 'smartwatch, tech', 'Product content goes here', 1),
('7', 'Dress X', 2, 'dress_image_url', 'dress_list_image_url', 50, NULL, 'Description of Dress X', 'clothing, fashion', 'Product content goes here', 1),
('8', 'Jeans Y', 2, 'jeans_image_url', 'jeans_list_image_url', 40, NULL, 'Description of Jeans Y', 'clothing, fashion', 'Product content goes here', 1),
('9', 'Novel B', 3, 'novel_image_url', 'novel_list_image_url', 10, NULL, 'Description of Novel B', 'books, literature', 'Product content goes here', 1),
('10', 'Cookbook C', 3, 'cookbook_image_url', 'cookbook_list_image_url', 20, NULL, 'Description of Cookbook C', 'books, cooking', 'Product content goes here', 1),
('11', 'TV X', 1, 'tv_image_url', 'tv_list_image_url', 700, NULL, 'Description of TV X', 'electronics, tv', 'Product content goes here', 1),
('12', 'Headphones Y', 1, 'headphones_image_url', 'headphones_list_image_url', 100, NULL, 'Description of Headphones Y', 'electronics, headphones', 'Product content goes here', 1),
('13', 'Sweater Z', 2, 'sweater_image_url', 'sweater_list_image_url', 30, NULL, 'Description of Sweater Z', 'clothing, fashion', 'Product content goes here', 1),
('14', 'Shorts A', 2, 'shorts_image_url', 'shorts_list_image_url', 25, NULL, 'Description of Shorts A', 'clothing, fashion', 'Product content goes here', 1);
--
create table services(
id varchar(36) primary key,
name nvarchar(255) not null,
summary nvarchar(500) not null,
content nvarchar(1000),
image varchar(200),
order_by nvarchar(255),
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
name nvarchar(60) not null,
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

-- Bài tập-- 1. Hiển thị danh sách các hóa đơn bao gồm: Mã đơn hàng, Tên khách hàng, Tổng tiền, Trạng thái
-- 2. Hiển thị danh Danh sách khách hàng gồm: Mã KH, Tên KH, Tổng ĐH đã mua
-- 3. Hiển thị danh sách sản phẩm kèm số lượng đã bán gồm: Mã SP, Tên SP, Số lượng (đã bán)

