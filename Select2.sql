SELECT album_name, year_of_release FROM Album WHERE year_of_release = 2018;

SELECT track_name, duration FROM track ORDER BY duration DESC LIMIT 1;

SELECT track_name, duration FROM track WHERE duration >= 210;

SELECT collection_name FROM collection WHERE year_of_release >=2018 AND year_of_release <=2020;

SELECT name FROM singer WHERE name NOT LIKE '% %';

SELECT track_name FROM track WHERE track_name LIKE '%my%';
