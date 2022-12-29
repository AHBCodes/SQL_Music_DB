/*Query 1 - How much was each media file type used?*/
SELECT m.Name AS "File Type", count(t.MediaTypeId) Quantity
FROM MediaType m
JOIN Track t
ON m.MediaTypeId = t.MediaTypeId
GROUP BY m.Name
ORDER BY Quantity;

/*Query 2 - Which artists have used the least used media file type "Purchased AAC audio file"?*/
SELECT ar.Name AS "Artist", count(t.MediaTypeId) AS "Number of tracks"
FROM Track t
JOIN MediaType m
ON m.MediaTypeId = t.MediaTypeId and m.Name = "Purchased AAC audio file"
JOIN Album al
ON al.AlbumId = t.AlbumId
Join Artist ar
ON al.ArtistId = ar.ArtistId
GROUP BY 1
ORDER BY 1;

/*Query 3 - What is the average track length for each media file type?*/
SELECT m.Name AS "Media File Type", (avg(t.Milliseconds) / 60000) AS "Average track lenth in (mins)"
FROM Track t
JOIN MediaType m
ON t.MediaTypeId = m.MediaTypeId
GROUP BY 1
ORDER BY 2 DESC;

/*Query 4 - What is the average track size in megabytes for each music genre using "Purchased AAC audio file" as media file type?*/
SELECT g.Name AS "Genre", (AVG(t.Bytes) / 1000000) AS "Average track size in (Mb)"
FROM Track t
JOIN Genre g
ON t.GenreId = g.GenreId
GROUP BY 1
ORDER BY 3 DESC;