insert into Genre(genre_name) values 
('Pop'),
('Roc'), 
('Dance music'),
('jazz'),
('Acustic');


insert into Singer(name) values 
('Sara Clark'),
('Celestial Realms'),
('Astral Perfection'),
('D'),
('Zara Larsson'),
('Drake'),
('Walk the moon'),
('Pink');

insert into genres_singers(singer_id, genre_id) values 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 1),
(7, 2),
(8, 3);


insert into Album(album_name, year_of_release) values 
('Finding Calm', 2018), 
('Opening to Life', 2018),
('Guided Meditations', 2018),
('Funhouse', 2019),
('I;m not Dead', 2019), 
('Only honest on the weekend', 2020),
('Bladverk Band', 2020), 
('Glory Days', 2020);

insert into albums_singers(singer_id, album_id) values 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8);


insert into track(album_id, track_name, duration) values 
(1, 'Wanna Be Your Baby', 90), 
(2, 'Never Gonna Die', 120), 
(3, 'Uncover', 180),
(4, 'Carry You Home', 185), 
(5, 'She s Not Me', 190),
(6, 'Rooftoop', 200),
(7, 'Hello', 205), 
(8, 'Send My Love', 90),
(1, 'I miss you', 110),
(2, 'When we were young', 146), 
(3, 'Remedy', 150),
(4, 'Water under the bridge', 195),
(5, 'River lea', 135), 
(6, 'Love in the dark', 190), 
(7, 'Million years ago', 250);

insert into collection (collection_name, year_of_release) values 
('Singing for strangers', 2018), 
('Angele', 2018),
('Jimy-EP', 2018),
('Renaissance', 2019), 
('Louise Verneuil', 2019),
('Deja Venise', 2020), 
('Filme moi', 2020),
('Retiens mon desir', 2020);

insert into track_collection (track_id, collection_id) values 
(1, 7),
(2, 8),
(3, 5),
(4, 6),
(5, 3),
(6, 2),
(7, 1),
(8, 4);
