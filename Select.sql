-- Задание 2
-- название и продолжительность самого длительного трека
SELECT nametrack, lengthtrack
FROM track
WHERE lengthtrack = (SELECT MAX(lengthtrack) FROM track);

SELECT nametrack, lengthtrack
FROM track
ORDER by lengthtrack DESC
LIMIT 1;

-- название треков, продолжительность которых не менее 3,5 минут
SELECT nametrack
FROM track
WHERE lengthtrack > 210;

-- названия сборников, вышедших в период с 2018 по 2020 год включительно
SELECT nametrack, releasealbum FROM album a
LEFT JOIN track t ON a.albumid = t.albumid
WHERE releasealbum BETWEEN 2018 AND 2020;

-- исполнители, чьё имя состоит из одного слова
SELECT namemusician FROM musician m 
WHERE namemusician NOT LIKE '% %';

-- название треков, которые содержат слово «мой» или «my»
SELECT nametrack
FROM track
where LOWER(nametrack) like '%my%';


-- Задание 3
-- количество исполнителей в каждом жанре
SELECT namegenre, COUNT(m1.namemusician) FROM musicalgenre m3
LEFT JOIN musiciansgenres m2 ON m3.genreid = m2.genreid 
LEFT JOIN musician m1 ON m2.musicianid = m1.musicianid
GROUP BY namegenre 
ORDER BY count(m1.namemusician) DESC;

-- количество треков, вошедших в альбомы 2019–2020 годов
SELECT count(nametrack) FROM track
JOIN album ON track.albumid = album.albumid
WHERE releasealbum BETWEEN 2019 AND 2020;

-- средняя продолжительность треков по каждому альбому
SELECT album.namealbum, AVG(lengthtrack) FROM track 
JOIN album ON track.albumid = album.albumid
GROUP BY namealbum 
ORDER BY AVG(lengthtrack);

-- все исполнители, которые не выпустили альбомы в 2020 году
SELECT namemusician, a.releasealbum FROM musician m1
LEFT JOIN musiciansalbums m2 ON m1.musicianid = m2.musicianid 
LEFT JOIN album a ON a.albumid = m2.albumid
WHERE namemusician IN (SELECT namemusician FROM musiciansalbums WHERE a.releasealbum NOT BETWEEN 2020 AND 2020) 
OR namemusician IN (SELECT namemusician FROM musiciansalbums WHERE a.releasealbum ISNULL);

-- названия сборников, в которых присутствует конкретный исполнитель (выберите его сами)
SELECT namecollection FROM collection c 
LEFT JOIN trackscollections tc ON c.collectionid = tc.collectionid 
LEFT JOIN track t ON t.trackid = tc.trackid 
LEFT JOIN album a ON t.albumid = a.albumid 
LEFT JOIN musiciansalbums ma ON ma.albumid = a.albumid 
LEFT JOIN musician m ON m.musicianid = ma.musicianid
WHERE LOWER(m.namemusician) LIKE 'thunder monk';


-- Задание 4
-- названия альбомов, в которых присутствуют исполнители более чем одного жанра.
--

-- наименования треков, которые не входят в сборники.
SELECT t.nametrack FROM track t
	LEFT JOIN  trackscollections tc ON t.trackid = tc.trackid
	WHERE tc.trackid ISNULL;

-- Исполнитель или исполнители, написавшие самый короткий по продолжительности трек, — теоретически таких треков может быть несколько.
SELECT m.namemusician FROM musician m
	JOIN musiciansalbums ma ON m.musicianid = ma.musicianid
	JOIN album a ON a.albumid = ma.albumid
	JOIN track t ON t.albumid = a.albumid
	WHERE lengthtrack = (SELECT MIN(lengthtrack) FROM track);

-- Названия альбомов, содержащих наименьшее количество треков.
--
--Название и продолжительность самого длительного трека.
select name, duration from track
where duration = (select max(duration) from track);

--Название треков, продолжительность которых не менее 3,5 минут.
select name from track
where duration >= '00:03:30.0000000';

--Названия сборников, вышедших в период с 2018 по 2020 год включительно.
select name from collection
where release_date >= '2018-01-01' and release_date <= '2020-12-31';

--Исполнители, чьё имя состоит из одного слова.
select name from performer
where name not like '% %';

--Название треков, которые содержат слово «мой» или «my».
select name from track
where name like '% мой %' or name like '% my %';

--Количество исполнителей в каждом жанре.
SELECT name, COUNT(genre_performer.genre_id) AS quantity FROM genre 
LEFT JOIN genre_performer ON genre_performer.genre_id = genre.genre_id
GROUP BY name;

--Количество треков, вошедших в альбомы 2019–2020 годов (для получения значимого ответа изменим дату релизов на 1996 - 1997гг)
select count(track.track_id) as quantity from track
left join album on track.album = album.album_id
where album.release_date >= '1996-01-01' and album.release_date <= '1997-12-31';

--Средняя продолжительность треков по каждому альбому.
select album.name, avg(track.duration) from album
left join track on album.album_id = track.album
group by album.name;

--Все исполнители, которые не выпустили альбомы в 2020 году.
select performer.name from performer
join performer_album pa on pa.performer_id = performer.performer_id 
join album on pa.album_id = album.album_id 
where extract(year from album.release_date) != 2020;

--Названия сборников, в которых присутствует конкретный исполнитель (Кровосток).
select collection.name from collection
join track_collection tc on tc.collection_id = collection.collection_id 
join track on tc.track_id = track.track_id 
join album a on a.album_id = track.album 
join performer_album pa on pa.album_id = a.album_id 
join performer p on p.performer_id = pa.performer_id 
where p."name" = 'Кровосток'
group by collection.name;
