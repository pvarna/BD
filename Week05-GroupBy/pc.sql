select avg(speed) as average_speed
from pc

select product.maker, avg(screen) as average_screen
from laptop
join product on product.model = laptop.model
group by product.maker

select avg(speed) as average_speed
from laptop
where price > 1000

select avg(price) as average_price
from pc
join product on product.model = pc.model
where maker = 'A'


select avg(average_price) as result
from
(
select avg(price) as average_price
from pc
join product on product.model = pc.model
where maker = 'B'

union

select avg(price) as average_price
from laptop
join product on product.model = laptop.model
where maker = 'B'
) prices

select speed, avg(price) as average_price
from pc
group by speed

select maker
from product
where type = 'PC'
group by maker
having count(model) >= 3

select distinct maker
from product
join pc on pc.model = product.model
where pc.price = 
(
select max(price)
from pc
)

select speed, avg(price)
from pc
where speed > 800
group by speed

select avg(hd)
from pc
join product on product.model = pc.model
where maker in
(
select maker
from product
where type = 'Printer'
)

select screen, max(price) - min(price) as diff
from laptop
group by screen