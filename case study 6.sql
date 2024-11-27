create database learningdb;
use learningdb;

-- Courses Table --
create table courses(
id int primary key auto_increment,
title varchar(100) not null,
decription text
);
insert into courses(title,decription) values ('Introduction to Programming', 'Learn the basics of programming using Python.'),
											 ('Data Science 101', 'An introduction to data science concepts and techniques.'),
                                             ('Database Management Systems', 'Learn how to design and manage databases.');
select * from courses;

-- Instructors Table --
create table instructors(
id int primary key auto_increment,
name varchar(50) not null,
expertise varchar(50) not null
);
insert into instructors(name, expertise) values ('Dr. Alice Green', 'Computer Science'),
                                                ('Dr. Bob White', 'Data Science'),
                                                ('Prof. John Doe', 'Database Management');
select * from instructors;
-- students table --
create table students(
id int primary key auto_increment,
name varchar(50) not null,
email varchar(50) not null unique
);
insert into students(name,email) values ('Emily Clark', 'emily.clark@example.com'),
                                        ('Michael Harris', 'michael.harris@example.com'),
										('Sarah Johnson', 'sarah.johnson@example.com'),
                                        ('David Lee', 'david.lee@example.com');
select * from students;

--  Enrollments Table --
create table enrollments(
student_id int,
foreign key (student_id) references students(id),
courses_id int,
foreign key (courses_id) references courses(id),
enrollment_date date not null,
primary key( student_id,courses_id)
);
insert into enrollments(student_id,courses_id,enrollment_date) values (2,3,'2024-06-11'),
                                                                      (1,1,'2024-06-16'),
                                                                      (3,3,'2024-09-10'),
                                                                      (4,2,'2024-10-24');
select * from enrollments;

-- Queries --
select * from courses;

select * from instructors;

select s.name as student_name,  -- Show enrollments with student names and course titles
       c.title as courses_name,
       e.enrollment_date
from enrollments e 
join students s on e.student_id = s.id
join courses c on e.courses_id = c.id;

select c.title as course_title,  -- Count the number of students enrolled in each course.
count(e.student_id) as student_count
from enrollments e
join courses c on e.courses_id = c.id
group by c.id;



