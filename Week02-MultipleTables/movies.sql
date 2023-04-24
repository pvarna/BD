select name
from starsin
join moviestar on starname = name
where movietitle = 'Terms of Endearment' and gender = 'F'

select starname
from starsin
join movie on movietitle = title and movieyear = year
where movieyear = 1995 and studioname = 'MGM'