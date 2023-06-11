
--zad1

create trigger t
on classes
instead of insert
as
	insert into classes
	select class, type, country, numguns, bore, case when displacement > 35000 then 35000 else displacement end
	from inserted

--zad2

create view classes_ships
as
	select classes.class, count(*) as count_ships
	from classes
	left join ships on ships.class = classes.class
	group by classes.class

go

select * from classes_ships

create trigger t
on classes_ships
instead of delete
as
	begin
	delete
	from ships
	where class in (select class from deleted)

	delete
	from classes
	where class in (select class from deleted)
	end

--zad3

create trigger t
on ships
after insert, update
as
	if exists 
	(
		select class
		from ships
		group by class
		having count(*) > 2
	)
	begin
		raiserror('Error', 16, 10)
		rollback
	end

--zad4

create trigger t
on outcomes
after insert, update
as
	if exists
	(
		select *
		from outcomes as o1
		join outcomes as o2 on o1.ship != o2.ship and o1.battle = o2.battle
		where (select numguns from classes where class = (select class from ships where name = o1.ship)) > 9
		and (select numguns from classes where class = (select class from ships where name = o2.ship)) < 9
	)
	begin
		raiserror('Error', 16, 10)
		rollback
	end

--zad5

create trigger t
on outcomes
after insert, delete
as
	if exists
	(
		select *
		from outcomes as o1
		join battles as b1 on b1.name = o1.battle
		join outcomes as o2 on o1.ship = o2.ship
		join battles as b2 on b2.name = o2.battle
		where o1.result = 'sunk' and b1.date < b2.date
	)
	begin
		raiserror('Error', 16, 10)
		rollback
	end