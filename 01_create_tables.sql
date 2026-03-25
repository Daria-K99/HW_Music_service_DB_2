-- Таблица Genres
CREATE TABLE Genres (
    genre_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

-- Таблица Artists
CREATE TABLE Artists (
    artist_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- Таблица связи Artists - Genres (многие-ко-многим)
CREATE TABLE Artist_Genres (
    artist_id INT NOT NULL,
    genre_id INT NOT NULL,
    PRIMARY KEY (artist_id, genre_id),
    FOREIGN KEY (artist_id) REFERENCES Artists(artist_id) ON DELETE CASCADE,
    FOREIGN KEY (genre_id) REFERENCES Genres(genre_id) ON DELETE CASCADE
);

-- Таблица Albums
CREATE TABLE Albums (
    album_id SERIAL PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    release_year INT
    );

-- Таблица связи Artists - Albums (многие-ко-многим)
CREATE TABLE Artist_Albums (
    artist_id INT NOT NULL,
    album_id INT NOT NULL,
    PRIMARY KEY (artist_id, album_id),
    FOREIGN KEY (artist_id) REFERENCES Artists(artist_id) ON DELETE CASCADE,
    FOREIGN KEY (album_id) REFERENCES Albums(album_id) ON DELETE CASCADE
);

-- Таблица Tracks
CREATE TABLE Tracks (
    track_id SERIAL PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    album_id INT NOT NULL,
    duration INT, -- длительность в секундах
    FOREIGN KEY (album_id) REFERENCES Albums(album_id) ON DELETE CASCADE
);

-- Таблица Collections
CREATE TABLE Collections (
    collection_id SERIAL PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    release_year INT
    );

-- Таблица связи Collections - Tracks (многие-ко-многим)
CREATE TABLE Collection_Tracks (
    collection_id INT NOT NULL,
    track_id INT NOT NULL,
    PRIMARY KEY (collection_id, track_id),
    FOREIGN KEY (collection_id) REFERENCES Collections(collection_id) ON DELETE CASCADE,
    FOREIGN KEY (track_id) REFERENCES Tracks(track_id) ON DELETE CASCADE
);



