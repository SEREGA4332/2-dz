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
where name like '%мой%' or name like '%my%';

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
SELECT performer.name 
FROM performer
LEFT JOIN (
  SELECT DISTINCT pa.performer_id 
  FROM performer_album pa 
  JOIN album a ON pa.album_id = a.album_id 
  WHERE EXTRACT(YEAR FROM a.release_date) = 2020
) as SQ ON performer.performer_id = SQ.performer_id
WHERE SQ.performer_id IS NULL;

--Названия сборников, в которых присутствует конкретный исполнитель (Кровосток).
select collection.name from collection
join track_collection tc on tc.collection_id = collection.collection_id 
join track on tc.track_id = track.track_id 
join album a on a.album_id = track.album 
join performer_album pa on pa.album_id = a.album_id 
join performer p on p.performer_id = pa.performer_id 
where p."name" = 'Кровосток'
group by collection.name;
