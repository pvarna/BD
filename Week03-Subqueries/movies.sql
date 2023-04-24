select name
from moviestar
where gender = 'F' and name in 
	(
		select name
		from movieexec
		where networth > 10000000
	)

select name
from moviestar
where name not in 
	(
		select name
		from movieexec
	)