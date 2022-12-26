drop view if exists movie_imdb_scores;
create VIEW movie_imdb_scores as 
select imdb_score,count(imdb_score) as count1 from netflix_ratingss
where type='Movie' and imdb_score is not null
group by 1
order by 2 desc;
drop view if exists tvshow_imdb_scores;
create VIEW tvshow_imdb_scores as 
select imdb_score,count(imdb_score) as count2 from netflix_ratingss
where type='TV Show' and imdb_score is not null
group by 1
order by 2 desc;
select movie_imdb_scores.imdb_score,count1,count2 from tvshow_imdb_scores
right join movie_imdb_scores
on movie_imdb_scores.imdb_score = tvshow_imdb_scores.imdb_score


