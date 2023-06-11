--use movies

--zad1

create view actresses_names_birtddays
as
	select name, birthdate
	from moviestar
	where gender = 'F'

--zad2

create view actors_movies_count
as
	select starname, count(movietitle + ' ' + cast(movieyear as varchar)) as number_of_different_pairs
	from starsin
	group by starname