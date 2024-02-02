--Имена групп/исполнителей
insert into artists(nickname)
values ('Red Hot Chili Peppers');

insert into artists(nickname)
values ('The Frames');

insert into artists(nickname)
values ('Damien Jurado');

insert into artists(nickname)
values ('Radiohead');

--Название жанров
insert into genres (name)
values ('New Metal');

insert into genres (name)
values ('Jazz');

insert into genres (name)
values ('Rock');

--Название альбомов
insert into albums (name, release_date)
values('By the Way', '2002.07.09');

insert into albums (name, release_date)
values('Dance the Devil', '1999.06.25');

insert into albums (name, release_date)
values('Ok Computer', '1997.05.21');

--Название треков
insert into tracks (name, duration, albums_id)
values('Cant Stop', 4, 1);

insert into tracks (name, duration, albums_id)
values('Midnight', 5, 1);

insert into tracks (name, duration, albums_id)
values('Seven Day Mile', 4, 2);

insert into tracks (name, duration, albums_id)
values('Rent Day Blues', 4, 2);

insert into tracks (name, duration, albums_id)
values('No Surprises', 4, 3);

insert into tracks (name, duration, albums_id)
values('Lucky', 4, 3);

--Название коллекций
insert into collections (name, release_date)
values('Random Collection of RHCP', '2004.06.21');

insert into collections (name, release_date)
values('Random Collection of Radiohead', '2005.07.22');

insert into collections (name, release_date)
values('Random Collection of The Frames', '2000.04.12');

insert into collections (name, release_date)
values('Random Collection of Damien Jurado', '2001.02.01'
