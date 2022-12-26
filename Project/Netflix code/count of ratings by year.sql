select rating,release_year,count(type) from netflix
where rating is not null and listed_in is not null
group by 1,2
order by 2 desc