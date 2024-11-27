create database libraryDB;
use libraryDB;

-- book table --
create table book(
id int primary key auto_increment,
title varchar(50) not null,
author varchar(50) not null,
publish_year year not null,
genre varchar(30)
);

INSERT INTO book (title, author, publish_year, genre) VALUES ('to kill a mockingbird','harper lee',1960,'fiction'), 
															 ('1984','george orwell',1949,'dystopian'),
                                                             ('the great gatsby','f scott fitzgerald',1925,'classics'), 
															 ('moby dick','herman melville',1951,'adventure'), 
                                                             ('pride and prejudice','jane austen',1913,'romance');
  select* from book;                                                           
                                                             
-- members table --
create table members(
id int primary key auto_increment,
name varchar(50) not null,
membership_date date not null
);
insert into members(name,membership_date) values('John Doe', '2023-01-15'),
                                                ('Jane Smith', '2022-11-10'),
												('Robert Brown', '2023-04-21'),
                                                ('Emily Davis', '2023-06-05'),
                                                ('Michael Johnson', '2023-08-30');
select* from members;

-- borrowing table --
create table borrowing(
id int primary key auto_increment,
book_id int, 
foreign key (book_id) references book(id),
member_id int,
foreign key(member_id) references members(id),
borrow_date date not null,
return_date date
);
insert into borrowing(book_id,member_id,borrow_date,return_date) values (31, 1, '2023-11-01', '2023-11-15'),  
																		(32, 2, '2023-10-10', '2023-10-20'),  
																		(33, 3, '2023-07-22', '2023-08-01'),  
																		(34, 4, '2023-09-05', '2023-09-12'),  
                                                                        (35, 5, '2023-11-05', NULL); 
select * from borrowing;

--  Queries --
select* from book;

select * from members;

select m.name as member_name, -- creating new column member_name
       b.title as book_title, -- creating new column book_title
       bo.borrow_date,
       bo.return_date
from borrowing bo
join members m on bo.member_id=m.id -- member_id refer from members 'id'
join book b on bo.book_id=b.id; -- book_id refer from book 'id'

select m.name as member_name,
count(bo.book_id)as books_borrowed
from members m
join borrowing bo on m.id=bo.member_id
group by m.name;




















