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

-- Drop the old track_artist column if needed
ALTER TABLE spotify_songs DROP COLUMN track_artist;


SELECT * FROM spotify_songs;