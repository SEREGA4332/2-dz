--Название и продолжительность самого длительного трека.
SELECT TrackName, Length FROM Tracks
WHERE Length = (SELECT MAX(Length) FROM Tracks);

--Название треков, продолжительность которых не менее 3,5 минут.
SELECT TrackName FROM Tracks
WHERE Length >= 3.5;

--Названия сборников, вышедших в период с 2018 по 2020 год включительно.
SELECT AlbumName FROM Albums
WHERE ReleaseYear BETWEEN 2018 AND 2020;

--Исполнители, чьё имя состоит из одного слова.
SELECT ArtistName FROM Artists
WHERE ArtistName NOT LIKE '% %';

--Название треков, которые содержат слово «мой» или «my».
SELECT TrackName FROM Tracks
WHERE TrackName LIKE '%мой%' 
OR TrackName LIKE '%my%';

-- количество исполнителей в каждом жанре
SELECT name, COUNT(genre_performer.genre_id) AS num_artists FROM artists
GROUP BY name;
  
--Количество треков, вошедших в альбомы 2019–2020 годов
SELECT COUNT(track.track_id) AS num_tracks FROM tracks
WHERE release_year BETWEEN 2019 AND 2020;

--Средняя продолжительность треков по каждому альбому.
SELECT album_id, AVG(duration) AS avg_duration FROM tracks
GROUP BY album_id;

--Все исполнители, которые не выпустили альбомы в 2020 году.
SELECT artist_name FROM artists
WHERE artist_id NOT IN (
SELECT artist_id FROM albums
WHERE release_year = 2020);

--Названия сборников, в которых присутствует конкретный исполнитель (Кровосток).
SELECT collection_name FROM collections
WHERE artist_id = (SELECT artist_id FROM artists WHERE artist_name = 'Кровосток');
