--select count(*)
--from classes

--select name, avg(numguns)
--from classes
--join ships on ships.class = classes.class
--group by name

--select class, min(launched) as m1, max(launched) as m2
--from ships
--group by class

--select class, count(*)
--from ships
--join outcomes on outcomes.ship = ships.name
--where outcomes.result = 'sunk'
--group by class

--select class, count(name)
--from ships
--join outcomes on outcomes.ship = ships.name
--where outcomes.result = 'sunk' and class in
--(
--select class
--from ships
--group by class
--having count(*) > 4
--)
--group by class

select country, avg(displacement) as avg_dis
from classes
group by country