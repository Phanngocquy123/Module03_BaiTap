create database pay;
use pay;

create table customers(
customer_id int primary key,
customer_name varchar(30) not null,
address varchar(150) not null,
email varchar(30) unique not null
);
drop table customers;
insert into customers(customer_id, customer_name, address, email) values 
(1, 'Nguyen A1', 'HN', 'nguyena1@gmail.com'),
(2, 'Nguyen B2', 'HN', 'nguyenb2@gmail.com'),
(3, 'Nguyen C3', 'HN', 'nguyenc3@gmail.com'),
(4, 'Nguyen D4', 'HN', 'nguyend4@gmail.com'),
(5, 'Nguyen E5', 'HN', 'nguyene5@gmail.com')
; 

-- SELECT
  -- FORMAT(GETDATE(),'yyyy/MM/dd') AS 'yyyy/MM/dd';

  
create table orders(
order_id int primary key,
customer_id int, foreign key (customer_id) references customers(customer_id),
order_date date,

total_amount decimal
);
drop table orders;
insert into orders(order_id, customer_id, order_date, total_amount) values 
(1, 2, 2024/02/28, 5),
(2, 1, 2024/04/28, 6),
(3, 2, 2024/05/28, 2),
(4, 4, 2024/06/28, 1),
(5, 5, 2024/07/28, 8),
(6, 1, 2024/08/28, 5),
(7, 3, 2024/09/28, 2),
(8, 2, 2024/10/28, 5)
;

create table categories(
category_id int primary key,
category_name varchar(30)
);
drop table categories;
insert into categories(category_id, category_name) values 
(1, 'iphone'),
(2, 'laptop'),
(3, 'screen'),
(4, 'speaker'),
(5, 'printer'),
(6, 'scanner'),
(7, 'photocopier'),
(8, 'CD player'),
(9, 'tablet'),
(10, 'fax machine')
;

create table products(
product_id int primary key,
product_name varchar(30) not null,
category_id int, foreign key (category_id) references categories (category_id),
price decimal
);
insert into products (product_id, product_name,category_id,price ) values 
(1, 'iphone A', 1,30 ),
(2, 'iphone B', 1, 40),
(3, 'speaker D ',4 , 50),
(4, 'tablet E',9 , 10),
(5, 'scanner F',6 , 20),
(6, 'speraker R',4 , 30),
(7, 'iphone G',1 , 100),
(8, 'CD player N', 8, 50),
(9, 'screen H',3 , 30),
(10, 'screen M', 3, 10)
;

create table ordersDetails(
order_detail_id int primary key,
order_id int, foreign key (order_id) references orders (order_id),
product_id int, foreign key (product_id) references products (product_id),
quantity int,
unit_price decimal,
status bit default 1
);
drop table ordersDetails;
insert into ordersDetails(order_detail_id, order_id, product_id, quantity ,unit_price, status) values 
(1, 2, 3, 40, 1),
(2, 1, 4, 40, 1),
(3, 2, 5, 40, 1),
(4, 4, 3, 40, 1),
(5, 3, 1, 40, 1),
(6, 1, 1, 40, 1),
(7, 5, 3, 40, 1),
(8, 8, 3, 40, 1),
(9, 1, 6, 40, 1)
;

create table shippingDetails(
customer_id int, foreign key (customer_id) references customers (customer_id),
order_id int, foreign key (order_id) references orders (order_id),
shipping_date date
);
drop table shippingDetails;
-- insert into shippingDetails(customer_id, order_id,shipping_date) values 
-- (1, 2,),
-- (1, 6,),
-- (2, 1,),
-- (2, 3,),
-- (2, 8,),
-- (3, 7,),
-- (4, 4,),
-- (5, 5,)
-- ;