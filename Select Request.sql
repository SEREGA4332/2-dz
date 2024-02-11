-- 1Количество исполнителей в каждом жанре

SELECT genre.genre_name, COUNT(name) singer_amount
FROM singer
JOIN genres_singers  ON genres_singers.singer_id=singer.singer_id
JOIN genre ON genre.genre_id=genres_singers.genre_id
GROUP BY genre_name
ORDER BY singer_amount DESC;

--2Количество треков, вошедших в альбомы 2019–2020 годов.

SELECT COUNT(track_id) FROM track t
JOIN album a ON t.album_id = a.album_id
WHERE year_of_release BETWEEN 2019 AND 2020;

--3 Средняя продолжительность треков по каждому альбому.

SELECT album_name, AVG(duration) FROM album, track
WHERE track.album_id=album.album_id
GROUP BY album_name;

--4 Все исполнители, которые не выпустили альбомы в 2020 году

SELECT s.name FROM Singer s
WHERE singer_id NOT IN(SELECT singer_id 
FROM albums_singers als
JOIN album a  ON a.album_id = als.album_id
WHERE year_of_release=2020);

--5 Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами)

SELECT c.collection_name FROM collection c
JOIN track_collection tc ON tc.collection_id=c.collection_id
JOIN track t ON t.track_id=tc.track_id 
JOIN album a ON a.album_id=t.album_id
JOIN albums_singers als ON als.album_id=a.album_id
JOIN singer s ON s.singer_id=als.singer_id
WHERE s.name = 'Balalayka';

--6 Названия альбомов, в которых присутствуют исполнители более чем одного жанра

SELECT DISTINCT a.album_name 
FROM album a
JOIN albums_singers als ON als.album_id=a.album_id
JOIN genres_singers gs ON gs.singer_id=als.singer_id
GROUP BY a.album_id, gs.singer_id 
HAVING COUNT(gs.genre_id)>1;

--7 Наименования треков, которые не входят в сборники

SELECT t.track_name FROM track t
LEFT JOIN track_collection tc ON tc.track_id=t.track_id
WHERE tc.track_id IS NULL;

--8 Исполнитель или исполнители, написавшие самый короткий по продолжительности трек, — теоретически таких треков может быть несколько
SELECT s.name FROM singer s
JOIN albums_singers als ON als.singer_id=s.singer_id
JOIN album a ON a.album_id=als.album_id
JOIN track t ON t.album_id = a.album_id
WHERE duration = (SELECT MIN(duration) FROM track);

--9 Названия альбомов, содержащих наименьшее количество треков.

SELECT album_name 
FROM album a 
JOIN track t ON t.album_id = a.album_id
GROUP BY a.album_id
HAVING COUNT(track_name) = (
	SELECT COUNT(track_id) 
	FROM track
	GROUP BY album_id
	ORDER BY 1
	LIMIT 1
	);
