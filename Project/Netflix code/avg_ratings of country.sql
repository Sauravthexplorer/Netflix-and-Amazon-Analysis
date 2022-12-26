--drop view if exists all_country_ratings;
--create view all_country_ratings as
select * from (select split_part(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace
	(replace(replace(replace(replace(countries,'FR','France'),'IE','Ireland'),'IN','India'),'BR','Brazil')
	,'GB','United Kingdom'),'KR','South Korea'),'JP','Japan')
	,'CN','China'),'AU','Australia'),'AR','Argentina'),'DE','Germany'),'CA','Canada'),'US','United States'),'MX','Mexico'),',',1) as country,
imdb_score,count(imdb_score) as count_imdb_scores from(select COALESCE(country,REPLACE(SUBSTRING(production_countries,3,2),'US','United States')) 
as countries,imdb_score from netflix_ratingss
where imdb_score  is not null) countriussssssss
group by 1,2) siuuuuuuu
where length(country)>1;
drop view if exists sum_count_imdb_scores;
create view sum_count_imdb_scores as
select country,sum(count_imdb_scores) as sum_count_imdb from all_country_ratings
group by 1
order by 2 desc;
select all_country_ratings.country,Round(avg(imdb_score)::numeric,2) from all_country_ratings
inner join sum_count_imdb_scores
on sum_count_imdb_scores.country = all_country_ratings.country
where sum_count_imdb_scores.sum_count_imdb>=36
group by all_country_ratings.country
order by 2 desc
















