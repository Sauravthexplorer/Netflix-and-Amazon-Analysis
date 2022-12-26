select  age_certification,ROUND(avg(imdb_score)::numeric,2) avg_imdb,ROUND(avg(tmdb_score)::numeric,2) avg_tmdb from netflix_ratings
where age_certification is not null
group by 1;
select COALESCE(rating,age_certification) as ratings,ROUND(avg(imdb_score)::numeric,2) avg_imdb,ROUND(avg(tmdb_score)::numeric,2)
avg_tmdb from netflix_ratingss
where COALESCE(rating,age_certification) is not null
group by 1
order by 2 desc
