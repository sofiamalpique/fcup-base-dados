SELECT MIN(Charge), MAX(Charge), AVG(Charge), SUM(Charge)
FROM STREAM
WHERE YEAR(StreamDate) = 2017;