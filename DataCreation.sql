USE spotify;
############################# Create Genere #################################
CREATE TABLE genres (
    genre_id INT AUTO_INCREMENT PRIMARY KEY,
    genre_name VARCHAR(100),
    subgenre_name VARCHAR(100),
    UNIQUE (genre_name, subgenre_name)
);
# INSERT INTO genres Table
INSERT INTO genres (genre_name, subgenre_name)
SELECT DISTINCT playlist_genre, playlist_subgenre
FROM spotify_songs;

# Add a genre_id column to the spotify_songs table
ALTER TABLE spotify_songs ADD genre_id INT;

# Update the genre_id in the spotify_songs table
UPDATE spotify_songs s
JOIN genres g 
    ON s.playlist_genre = g.genre_name 
    AND s.playlist_subgenre = g.subgenre_name
SET s.genre_id = g.genre_id;

# Add a foreign key constraint to link spotify_songs with genres
ALTER TABLE spotify_songs
ADD CONSTRAINT fk_spotify_songs_genre_id
FOREIGN KEY (genre_id) REFERENCES genres(genre_id);

# Drop the old genre columns from spotify_songs
ALTER TABLE spotify_songs
DROP COLUMN playlist_genre,
DROP COLUMN playlist_subgenre;

# Check genres 
SELECT s.track_name, g.genre_name, g.subgenre_name
FROM spotify_songs s
JOIN genres g ON s.genre_id = g.genre_id;

############################# Create Artists #################################

CREATE TABLE artists (
    artist_id INT AUTO_INCREMENT PRIMARY KEY,
    artist_name VARCHAR(255) UNIQUE
);

-- Insert unique artist names into the artists table
INSERT INTO artists (artist_name)
SELECT DISTINCT track_artist FROM spotify_songs;

-- Add artist_id to spotify_songs and update it
ALTER TABLE spotify_songs ADD artist_id INT;

UPDATE spotify_songs s
JOIN artists a ON s.track_artist = a.artist_name
SET s.artist_id = a.artist_id;

#############################  Drop the  column ############################# 
ALTER TABLE spotify DROP COLUMN loudness;
ALTER TABLE spotify DROP COLUMN speechiness;
ALTER TABLE spotify DROP COLUMN acousticness;
ALTER TABLE spotify DROP COLUMN instrumentalness;
ALTER TABLE spotify DROP COLUMN liveness;
ALTER TABLE spotify DROP COLUMN valence;
ALTER TABLE spotify DROP COLUMN tempo;
ALTER TABLE spotify DROP COLUMN danceability;
ALTER TABLE spotify DROP COLUMN energy;
ALTER TABLE spotify DROP COLUMN mode;
ALTER TABLE spotify DROP COLUMN `key`;
