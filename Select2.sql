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
SELECT singername FROM singer m 
WHERE singername NOT LIKE '% %';

-- название треков, которые содержат слово «мой» или «my»
SELECT nametrack
FROM track
where LOWER(nametrack) like '%my%';
