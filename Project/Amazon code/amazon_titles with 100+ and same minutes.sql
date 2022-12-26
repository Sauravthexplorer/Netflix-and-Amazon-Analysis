select title,minutes,count(cast(minutes as integer)) from (select *,split_part(duration,' ',1) as minutes from amazon ) 
duration_cast
where title is not null
group by 1,2
order by 3 desc;
--create view minutesss AS
--select *,cast(split_part(duration,' ',1) as integer) as minutes from amazon 
--where type ='Movie';
select distinct m1.title,m1.minutes from minutesss m1,minutesss m2
where m1.title != m2.title and m1.minutes=m2.minutes and m1.minutes >=100
order by 2 desc



