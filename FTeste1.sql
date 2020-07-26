select m.Title as Title, count(s.StreamId) as Counter, sum(s.Charge) as ValoresCobrados from Movie m, Movie_Genre mg, Stream s, Genre g
where s.MovieId = m.MovieId
and m.MovieId = mg.MovieId
and g.GenreId = mg.GenreId
and g.Label = 'Action'
group by m.Title
order by Counter desc, Title
limit 20;