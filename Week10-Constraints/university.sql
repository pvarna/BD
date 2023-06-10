create database university

go
use university
go

create table Student (
	fn int primary key check (fn >= 0 and fn <= 99999),
	name varchar(100) not null,
	egn char(10) unique not null,
	email varchar(100) unique not null,
	birthdate date not null,
	date_accepted_in_uni date not null,
	constraint at_least_18_yrs check(datediff(year, birthdate, date_accepted_in_uni) >= 18),
	constraint valid_email check(email like '%_@%_.%_')
)

create table Course (
	id int primary key,
	name varchar(100) not null
)

create table Student_Course (
	fn_student int references Student(fn),
	id_course int references Course(id) on delete cascade,
	primary key (fn_student, id_course)
)

insert into Student
values(81888, 'Ivan Ivanov', '9001012222', 'ivan@gmail.com', '1990-01-01', '2009-01-10');


insert into Course(id, name) values(1, 'DB');
insert into Course(id, name) values(2, 'OOP');
insert into Course(id, name) values(3, 'Android');
insert into Course(id, name) values(4, 'iOS');
select * from Course;

insert into Student_Course values(81888, 2);
insert into Student_Course values(81888, 3);
insert into Student_Course values(81888, 4);
select * from Student_Course;

delete from Course
where name = 'iOS';

select * from Student_Course;

use master
drop database university