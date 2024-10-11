USE spotify;
######## Hypothesis 1 -  Pop songs are more popular than songs from other genres ############################
SELECT genre_name, AVG(track_popularity) AS avg_popularity
FROM spotify
INNER JOIN genres
USING(genre_id)
GROUP BY genre_name
ORDER BY avg_popularity DESC;

######## Hypothesis 2 -Songs released after 2010 are, on average, more popular than songs released before 2010.############################
SELECT 
    CASE 
        WHEN track_album_release_date > 2010 THEN 'After 2010'
        ELSE 'Before 2010'
    END AS period,
    AVG(track_popularity) AS avg_popularity
FROM spotify
GROUP BY period
ORDER BY period DESC;


######## Hypothesis 3 - Artists with more songs tend to have a higher average popularity.############################
SELECT artist_name,
COUNT(track_id) AS total_songs, 
AVG(track_popularity) AS avg_popularity
FROM spotify
INNER JOIN artists
USING(artist_id)
GROUP BY artist_name
ORDER BY avg_popularity DESC 
LIMIT 10;
