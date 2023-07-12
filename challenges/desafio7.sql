SELECT
    A.artist_name AS artista,
    AL.album_name AS album,
    COUNT(F.artist_id) AS pessoas_seguidoras
FROM
    SpotifyClone.artist AS A
    INNER JOIN SpotifyClone.album AS AL ON A.artist_id = AL.artist_id
    LEFT JOIN SpotifyClone.following AS F ON A.artist_id = F.artist_id
GROUP BY
    artista,
    album
ORDER BY
    pessoas_seguidoras DESC,
    artista,
    album;
