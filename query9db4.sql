SELECT
    ar.Name AS ArtistName,
    al.Title AS AlbumTitle,
    t.Name AS TrackName,
    t.Milliseconds,
    ROUND(t.Milliseconds / 60000.0, 2) AS TrackLengthMinutes,
    ROUND(AVG(t.Milliseconds) OVER (PARTITION BY ar.ArtistId), 2) AS AvgTrackLengthByArtist,
    ROUND(SUM(t.Milliseconds) OVER (PARTITION BY al.AlbumId), 2) AS TotalAlbumLengthMs,
    RANK() OVER (PARTITION BY ar.ArtistId ORDER BY t.Milliseconds DESC) AS TrackRankByLength
FROM tracks t
JOIN albums al ON t.AlbumId = al.AlbumId
JOIN artists ar ON al.ArtistId = ar.ArtistId
WHERE ar.Name IN ('Led Zeppelin', 'Metallica', 'Deep Purple')
ORDER BY ar.Name, al.Title, TrackRankByLength;

-- This query pulls every track from Led Zeppelin, Metallica, and Deep Purple and computes several window-function-based metrics alongside each row. AVG(...) OVER (PARTITION BY ar.ArtistId) shows the average track length across all tracks by that artist so you can see whether a given track is longer or shorter than that artist's typical song. SUM(...) OVER (PARTITION BY al.AlbumId) shows the total runtime of the album that track belongs to, useful for seeing how much a single track contributes to the full album length. RANK() OVER (PARTITION BY ar.ArtistId ORDER BY t.Milliseconds DESC) ranks each track within its artist's catalog by length with the longest at rank 1, so for example a rank-1 track for Metallica is their longest song in the DB, and any track whose length far exceeds AvgTrackLengthByArtist is an unusually long cut for that band.
