select name
from ships
join classes on classes.class = ships.class
where displacement > 35000

select ships.name, classes.displacement, classes.numguns 
from classes
join ships on ships.class = classes.class
join outcomes on outcomes.ship = ships.name
where outcomes.battle = 'Guadalcanal'

select c1.country
from classes as c1
join classes as c2 on c1.country = c2.country
where c1.type = 'bb' and c2.type = 'bc'

select distinct o1.ship
from outcomes as o1
join battles as b1 on o1.battle = b1.name
join outcomes as o2 on o1.ship = o2.ship
join battles as b2 on o2.battle = b2.name
where b1.date < b2.date and o1.result = 'damaged'