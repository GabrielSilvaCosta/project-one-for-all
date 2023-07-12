SELECT
    c.customer_name AS pessoa_usuaria,
    COUNT(h.track_id) AS musicas_ouvidas,
    ROUND(SUM(t.track_duration) / 60.0, 2) AS total_minutos
FROM
    SpotifyClone.history AS h
    INNER JOIN SpotifyClone.customer AS c ON h.customer_id = c.customer_id
    INNER JOIN SpotifyClone.track AS t ON h.track_id = t.track_id
GROUP BY
    c.customer_name
ORDER BY
    c.customer_name;
