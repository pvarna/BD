use movies

--alter table movie
--add constraint movies_length unique(length)

alter table movie
add constraint movies_length_studio unique(studioname, length)

alter table movie
drop constraint movies_length_studio
