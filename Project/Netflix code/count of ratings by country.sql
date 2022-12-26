select split_part(country,',',1) as country ,type ,count(type) from netflix
where country is not null
group by 1,2
order by 3 desc;
