insert into genre (name)
values ('Rock'), ('Hip-Hop'), ('Indie');

insert into performer (name)
values ('Pink Floyd'), ('Linkin Park'), ('Eminem'), ('Кровосток'), ('Radiohead'), ('Alt-J');

insert into genre_performer 
values ('1','1'), ('1','2'), ('2','3'), ('2','4'), ('3','5'), ('3','6');

insert into album (name, release_date)
values 
    ('The Dark Side of the Moon','1973-03-01'),
    ('Meteora','2003-03-25'),
    ('Infinite','1996-11-12'),
    ('Студень','2012-03-24'),
    ('OK Computer','1997-05-21'),
    ('This Is All Yours','2014-09-22');
    
insert into performer_album 
values ('1','1'), ('2','2'), ('3','3'), ('4','4'), ('5','5'), ('6','6');

insert into track (name, duration, album)
values
    ('On the Run', '00:02:25.0000000', '1'),
    ('Time', '00:07:05.0000000', '1'),
    ('Foreword', '00:00:13.0000000', '2'),
    ('Faint', '00:02:42.0000000', '2'),
    ('Infinite', '00:04:41.0000000', '3'),
    ('313', '00:04:11.0000000', '3'),
    ('Память', '00:02:59.0000000', '4'),
    ('Пора домой', '00:01:46.0000000', '4'),
    ('Let Down', '00:04:59.0000000', '5'),
    ('Airbag', '00:04:44.0000000', '5'),
    ('Intro', '00:04:38.0000000', '6'),
    ('Nara', '00:04:56.0000000', '6');

insert into collection (name, release_date)
values
    ('British Rock', '2000-03-01'),
    ('Russian Music', '2020-06-11'),
    ('Hip-Hop Music', '2011-05-06'),
    ('Little-known Performers', '2019-09-20');

insert into track_collection 
values
    ('1','1'),
    ('2','1'),
    ('9','1'),
    ('10','1'),
    ('7','2'),
    ('8','2'),
    ('5','3'),
    ('6','3'),
    ('7','3'),
    ('8','3'),
    ('7','4'),
    ('8','4'),
    ('11','4'),
    ('12','4');
    
