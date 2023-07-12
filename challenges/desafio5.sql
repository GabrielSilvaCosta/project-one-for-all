SELECT
    t.track_name AS cancao,
    COUNT(h.customer_id) AS reproducoes
FROM
    SpotifyClone.track AS t
    INNER JOIN SpotifyClone.history AS h ON t.track_id = h.track_id
GROUP BY
    t.track_name
ORDER BY
    reproducoes DESC, cancao ASC
LIMIT 2;
