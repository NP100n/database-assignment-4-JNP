SELECT playlists.PlaylistId, playlists.Name, ROUND(SUM(tracks.Milliseconds) / 3600000.0, 2) AS length_hours
FROM playlists
JOIN playlist_track ON playlist_track.PlaylistId = playlists.PlaylistId
JOIN tracks ON tracks.TrackId = playlist_track.TrackId
GROUP BY playlists.PlaylistId, playlists.Name
HAVING SUM(tracks.Milliseconds) > 7200000
