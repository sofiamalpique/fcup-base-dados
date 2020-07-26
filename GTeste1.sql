UPDATE Stream s
  inner join Customer c on s.CustomerId = c.CustomerId
  inner join Country co on co.name = c.Country
  inner join Region r on r.RegionId = co.RegionId
  inner join Movie m on m.MovieId = s.MovieId
  inner join Movie_Actor ma on ma.MovieId = m.MovieId
  inner join Actor a on a.ActorId = ma.ActorId
set Charge = '1.5'
where a.Name = 'Denzel Washington'
and r.Name = 'Europe';