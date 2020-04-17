SELECT Year, COUNT(MovieId) AS 'contador' FROM MOVIE
WHERE Duration >= 120
GROUP BY Year
HAVING contador >= 10
ORDER BY contador desc, Year;