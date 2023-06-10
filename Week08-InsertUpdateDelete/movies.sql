use movies

--zad1

insert into moviestar (name, gender, birthdate)
values ('Nicole Kidman', 'F', '1967-06-20')

--zad2

delete from movieexec
where networth < 10000000

--zad3

delete from moviestar
where address is NULL

--zad4

update movieexec
set name = 'Pres.' + name
where cert# in 
(
	select presc# from studio
)