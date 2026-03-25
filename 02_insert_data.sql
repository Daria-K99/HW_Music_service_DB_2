-- Добавление жанров
INSERT INTO Genres (name) VALUES
('Rock'),
('Hip-hop'),
('K-pop'),
('R&B'),
('Indie'),
('EDM');

-- Добавление артистов
INSERT INTO Artists (name) VALUES
('Linkin Park'),
('BLACKPINK'),
('Hyukoh'),
('Eminem'),
('NF'),
('Red Velvet'),
('Cardi B');

-- Добавление альбомов
INSERT INTO Albums (title, release_year) VALUES
('Minutes to Midnight', 2007),
('Meteora', 2003),
('SQUARE ONE', 2016),
('SQUARE UP', 2018),
('THE ALBUM', 2020),
('DEADLINE', 2026),
('20', 2014),
('22', 2015),
('The Eminem Show', 2002),
('Music To Be Murdered By', 2020),
('Perception', 2017),
('The Red Summer', 2019),
('The ReVe Festival: Finale', 2019);

-- Добавление треков
INSERT INTO Tracks (title, album_id, duration) VALUES 
(
    'Given Up', 
    (SELECT album_id FROM Albums WHERE title = 'Minutes to Midnight'), 
    189
),
(
    'No More Sorrow', 
    (SELECT album_id FROM Albums WHERE title = 'Minutes to Midnight'), 
    222
),
(
    'Breaking the Habit', 
    (SELECT album_id FROM Albums WHERE title = 'Meteora'), 
    196
),
(
    'Numb', 
    (SELECT album_id FROM Albums WHERE title = 'Meteora'), 
    188
),
(
    'BOOMBAYAH', 
    (SELECT album_id FROM Albums WHERE title = 'SQUARE ONE'), 
    241
),
(
    'DDU-DU DDU-DU', 
    (SELECT album_id FROM Albums WHERE title = 'SQUARE UP'), 
    209
),
(
    'Forever Young', 
    (SELECT album_id FROM Albums WHERE title = 'SQUARE UP'), 
    237
),
(
    'How You Like That',
    (SELECT album_id FROM Albums WHERE title = 'THE ALBUM'), 
    181
),
(
    'Lovesick Girls', 
    (SELECT album_id FROM Albums WHERE title = 'THE ALBUM'), 
    193
),
(
    'Me and my', 
    (SELECT album_id FROM Albums WHERE title = 'DEADLINE'), 
    172
),
(
    'Our Place', 
    (SELECT album_id FROM Albums WHERE title = '20'), 
    297
),
(
    'Wi Ing Wi Ing', 
    (SELECT album_id FROM Albums WHERE title = '20'), 
    194
),
(
    'Settled Down', 
    (SELECT album_id FROM Albums WHERE title = '22'), 
    292
),
(
    'Comes and Goes', 
    (SELECT album_id FROM Albums WHERE title = '22'), 
    228
),
(
    'Without Me', 
    (SELECT album_id FROM Albums WHERE title = 'The Eminem Show'), 
    291
),
(
    'Stepdad', 
    (SELECT album_id FROM Albums WHERE title = 'Music To Be Murdered By'), 
    213
),
(
    'Marsh', 
    (SELECT album_id FROM Albums WHERE title = 'Music To Be Murdered By'), 
    201
),
(
    'My Life', 
    (SELECT album_id FROM Albums WHERE title = 'Perception'), 
    216
),
(
    'Let You Down', 
    (SELECT album_id FROM Albums WHERE title = 'Perception'), 
    212
),
(
    'Lie', 
    (SELECT album_id FROM Albums WHERE title = 'Perception'), 
    209
),
(
    'Red Flavor', 
    (SELECT album_id FROM Albums WHERE title = 'The Red Summer'), 
    191
),
(
    'Zoo', 
    (SELECT album_id FROM Albums WHERE title = 'The Red Summer'), 
    204
),
(
    'Sunny Side Up!', 
    (SELECT album_id FROM Albums WHERE title = 'The ReVe Festival: Finale'), 
    203
),
(
    'Psycho', 
    (SELECT album_id FROM Albums WHERE title = 'The ReVe Festival: Finale'), 
    210
),
(
    'Milkshake', 
    (SELECT album_id FROM Albums WHERE title = 'The ReVe Festival: Finale'), 
    210
),
(
    'Bet You Wanna',
    (SELECT album_id FROM Albums WHERE title = 'THE ALBUM'),
    159
);

-- Добавление сборников
INSERT INTO Collections (title, release_year) VALUES
('Road Trip', 2017),
('Spring Mood', 2018),
('Evening Vibes', 2019),
('K-pop Hits', 2020);

-- Добавление связи артист - жанр
INSERT INTO Artist_Genres (artist_id, genre_id) VALUES 
(
    (SELECT artist_id FROM Artists WHERE name = 'Linkin Park'),
    (SELECT genre_id FROM Genres WHERE name = 'Rock')
),
(
    (SELECT artist_id FROM Artists WHERE name = 'BLACKPINK'),
    (SELECT genre_id FROM Genres WHERE name = 'EDM')
),
(
    (SELECT artist_id FROM Artists WHERE name = 'BLACKPINK'),
    (SELECT genre_id FROM Genres WHERE name = 'K-pop')
),
(
    (SELECT artist_id FROM Artists WHERE name = 'BLACKPINK'),
    (SELECT genre_id FROM Genres WHERE name = 'R&B')
),
(
    (SELECT artist_id FROM Artists WHERE name = 'Hyukoh'),
    (SELECT genre_id FROM Genres WHERE name = 'Rock')
),
(
    (SELECT artist_id FROM Artists WHERE name = 'Hyukoh'),
    (SELECT genre_id FROM Genres WHERE name = 'Indie')
),
(
    (SELECT artist_id FROM Artists WHERE name = 'Eminem'),
    (SELECT genre_id FROM Genres WHERE name = 'Hip-hop')
),
(
    (SELECT artist_id FROM Artists WHERE name = 'NF'),
    (SELECT genre_id FROM Genres WHERE name = 'Hip-hop')
),
(
    (SELECT artist_id FROM Artists WHERE name = 'Red Velvet'),
    (SELECT genre_id FROM Genres WHERE name = 'EDM')
),
(
    (SELECT artist_id FROM Artists WHERE name = 'Red Velvet'),
    (SELECT genre_id FROM Genres WHERE name = 'K-pop')
),
(
    (SELECT artist_id FROM Artists WHERE name = 'Red Velvet'),
    (SELECT genre_id FROM Genres WHERE name = 'R&B')
),

(
    (SELECT artist_id FROM Artists WHERE name = 'Cardi B'),
    (SELECT genre_id FROM Genres WHERE name = 'Hip-hop')
);

-- Добавление связи артист - альбом
INSERT INTO Artist_Albums (artist_id, album_id) VALUES 
(
    (SELECT artist_id FROM Artists WHERE name = 'Linkin Park'), 
    (SELECT album_id FROM Albums WHERE title = 'Minutes to Midnight')
),
(
    (SELECT artist_id FROM Artists WHERE name = 'Linkin Park'), 
    (SELECT album_id FROM Albums WHERE title = 'Meteora')
),
(
    (SELECT artist_id FROM Artists WHERE name = 'BLACKPINK'), 
    (SELECT album_id FROM Albums WHERE title = 'SQUARE ONE')
),
(
    (SELECT artist_id FROM Artists WHERE name = 'BLACKPINK'), 
    (SELECT album_id FROM Albums WHERE title = 'SQUARE UP')
),
(
    (SELECT artist_id FROM Artists WHERE name = 'BLACKPINK'), 
    (SELECT album_id FROM Albums WHERE title = 'THE ALBUM')
),
(
    (SELECT artist_id FROM Artists WHERE name = 'BLACKPINK'), 
    (SELECT album_id FROM Albums WHERE title = 'DEADLINE')
),
(
    (SELECT artist_id FROM Artists WHERE name = 'Hyukoh'), 
    (SELECT album_id FROM Albums WHERE title = '20')
),
(
    (SELECT artist_id FROM Artists WHERE name = 'Hyukoh'), 
    (SELECT album_id FROM Albums WHERE title = '22')
),
(
    (SELECT artist_id FROM Artists WHERE name = 'Eminem'), 
    (SELECT album_id FROM Albums WHERE title = 'The Eminem Show')
),
(
    (SELECT artist_id FROM Artists WHERE name = 'Eminem'), 
    (SELECT album_id FROM Albums WHERE title = 'Music To Be Murdered By')
),
(
    (SELECT artist_id FROM Artists WHERE name = 'NF'), 
    (SELECT album_id FROM Albums WHERE title = 'Perception')
),
(
    (SELECT artist_id FROM Artists WHERE name = 'Red Velvet'), 
    (SELECT album_id FROM Albums WHERE title = 'The Red Summer')
),
(
    (SELECT artist_id FROM Artists WHERE name = 'Red Velvet'), 
    (SELECT album_id FROM Albums WHERE title = 'The ReVe Festival: Finale')
),

(
    (SELECT artist_id FROM Artists WHERE name = 'Cardi B'), 
    (SELECT album_id FROM Albums WHERE title = 'THE ALBUM')
);


-- Добавление связи сборник - трек

-- K-pop Hits
INSERT INTO Collection_Tracks (collection_id, track_id)
SELECT c.collection_id, t.track_id
FROM Collections c
JOIN Tracks t ON t.title IN (
    'BOOMBAYAH', 'DDU-DU DDU-DU', 'Forever Young', 'How You Like That',
    'Lovesick Girls', 'Psycho', 'Sunny Side Up!', 'Red Flavor', 'Bet You Wanna'
)
WHERE c.title = 'K-pop Hits';

-- Road Trip
INSERT INTO Collection_Tracks (collection_id, track_id)
SELECT c.collection_id, t.track_id
FROM Collections c
JOIN Tracks t ON t.title IN (
    'Given Up', 'No More Sorrow', 'Breaking the Habit',
    'Numb', 'Without Me', 'Stepdad', 'Marsh', 'My Life'
)
WHERE c.title = 'Road Trip';

-- Evening Vibes
INSERT INTO Collection_Tracks (collection_id, track_id)
SELECT c.collection_id, t.track_id
FROM Collections c
JOIN Tracks t ON t.title IN (
    'Wi Ing Wi Ing', 'Settled Down', 'Comes and Goes',
    'Let You Down', 'Lie', 'Psycho'
)
WHERE c.title = 'Evening Vibes';


-- Spring Mood
INSERT INTO Collection_Tracks (collection_id, track_id)
SELECT c.collection_id, t.track_id
FROM Collections c
JOIN Tracks t ON t.title IN (
    'Forever Young', 'Our Place', 'Red Flavor',
    'Zoo'
)
WHERE c.title = 'Spring Mood';