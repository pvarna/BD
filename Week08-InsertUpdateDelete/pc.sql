use pc;

--zad1

insert into product (model, maker, type)
values ('1100', 'C', 'PC')

insert into pc (code, model, speed, ram, hd, cd, price)
values (12, '1100', 2400, 2048, 500, 52, 299)

--zad2

delete 
from pc
where model = '1100'

delete 
from product
where model = '1100'

--zad3

insert into product (model, maker, type)
select distinct model, 'Z', 'Laptop'
from pc

insert into laptop (code, model, speed, ram, hd, price, screen)
select code + 100, model, speed, ram, hd, price + 500, 15
from pc

--zad 4

delete
from laptop
where model in
(
	select model
	from product
	where type = 'Laptop' and maker not in
	(
		select maker
		from product
		where type = 'Printer'
	)
)

--zad5

update product
set maker = 'A'
where maker = 'B'

--zad6

update pc
set price = price / 2, hd = hd + 20

--zad7

update laptop
set screen = screen + 1
where model in
(
select model 
from product
where maker = 'B'
)