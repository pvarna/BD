
--zad1

create view products_basic_info
as
	select code, model, price
	from laptop
	union all
	select code, model, price
	from pc
	union all
	select code, model, price
	from printer;

--zad2

alter view products_basic_info
as
	select code, model, price, 'Laptop' as type
	from laptop
	union all
	select code, model, price, 'PC' as type
	from pc
	union all
	select code, model, price, 'Printer' as type
	from printer

--zad3

alter view products_basic_info
as
	select code, model, price, 'Laptop' as type, speed
	from laptop
	union all
	select code, model, price, 'PC' as type, speed
	from pc
	union all
	select code, model, price, 'Printer' as type, NULL as speed
	from printer
	