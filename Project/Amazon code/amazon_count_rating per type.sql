select rating,type,count(type) from amazon
where rating is not null and type is not null
group by 1,2
order by 1 






