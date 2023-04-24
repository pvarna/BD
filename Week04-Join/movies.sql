select movie.title, movie.year, studio.name, studio.address
from movie
join studio on studio.name = movie.studioname
where movie.length > 120

select distinct studioname, starname
from movie
join starsin on starsin.movietitle = movie.title and starsin.movieyear = movie.year
order by studioname

select distinct name
from movieexec
join movie on movie.producerc# = movieexec.cert#
join starsin on starsin.movietitle = movie.title and starsin.movieyear = movie.year
where starname = 'Harrison Ford'

select distinct name
from moviestar
join starsin on starsin.starname = moviestar.name
join movie on starsin.movietitle = movie.title and starsin.movieyear = movie.year
where studioname = 'MGM'

select distinct movieexec.name, movie.title
from movieexec
join movie on movie.producerc# = movieexec.cert#
where movie.producerc# = 
(
select distinct producerc#
from movie
where movie.title = 'Star Wars'
)

select moviestar.name
from moviestar
where moviestar.name not in
(
select starname
from starsin
)