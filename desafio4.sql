SELECT 
    users_table.user_name AS usuario,
    IF(MAX(YEAR(reproduction_table.reproduction_date)) >= 2021, 'Usuário ativo', 'Usuário inativo')  AS condicao_usuario
FROM
    SpotifyClone.Users AS users_table
        INNER JOIN
    SpotifyClone.Reproduction AS reproduction_table ON users_table.user_id = reproduction_table.user_id
GROUP BY usuario;