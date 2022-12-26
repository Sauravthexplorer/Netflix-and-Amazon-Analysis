select split_part(country,',',1) as country1,Round(avg(split_part(duration,' ',1)::integer),2) as minutes from netflix
where type ='Movie' and duration is not null and country is not null
group by 1
order by 2 desc