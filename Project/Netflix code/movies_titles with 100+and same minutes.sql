select title,minutes,count(cast(minutes as integer)) from (select *,split_part(duration,' ',1) as minutes from netflix ) 
duration_cast
where title is not null and type ='Movie'
group by 1,2
order by 3 desc;
--create view minutes AS
--select *,cast(split_part(duration,' ',1) as integer) as minutes from netflix ;
select distinct m1.title,m1.minutes from minutes m1,minutes m2
where m1.title != m2.title and m1.minutes=m2.minutes and m1.minutes >=100
order by 2 desc
