select * from (select split_part(country,',',1) country1,sum(case when listed_in ilike '%Documentary%' then 1 else 0 end) as total_documentries from amazon
where country is not null 
group by 1
order by 2 desc) doc_counttry
where total_documentries !=0;
select split_part(country,',',1) country1,listed_in,count(listed_in) from amazon
where country is not null 
group by 1,2
order by 3 desc;
--how many movies and shows are for kids in different country.
select * from (select split_part(country,',',1) country1,sum(case when listed_in ilike '%kids%' then 1 else 0 end) as sum_of_movie_for_kids from amazon
where country is not null and type= 'Movie'
group by 1
order by 2 desc) kid_country
where sum_of_movie_for_kids !=0;
select * from(select split_part(country,',',1) country1,sum(case when listed_in ilike '%kids%' then 1 else 0 end) as sum_of_shows_for_kids from amazon
where country is not null and type= 'TV Show'
group by 1
order by 2 desc) kids_country
where sum_of_shows_for_kids !=0;
--How many tv shows are related to science in different countries
select * from(select split_part(country,',',1) country1,sum(case when listed_in ilike '%science%' then 1 else 0 end) as sum_of_shows_on_science from amazon
where country is not null and type= 'TV Show'
group by 1
order by 2 desc) fiction_country
where sum_of_shows_on_science !=0;
--how many movies are for science in different countries
select * from(select split_part(country,',',1) country1,sum(case when listed_in ilike '%Science%' then 1 else 0 end) as sum_of_movies_on_science from amazon
where country is not null and type= 'Movie'
group by 1
order by 2 desc) science_country
where sum_of_movies_on_science !=0
















