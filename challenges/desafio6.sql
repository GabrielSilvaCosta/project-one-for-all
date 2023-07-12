SELECT
    ROUND(MIN(s.subscription_price), 2) AS faturamento_minimo,
    ROUND(MAX(s.subscription_price), 2) AS faturamento_maximo,
    ROUND(AVG(s.subscription_price), 2) AS faturamento_medio,
    ROUND(SUM(s.subscription_price), 2) AS faturamento_total
FROM
    SpotifyClone.subscription AS s
    INNER JOIN SpotifyClone.customer AS c ON s.subscription_id = c.subscription_id;
