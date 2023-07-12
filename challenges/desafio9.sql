SELECT
    COUNT(*) AS musicas_no_historico
FROM
    SpotifyClone.history AS H
    INNER JOIN SpotifyClone.customer AS C ON H.customer_id = C.customer_id
WHERE
    C.customer_name = 'Barbara Liskov';
