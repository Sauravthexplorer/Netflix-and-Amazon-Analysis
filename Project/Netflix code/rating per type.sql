select rating,type,count(type) from netflix
where rating is not null and type is not null
group by 1,2
order by 1 
