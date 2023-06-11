
--zad1

create view british_ships_info
as
	select ships.class, type, numguns, bore, displacement, launched
	from ships
	join classes on classes.class = ships.class
	where country = 'Gt.Britain'

--zad2

select numguns, displacement 
from british_ships_info
where type = 'bb' and launched < 1919

--zad3

select numguns, displacement
from ships
join classes on classes.class = ships.class
where country = 'Gt.Britain' and type = 'bb' and launched < 1919

--zad4

SELECT c1.country, avg(c1.displacement) AS average_displacement
FROM classes c1
WHERE c1.bore = (
  SELECT max(c2.bore)
  FROM classes c2
  WHERE c2.country = c1.country
)
GROUP BY c1.country

--zad5

create view ships_sunk
as
	select battle, ship
	from outcomes
	where result = 'sunk'

--zad6

insert into ships_sunk (battle, ship)
values ('Guadalcanal', 'California')

--zad7

create view classes_with_at_least_9_numguns
as
	select *
	from classes
	where numguns >= 9
	with check option

select * from classes_with_at_least_9_numguns

update classes_with_at_least_9_numguns
set numguns = 5
where class = 'Iowa'

--zad8

drop view classes_with_at_least_9_numguns

create view classes_with_at_least_9_numguns
as
	select *
	from classes
	where numguns >= 9