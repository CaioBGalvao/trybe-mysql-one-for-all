SELECT 
    users_table.user_name AS usuario,
    COUNT(DISTINCT reproduction_table.reproduction_date) AS qtde_musicas_ouvidas,
	ROUND(SUM(songs_table.duration_song) / 60 , 2) AS total_minutos
    -- VV  ROUND(SUM(songs_table.duration_song / 60), 2) AS total_minutos
    -- GK CAST(SUM(s.song_duration / 60) AS DECIMAL (4 , 2 )) AS total_minutos
FROM
    SpotifyClone.Users AS users_table
        INNER JOIN
    SpotifyClone.Reproduction AS reproduction_table ON users_table.user_id = reproduction_table.user_id
        INNER JOIN
    SpotifyClone.Songs AS songs_table ON reproduction_table.song_id = songs_table.song_id
GROUP BY usuario
ORDER BY usuario ASC;
