--select distinct maker
--from product
--where model in 
--(
--	select model
--	from pc
--	where speed >= 500
--)

--select *
--from laptop
--where speed < all 
--(
--	select speed
--	from pc
--)

--select AllProductsPrices.price
--from 
--(
--select model, price
--from laptop

--union

--select model, price
--from pc

--union

--select model, price
--from printer
--) as AllProductsPrices
--where AllProductsPrices.price >= all
--(
--select price
--from laptop

--union

--select price
--from pc

--union

--select price
--from printer
--)

--select distinct maker
--from product
--where model in 
--(
--	select model
--	from printer
--	where price <= all 
--	(
--		select price
--		from printer
--		where color = 'y'
--	)
--)

select maker
from product
where model in
(
	select model
	from pc
	where ram <= all 
	(
		select ram
		from pc
	)
	and speed >= all
	(
		select speed
		from pc
		where ram <= all (select ram from pc)
	)
)