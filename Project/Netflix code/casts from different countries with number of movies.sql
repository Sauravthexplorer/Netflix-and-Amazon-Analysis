select country,split_part(casts,',',1) cast1,type,count(split_part(casts,',',1)) as count from netflix 
where casts is not null and director is not null and country is not null
group by 1,2,3
order by 4 desc