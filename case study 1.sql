create database EmployeeManagement;
use EmployeeManagement;

-- creating department table --
create table department(
id int(5) primary key auto_increment,
name varchar(30) not null
);
insert into department(id,name) values (1,'Human Resources'),
                                       (2,'Engineering'),
                                       (3,'sales'),
                                       (4,'Marketing');
select* from department;				
-- creating employee table --
create table employees(
id int auto_increment primary key,
name varchar(50) not null,
age int(5) not null,
gender varchar(10) not null,
salary int(10) not null,
check (salary > 30000),
department_id int(5),
foreign key (department_id) references department(id)
);
insert into employees(id,name,age,gender,salary,department_id) values (1,'john',40,'male',450000,2);
insert into employees(id,name,age,gender,salary,department_id) values (2,'ram',30,'male',40000,3),
                                                                     (3,'priya',35,'female',420000,4),
                                                                     (4,'may',29,'female',43000,1),
                                                                     (5,'siva',31,'male',480000,1);
select* from employees;

-- creating project table --
create table project(
id int(5) auto_increment primary key,
name varchar(50) not null,
budget int(20) not null,
check (budget >10000)
);
INSERT INTO project (id,name, budget) VALUES (1,'Project Alpha', 25000), 
                                              (2,'Project Beta', 30000),  
											  (3,'Project Gamma', 35000);
-- creating employee_project table --
create table employee_project(
employee_id int(5),
foreign key (employee_id) references employees(id),
project_id int(5),
foreign key (project_id) references project(id),
primary key(employee_id, project_id)
);
INSERT INTO Employee_Project (employee_id, project_id)VALUES (1, 1), 
                                                             (2, 2),  
                                                             (3, 3),  
                                                             (4, 1);

-- Creating Attendance Table --
create table attendance(
id int(5) auto_increment primary key,
employee_id int(5),
foreign key (employee_id) references employees(id),
date date not null,
status enum('Present', 'Absent', 'On Leave') not null
);
INSERT INTO Attendance (employee_id, date, status) VALUES (1, '2024-11-01', 'Present'),  
(1, '2024-11-02', 'Absent'),   
(2, '2024-11-01', 'On Leave'), 
(2, '2024-11-02', 'Present'),  
(3, '2024-11-01', 'Present'), 
(3, '2024-11-02', 'Absent'),   
(4, '2024-11-01', 'Present'),
(4, '2024-11-02', 'On Leave'); 

-- Retrieve --
select * from employees;

select* from employees e join department d
 on e.id=d.id
 where d.name ='sales';

SELECT * FROM Project WHERE budget > 20000;

select e.name as name,
p.name as name
from employee_project ep 
join employees e on ep.employee_id =e.id
join project p on ep.project_id = p.id;

SELECT * 
FROM Employees 
WHERE salary > 50000;

SELECT * FROM Attendance a
WHERE a.employee_id = 1;

-- Update Records --
UPDATE Employees e
JOIN Department d ON e.department_id = d.id
SET e.salary = e.salary * 1.10
WHERE d.name = 'Human Resources';

UPDATE Employees
SET department_id = 2  
WHERE id = 2;

-- Delete Records --
delete from attendance 
where status='on leave';
select * from attendance;

-- Constraints and Modifications --
alter table employees add column email varchar(30) unique;
ALTER TABLE Employees
ADD CONSTRAINT check_age CHECK (age > 18);
alter table employees alter column gender set default 'unknown';










