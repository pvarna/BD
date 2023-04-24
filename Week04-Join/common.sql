--select ships.name, ships.launched
--from ships 
--join classes on classes.class= ships.class
--where ships.name = ships.class

use pc

--select *
--from movie
--where title like '%Star%Trek%' or title like '%Trek%Star%'

--select *
--from starsin
--join moviestar on moviestar.name = starsin.starname
--where (year(moviestar.birthdate) >= 1970 and year(moviestar.birthdate) <= 1979) or (year(moviestar.birthdate) = 1980 and month(moviestar.birthdate) < 7)

--select distinct ship
--from outcomes
--where ship like 'C%' or ship like 'K%'

--select distinct country
--from classes
--join ships on ships.class = classes.class
--join outcomes on outcomes.ship = ships.name
--where result = 'sunk'

--select distinct country
--from classes
--where country not in
--(
--select distinct country
--from classes
--join ships on ships.class = classes.class
--join outcomes on outcomes.ship = ships.name
--where result = 'sunk'
--)

--select distinct class
--from ships
--where class not in
--(
--select distinct class
--from ships
--where launched > 1921
--)

--select class, country, bore * 2.54 as boreInCantimeters 
--from classes
--where numguns in (6, 8, 10)

--select distinct c1.country
--from classes as c1, classes as c2
--where c1.country = c2.country and c1.bore <> c2.bore

--select distinct country
--from classes
--where numguns >= all
--(
--select numguns
--from classes
--)

select pc.*
from pc
join product as p on pc.model = p.model
where price < all
(
select laptop.price
from laptop
join product as p1 on laptop.model = p1.model
where p.maker = p1.maker
)
and price < all
(
select printer.price
from printer
join product as p2 on printer.model = p2.model
where p.maker = p2.maker
)