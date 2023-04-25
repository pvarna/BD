select starname, count(distinct studioname)
from starsin
join movie on movie.title = starsin.movietitle and movie.year = starsin.movieyear
group by starname

select moviestar.name, count(distinct movie.studioname)
from moviestar
left join starsin on starsin.starname = moviestar.name
left join movie on movie.title = starsin.movietitle and movie.year = starsin.movieyear
group by moviestar.name

select starname, count(distinct movietitle)
from starsin
where movieyear > 1990
group by starname
having count(distinct movietitle) >= 3

select model, max(price) as max_price
from pc
group by model
order by max_price
