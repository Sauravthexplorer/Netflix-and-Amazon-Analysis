select release_year,type,Round(Round(count(type)/(sum(count(type)) over(partition by release_year)),3)*100,1)  as  percent_of_TVshows_movies from netflix
where date_part('year',CURRENT_DATE)-release_year <=20
group by 1,2
order by 1 desc
--I have analyzed data for past 20 years here you can see as year passes TV shows are coming more on NETFLIX.