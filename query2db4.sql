SELECT a.Title, ar.Name
FROM albums a
JOIN artists ar On a.ArtistId = ar.ArtistId
