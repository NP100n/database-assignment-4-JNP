SELECT ar.Name 
FROM albums a
JOIN artists ar On a.ArtistId = ar.ArtistId
WHERE a.Title LIKE '%symphony%'
