select battle, count(*)
from outcomes
join ships on ships.name = outcomes.ship
join classes on classes.class = ships.class
where numguns < 9
group by battle
having count(*) > 3 and sum
(
case result
when 'ok' then 1
else 0
end
) >= 2