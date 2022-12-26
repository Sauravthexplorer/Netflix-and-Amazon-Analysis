select title,imdb_score,imdb_votes from netflix_ratingss

where imdb_score is not null and imdb_votes is not null and imdb_votes > 100000
order by 2 desc