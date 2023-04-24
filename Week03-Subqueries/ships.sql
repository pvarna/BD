--select distinct country
--from classes
--where numguns >= all 
--(
--select numguns
--from classes
--)

--select distinct name
--from ships
--where class in
--(
--select class
--from classes
--where bore = 16
--)

--select battle
--from outcomes
--where ship in 
--(
--select name
--from ships
--where class = 'Kongo'
--)

select name
from ships as s
join classes as c1 on s.class = c1.class
where numguns >= all
(
select numguns
from classes as c2
where c1.bore = c2.bore
)
