--create view indian_directors as 
select * from netflix 
where director is not null and director='India';
select listed_in,count(listed_in) from indian_directors
where rating ='TV-14'
group by 1
order by 2 desc;
select * from (
select director,listed_in,
sum(case when (listed_in ilike 'Dramas%') or (listed_in ilike'%Dramas%') then 1 
else 0
end) as sum_of_listed_in_that_contains_drama
from indian_directors
where rating ='TV-14' 
group by 1,2
order by 3 desc) as direc_listed_in
where sum_of_listed_in_that_contains_drama != 0;
select * from (
select director,
sum(case when (listed_in ilike 'Drama%') or (listed_in ilike'%Drama%') then 1 
else 0
end) as sum_of_drama_listedin
from indian_directors

group by 1
order by 2 desc) as direc_listed_in
where sum_of_drama_listedin != 0






