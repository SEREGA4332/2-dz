-- Количество исполнителей в каждом жанре
select mg.NameMusgen, count(me.execut_id) from Musical_genres mg
join Musgen_Execut me on me.musgen_id = mg.id 
group by mg.namemusgen;

-- Количество треков, вошедших в альбомы 2019–2020 годов
select count(t.nametrack)  from Tracks t
join albums a on t.id = a.id
where a.yearalbum between 2019 and 2020;

-- Средняя продолжительность треков по каждому альбому
select a.namealbum, t.NameTrack, avg(t.Durarion) from Tracks t
join albums a on t.id = a.id
group by a.namealbum, t.nametrack;

-- Все исполнители, которые не выпустили альбомы в 2020 году
select e.NameExecut from Executors e
where e.nameexecut not in (
	select e.nameexecut from executors e
	join execut_album ea on e.id = ea.execut_id 
	join albums a on ea.execut_id  = a.id 
	where a.yearalbum = 2020
);

-- Названия сборников, в которых присутствует конкретный исполнитель
select c.NameCollect from Collections c
join track_collect tc  on c.id = tc.collect_id 
join tracks t on t.id  = tc.track_id 
join albums a on a.id = t.album_id 
join execut_album ea on ea.album_id = a.id 
join executors e on e.id  = ea.execut_id 
where e.NameExecut = 'Sara Clark';

-- Названия альбомов, в которых присутствуют исполнители более чем одного жанра
select a.NameAlbum from Albums a
join execut_album ea on a.id = ea.album_id 
join Executors e on ea.execut_id  = e.id
join musgen_execut me on e.id = me.execut_id 
group by a.NameAlbum, e.id 
having count (me.musgen_id) > 1;

-- Наименования треков, которые не входят в сборники
select t.nametrack from tracks t 
left join track_collect tc  on t.id = tc.track_id  
where tc.track_id is null;

-- Исполнитель или исполнители, написавшие самый короткий по продолжительности трек, — теоретически таких треков может быть несколько
select e.nameexecut from executors e 
left join execut_album ea on e.id = ea.execut_id 
left join albums a on ea.album_id = a.id 
left join tracks t on a.id  = t.album_id 
where t.durarion = (
	select min(t2.durarion) from tracks t2  
);

-- Названия альбомов, содержащих наименьшее количество треков
select a.namealbum from albums a 
join tracks t on a.id  = t.album_id 
group by a.namealbum
having count(t.id) = (
			select count(t.id) from tracks t2
			join albums a2 on t2.id = a2.id 
			group by a2.namealbum 
			order by count(t2.id)
			limit 1);
