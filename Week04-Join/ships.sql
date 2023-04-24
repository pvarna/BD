select ships.name, classes.country, classes.numguns, ships.launched
from ships
join classes on classes.class = ships.class

select distinct outcomes.ship
from outcomes
join battles on battles.name = outcomes.battle
where year(battles.date) = '1942'