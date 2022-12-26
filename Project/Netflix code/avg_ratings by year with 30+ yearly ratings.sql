select distinct release_year,count(type) over(partition by release_year) from netflix_ratings
order by 2 desc;
--create view yearly_ratingn as
select release_year,count(type) from netflix_ratings
group by 1
order by 2 desc;
select netflix_ratings.release_year,round(avg(imdb_score)::numeric,2) as avg_ratings from netflix_ratings
inner join yearly_ratingn
on netflix_ratings.release_year=yearly_ratingn.release_year
where imdb_score is not null and netflix_ratings.release_year is not null and yearly_ratingn.count >=30
group by netflix_ratings.release_year
order by 2 desc;
