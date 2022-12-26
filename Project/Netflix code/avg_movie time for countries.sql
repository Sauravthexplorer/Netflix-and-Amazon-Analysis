select title,minutes,count(cast(minutes as integer)) from (select *,split_part(duration,' ',1) as minutes from netflix ) 
duration_cast
where title is not null and type ='Movie'
group by 1,2
order by 3 desc;
--create view minutes AS
--select *,cast(split_part(duration,' ',1) as integer) as minutes from netflix ;
select split_part(country,',',1) as country1,Round(avg(minutes)::numeric,2) from minutesss
where country is not null
group by 1