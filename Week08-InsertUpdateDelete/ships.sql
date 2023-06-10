use ships

--zad1

insert into classes (class, type, country, numguns, bore, displacement)
values ('Nelson', 'bb', 'Gt.Britain', 9, 16, 34000)

insert into ships (name, class, launched)
values ('Nelson', 'Nelson', 1927)

insert into ships (name, class, launched)
values ('Rodney', 'Nelson', 1927)

--zad2

delete
from ships
where name in
(
select distinct ship
from outcomes
where result = 'sunk'
)

--zad3

update classes
set bore = bore * 2.54, displacement = displacement / 1.1

--zad4

delete
from classes
where class not in
(
	select class
	from ships
	group by class
	having count(*) >= 3
)

--zad5

update classes
set bore = (select bore from classes where class = 'Bismarck'), displacement = (select displacement from classes where class = 'Bismarck')
where class = 'Iowa'