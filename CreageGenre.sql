-- Step 1: Create the genres table with unique genre and subgenre combinations
CREATE TABLE genres (
    genre_id INT AUTO_INCREMENT PRIMARY KEY,
    genre_name VARCHAR(100),
    subgenre_name VARCHAR(100),
    UNIQUE (genre_name, subgenre_name)
);

-- Step 2: Insert distinct genres into the genres table
INSERT INTO genres (genre_name, subgenre_name)
SELECT DISTINCT playlist_genre, playlist_subgenre
FROM spotify_songs;

-- Step 3: Add a genre_id column to the spotify_songs table
ALTER TABLE spotify_songs ADD genre_id INT;

-- Update the genre_id in the spotify_songs table by joining with the genres table
UPDATE spotify_songs s
JOIN genres g 
    ON s.playlist_genre = g.genre_name 
    AND s.playlist_subgenre = g.subgenre_name
SET s.genre_id = g.genre_id;

-- Add a foreign key constraint to link spotify_songs with genres
ALTER TABLE spotify_songs
ADD CONSTRAINT fk_spotify_songs_genre_id
FOREIGN KEY (genre_id) REFERENCES genres(genre_id);

-- Drop the old genre columns from spotify_songs
ALTER TABLE spotify_songs
DROP COLUMN playlist_genre,
DROP COLUMN playlist_subgenre;

# Check genres 
SELECT s.track_name, g.genre_name, g.subgenre_name
FROM spotify_songs s
JOIN genres g ON s.genre_id = g.genre_id;


SELECT * FROM spotify_songs;
