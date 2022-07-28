SELECT 
    artist_table.artist_name AS artista,
    album_table.album_name AS album,
    COUNT(following_table.artist_id) AS seguidores
FROM
    SpotifyClone.Artist AS artist_table
        INNER JOIN
    SpotifyClone.Album AS album_table ON album_table.artist_id = artist_table.artist_id
		INNER JOIN
    SpotifyClone.Following AS following_table ON following_table.artist_id = artist_table.artist_id
    GROUP BY artista , album
    Order BY seguidores DESC, artista, album
