create database retaildb;
use retaildb;

-- product table --
create table product(
id int primary key auto_increment,
name varchar(50) not null,
price decimal(10,2) not null,
check (price > 0),
stock int not null,
check(stock>=0)
);
insert into product(name,price,stock) values ('laptop',1200.00,50),
											  ('smarttv',300.00,45),
                                              ('mobile',450.00,30),
                                              ('computer',500.00,64),
                                              ('keyboard',200.00,50);
select * from product;

--   Suppliers Table --
create table suppliers(
id int primary key auto_increment,
name varchar(50) not null,
contact varchar(50)
);
insert into suppliers(name,contact) values('teach supply','teach@gmail.com'),
                                          ('gadget world','gadget@gmail.com'),
                                          ('poorvika','poorvika@gmail.com'),
                                          ('sangeetha','sangeetha@gmail.com'),
                                          ('KeyComp Co.', 'keycomp@example.com');
select * from suppliers;

--  Sales Table --
create table sales(
id int primary key auto_increment,
product_id int,
foreign key (product_id) references product(id),
date date not null,
quantity int  not null,
check (quantity>0),
total_price decimal(10,2) not null
);
insert into sales(product_id,date,quantity,total_price) values(1, '2024-11-01', 5, 6000.00),
                                                              (2, '2024-11-02', 10, 8000.00),
                                                              (3, '2024-11-03', 15, 2250.00),
                                                              (4, '2024-11-04', 20, 1600.00),
                                                              (5, '2024-11-05', 30, 1200.00),
                                                              (1, '2024-11-06', 2, 2400.00),
                                                              (3, '2024-11-07', 10, 1500.00),
                                                              (2, '2024-11-08', 3, 2400.00);
select* from sales;

--   Queries --

select * from product; -- List all products

select * from product where stock <50; -- Show products with stock less than 50

select p.name as product_name,   -- List sales with product names and total prices
       s.total_price as total
from sales s
join product p on s.product_id=p.id;








     
