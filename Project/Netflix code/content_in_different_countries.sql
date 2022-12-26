select country,sum(case when listed_in ilike '%Documentaries%' then 1 else 0 end) as total_documentries from netflix
where country is not null 
group by 1
order by 2 desc;
select country,listed_in,count(listed_in) from netflix
where country is not null 
group by 1,2
order by 3 desc;
--how many movies and shows are for family and chldren in different country.
select country,listed_in,sum(case when listed_in ilike '%Children & Family%' then 1 else 0 end) as total_documentries from netflix
where country is not null and type= 'Movie'
group by 1,2
order by 3 desc;
select country,listed_in,sum(case when listed_in ilike '%Children & Family%' then 1 else 0 end) as sum_of_shows_for_family from netflix
where country is not null and type= 'TV Show'
group by 1,2
order by 3 desc;
-- No TV Shows for family and children
--How many tv shows are related to crime in different countries
select country,sum(case when listed_in ilike '%Crime%' then 1 else 0 end) as sum_of_shows_for_crime from netflix
where country is not null and type= 'TV Show'
group by 1
order by 2 desc;
--how many movies are for crime in different countries
select country,listed_in,sum(case when listed_in ilike '%Crime%' then 1 else 0 end) as sum_of_shows_for_crime from netflix
where country is not null and type= 'Movie'
group by 1,2
order by 3 desc
--No movies for crime available on netflix in different countries.












