SELECT Year, COUNT(MovieId) AS 'contador' FROM MOVIE
GROUP BY Year
ORDER BY contador desc
LIMIT 5;