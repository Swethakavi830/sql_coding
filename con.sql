create database example;
use example;
create table emp_data(
emp_id int(5) primary key auto_increment,
ename varchar(20),
gender varchar(8) not null,
age int(3),
salary int(10),
city varchar(20) default'chennai',
aadhar int(20) unique,
check (salary>200000)
);
ALTER TABLE emp_data MODIFY gender VARCHAR(10);
insert into emp_data values(001,'sam','male',20,200010,'perungudi',90876789);
insert into emp_data values(002,'anu','female',22,203000,'velacherry',09878767);
select* from emp_data;





create table emp(
employee_id int(5) primary key auto_increment,
full_name varchar(30) not null,
gender varchar(15) default 'other',
age int,
salary int(10)
check (salary>=2000),
city varchar(20) default 'chennai'
);
ALTER TABLE emp ADD COLUMN email VARCHAR(100);
INSERT INTO emp VALUES (001, 'sam', 'male', 30, 1000, 'perungudi', 'sam@gmail.com');
select * from emp;
ALTER TABLE emp
DROP COLUMN email_id;
INSERT INTO emp (employee_id, full_name, gender, age, salary, city, email) 
VALUES (001, 'sam', 'male', 30, 1000, 'perungudi', 'sam@gmail.com');
insert into emp (employee_id, full_name, gender, age, salary, city, email) values (002,'ram','male',35,1000,'velacherry','ram@gmail.com');
insert into emp (employee_id, full_name, gender, age, salary, city, email) values (003,'anu','female',29,1000,'aadayar','anu@gmail.com');

-- task 1 --
create table task1(
full_name varchar(20),
age int, 
check (age between 18 and 65),
gender varchar(20),
salary int(10),
city varchar(20),
pan varchar(20)
);
INSERT INTO mydata (Fullname, age, gender, salary, city, Pan)
VALUES ('John Doe', 70, 'Male', 20000, 'Mumbai', 'ABCDE1234F');
INSERT INTO task1 (full_name, age, gender, salary, city, pan)
VALUES ('John Doe', 30, 'Male', 20000, 'Mumbai', 'ABCDE1234F');
select* from task1;

-- task 2--
create table task2(
full_name varchar(20),
age int(5),
gender varchar(20),
check (gender in ('male','female','others')),
salary int(10),
city varchar(20),
pan varchar(20)
);
-- INSERT INTO task2 (full_name, age, gender, salary, city, pan) VALUES ('Jane Doe', 25, 'Unknown', 25000, 'Delhi', 'FGHIJ5678K');--
INSERT INTO task2 (full_name, age, gender, salary, city, pan)
VALUES ('Jane Doe', 25, 'female', 25000, 'Delhi', 'FGHIJ5678K');
select* from task2;

-- task 3 --
create table task3(
full_name varchar(20),
age int(5),
gender varchar(10),
salary int,
check (salary>10000),
city varchar(20),
pan varchar(20)
);
-- INSERT INTO task3 (full_name, age, gender, salary, city, Pan) VALUES ('Alice Brown', 30, 'Female', 9000, 'Chennai', 'KLMNO12345');--
INSERT INTO task3 (full_name, age, gender, salary, city, Pan)
VALUES ('Alice Brown', 30, 'Female', 11000, 'Chennai', 'KLMNO12345');

-- task 4--














