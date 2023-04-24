select maker, speed
from laptop
join product on laptop.model = product.model
where hd > 9

(select product.model, laptop.price
from product
join laptop on product.model = laptop.model 
where maker = 'B')

union

(select product.model, printer.price
from product
join printer on product.model = printer.model 
where maker = 'B')

union

(select product.model, pc.price
from product
join pc on product.model = pc.model 
where maker = 'B')

order by price desc

select distinct pc1.hd
from pc as pc1
join pc as pc2 on pc1.hd = pc2.hd and pc1.code != pc2.code

select distinct pc1.model, pc2.model
from pc as pc1
join pc as pc2 on pc1.speed = pc1.speed and pc1.ram = pc2.ram
where pc1.model < pc2.model

select distinct p1.maker
from product as p1, pc
join product as p2 on p2.model = pc.model
where pc.speed >= 500
