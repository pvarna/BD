create database test

go
use test
go

create table Product (
	maker char(1),
	model char(4),
	type varchar(7)
)

create table Printer (
	code int,
	model char(4),
	color char(1) default 'n',
	price decimal(9, 2)
)

create table Classes (
	class varchar(50),
	type char(2)
)

insert into Printer(code, model) values(1, '1234');
insert into Printer(code, model, color) values(2, '1235', null);
select * from Printer

alter table Classes
add bore decimal(9,2)

alter table Printer
drop column price

select * from Printer

go
use master
drop database test
go
