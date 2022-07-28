SELECT 
	songs_table.song_name AS cancao,
    COUNT(reproduction_table.reproduction_date)AS reproducoes
FROM
    SpotifyClone.Songs AS songs_table
        INNER JOIN
    SpotifyClone.Reproduction AS reproduction_table ON reproduction_table.song_id = songs_table.song_id
GROUP BY cancao
ORDER BY reproducoes DESC, cancao
LIMIT 2;