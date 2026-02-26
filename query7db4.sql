SELECT COUNT(*) as TotalArtists
FROM (
	SELECT artists.Name
	From artists
	JOIN albums on albums.ArtistId = artists.ArtistId
	JOIN tracks on tracks.AlbumId = albums.AlbumId
	JOIN media_types on media_types.MediaTypeId = tracks.MediaTypeId
	WHERE media_types.Name LIKE '%MPEG%'
	GROUP BY artists.Name
	HAVING COUNT(tracks.TrackId) >= 10
)
