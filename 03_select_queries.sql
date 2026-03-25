-- Название и продолжительность самого длительного трека
SELECT title, duration FROM Tracks
ORDER BY duration DESC
LIMIT 1;

-- Название треков, продолжительность которых не менее 3,5 минут
SELECT title, duration FROM Tracks
WHERE duration >= 210;

-- Названия сборников, вышедших в период с 2018 по 2020 год включительно
SELECT title, release_year FROM Collections
WHERE release_year BETWEEN 2018 AND 2020;

-- Исполнители, чьё имя состоит из одного слова
SELECT name FROM Artists
WHERE name NOT LIKE '% %';

-- Название треков, которые содержат слово «мой» или «my»
SELECT title FROM Tracks 
WHERE title ILIKE '%my%' OR title ILIKE '%мой%';

-- Количество исполнителей в каждом жанре
SELECT g.name AS genre, COUNT(ag.artist_id) AS artist_count FROM Genres g
JOIN Artist_Genres ag ON g.genre_id = ag.genre_id
GROUP BY g.name;

-- Количество треков, вошедших в альбомы 2019–2020 годов
SELECT COUNT(t.track_id) AS track_count FROM Tracks t
JOIN Albums a ON t.album_id = a.album_id
WHERE a.release_year BETWEEN 2019 AND 2020;

-- Средняя продолжительность треков по каждому альбому
SELECT a.title AS album, AVG(t.duration) AS avg_duration FROM Albums a
JOIN tracks t ON t.album_id = a.album_id 
GROUP BY a.title;


-- Все исполнители, которые не выпустили альбомы в 2020 году
SELECT DISTINCT ar.name FROM Artists ar
LEFT JOIN Artist_Albums aa ON ar.artist_id = aa.artist_id
LEFT JOIN Albums al ON aa.album_id = al.album_id
GROUP BY ar.name
HAVING SUM(CASE WHEN al.release_year = 2020 THEN 1 ELSE 0 END) = 0;

-- Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами)
SELECT DISTINCT c.title FROM Collections c 
JOIN Collection_tracks ct ON c.collection_id = ct.collection_id
JOIN Tracks t ON ct.track_id = t.track_id
JOIN Artist_albums aa ON t.album_id = aa.album_id 
JOIN Artists ar ON aa.artist_id = ar.artist_id
WHERE ar.name = 'BLACKPINK';

-- Названия альбомов, в которых присутствуют исполнители более чем одного жанра
SELECT al.title FROM Albums al
JOIN Artist_Albums aa ON al.album_id = aa.album_id
JOIN Artist_Genres ag ON aa.artist_id = ag.artist_id
GROUP BY al.title
HAVING COUNT(DISTINCT ag.genre_id) > 1;

-- Наименования треков, которые не входят в сборники
SELECT t.title FROM Tracks t
LEFT JOIN Collection_Tracks ct ON t.track_id = ct.track_id
WHERE ct.collection_id IS NULL;

-- Исполнитель или исполнители, написавшие самый короткий по продолжительности трек, — теоретически таких треков может быть несколько
SELECT DISTINCT ar.name FROM Artists ar
JOIN Artist_Albums aa ON ar.artist_id = aa.artist_id
JOIN Tracks t ON aa.album_id = t.album_id
WHERE t.duration = (SELECT MIN(duration) FROM Tracks);

-- Названия альбомов, содержащих наименьшее количество треков
SELECT al.title FROM Albums al
JOIN Tracks t ON al.album_id = t.album_id
GROUP BY al.title
HAVING COUNT(t.track_id) = (
    SELECT MIN(track_count)
    FROM (
        SELECT album_id, COUNT(track_id) AS track_count
        FROM Tracks
        GROUP BY album_id
    ) AS sub
);
