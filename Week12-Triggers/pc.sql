--zad1

create trigger t
on laptop
after delete
as 
	insert into pc (code, model, speed, ram, hd, cd, price)
	select code + 100, '1121', speed, ram, hd, '52x', price
	from deleted
	where model in (select model from product where maker = 'D')

--zad2

create trigger t
on pc
after update
as
	if exists 
	(
		select * 
		from pc as p 
		where exists 
		(
			select * 
			from pc 
			where price < p.price and speed = p.speed
		) and code in 
		(
		select i.code 
		from deleted d 
		join inserted i on d.code = i.code 
		where d.price != i.price
		)
	)
	begin
		raiserror('Error: ...', 16, 10)
		rollback
	end;

--zad3

create trigger t
on product
after insert, update
as
	if exists
	(
		select *
		from product as p1
		join product as p2 on p1.maker = p2.maker
		where p1.type = 'PC' and p2.type = 'Printer'
	)
	begin
	raiserror('Error', 16, 10)
	rollback
	end

--zad4

create trigger t
on product
after insert, update
as
	if not exists
	(
		select *
		from product as p1
		join product as p2 on p1.maker = p2.maker
		where p1.type = 'PC' and p2.type = 'Laptop' and
		(select speed from pc where model = p1.model) <= (select speed from laptop where model = p2.model)
	)
	begin
	raiserror('Error', 16, 10)
	rollback
	end

--zad5

create trigger t
on laptop
after update
as
	if exists
	(
		select maker, avg(price)
		from laptop
		join product on product.model = laptop.model
		group by maker
		having avg(price) < 2000
	)
	begin
		raiserror('Error', 16, 10)
		rollback
	end

--zad6

create trigger t
on laptop
after insert, update
as
	if exists 
	(
		select *
		from laptop
		join product on product.model = laptop.model
		join pc on pc.model = product.model
		where laptop.ram > pc.ram and laptop.price <= pc.price
	)
	begin
	raiserror('Error', 16, 10)
	rollback
	end

--zad7

create trigger t
on printer
instead of insert
as
	insert into printer
	select *
	from inserted
	where not (type = 'Matrix' and color = 'y')