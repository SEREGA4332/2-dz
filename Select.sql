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
