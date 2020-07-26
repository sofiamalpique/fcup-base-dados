SELECT c.Name, count(cu.Name) as Numero from Country c, Customer cu
where c.Name = cu.Country
and cu.Name LIKE '%y%'
group by c.Name
having Numero >= 3
order by Numero desc, c.Name asc;