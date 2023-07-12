SELECT
    c.customer_name AS pessoa_usuaria,
    CASE
        WHEN MAX(h.history_date) >= '2021-01-01' THEN 'Ativa'
        ELSE 'Inativa'
    END AS status_pessoa_usuaria
FROM
    SpotifyClone.customer AS c
    LEFT JOIN SpotifyClone.history AS h ON c.customer_id = h.customer_id
GROUP BY
    c.customer_name
ORDER BY
    c.customer_name;
