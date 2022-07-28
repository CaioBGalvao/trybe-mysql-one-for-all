SELECT 
    artist_table.artist_name AS artista,
    album_table.album_name AS album
FROM
    SpotifyClone.Artist AS artist_table
        INNER JOIN
    SpotifyClone.Album AS album_table ON album_table.artist_id = artist_table.artist_id
WHERE
    artist_name = 'Walter Phoenix'
GROUP BY artista , album
ORDER BY album