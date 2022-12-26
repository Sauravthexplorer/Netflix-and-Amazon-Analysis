
drop view countries_ratings;
create view countries_ratings as 
select distinct country,imdb_score,count_imdb_scores,avg(imdb_score) over(partition by country) as avg_ratings from  all_country_ratings;
select  countries_ratings.country,round(avg_ratings::numeric,2) from countries_ratings
inner join sum_count_imdb_scores
on sum_count_imdb_scores.country = countries_ratings.country
where sum_count_imdb_scores.sum_count_imdb>=36
group by countries_ratings.country,avg_ratings
order by 2 desc