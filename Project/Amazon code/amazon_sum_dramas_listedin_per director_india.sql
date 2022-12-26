--create view amazon_indian_directors as 
--select * from amazon 
--where director is not null and country='India';
select listed_in,count(listed_in) from amazon_indian_directors
where rating ='ALL'
group by 1
order by 2 desc;
select * from (
select director,listed_in,
sum(case when (listed_in ilike 'Drama%') or (listed_in ilike'%Drama%') then 1 
else 0
end) as sum_of_listed_in_that_contains_drama
from amazon_indian_directors
 
group by 1,2
order by 3 desc) as direct_listed_in
where sum_of_listed_in_that_contains_drama != 0;
select * from (
select director,
sum(case when (listed_in ilike 'Drama%') or (listed_in ilike'%Drama%') then 1 
else 0
end) as sum_of_drama_listedin
from amazon_indian_directors
 
group by 1
order by 2 desc) as direc_listed_in
where sum_of_drama_listedin != 0




