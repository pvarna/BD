--zad1

insert into moviestar (name, address, gender, birthdate)
values ('Bruce Willis', 'somewhere', 'M', '2020-01-01')

select * from moviestar

create trigger tr1
on movie
after insert
as
	insert into starsin (movietitle, movieyear, starname)
	select title, year, 'Bruce Willis'
	from inserted
	where title like '%save%' or title like '%world%'

insert into movie
values('Armageddon, save, world', 1998, 120, 'y', 'MGM', 123);

select * from starsin

--zad2

create trigger t
on movieexec
after insert, update, delete
as 
	if ((select avg(networth) from movieexec) < 500000)
		begin
			raiserror('Error: Average networth cannot be < 500000', 16, 10);
			rollback;
		end;

--zad3

create trigger t
on movieexec
instead of delete
as
	begin
		update movie
		set producerc# = NULL
		where producerc# in (select cert# in deleted);

		delete
		from movieexec
		where cert# in (select cert# in deleted);
	end;

--zad4

create trigger t
on starsin
instead of insert
as
	begin
		insert into moviestar(name)
		select distinct starname
		from inserted
		where starname not in (select name from moviestar)

		insert into movie(title, year)
		select distinct movietitle, movieyear
		from inserted
		where not exists (select * from movie where title = movietitle and year = movieyear)

		insert into starsin
		select *
		from inserted	
	end;