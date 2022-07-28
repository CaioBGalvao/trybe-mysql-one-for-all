SELECT 
    MIN(subscription_table.subscription_price) AS faturamento_minimo,
    MAX(subscription_table.subscription_price) AS faturamento_maximo,
    ROUND(AVG(subscription_table.subscription_price), 2) AS faturamento_medio,
    SUM(subscription_table.subscription_price) AS faturamento_total
FROM
    SpotifyClone.Subscription AS subscription_table
        INNER JOIN
    SpotifyClone.Users AS users_table ON users_table.subscription_id = subscription_table.subscription_id;
    