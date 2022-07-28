SELECT 
    COUNT(reproduction_table.user_id) AS quantidade_musicas_no_historico
FROM
    SpotifyClone.Users AS users_table
        INNER JOIN
    SpotifyClone.Reproduction AS reproduction_table ON reproduction_table.user_id = users_table.user_id
WHERE
    user_name = 'Bill'