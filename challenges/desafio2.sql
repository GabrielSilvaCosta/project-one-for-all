SELECT
    COUNT(DISTINCT T.track_id) AS cancoes,
    COUNT(DISTINCT A.artist_id) AS artistas,
    COUNT(DISTINCT AL.album_id) AS albuns
FROM
    SpotifyClone.track T
    INNER JOIN SpotifyClone.album AL ON T.album_id = AL.album_id
    INNER JOIN SpotifyClone.artist A ON AL.artist_id = A.artist_id;
