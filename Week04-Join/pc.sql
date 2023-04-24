select product.model, pc.price
from product
left join pc on pc.model = product.model

select product.*
from product
left join pc on pc.model = product.model
where pc.price is NULL

union

select product.*
from product
left join laptop on laptop.model = product.model
where laptop.price is NULL

union

select product.*
from product
left join printer on printer.model = product.model
where printer.price is NULL
