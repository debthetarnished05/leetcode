# Write your MySQL query statement below

select * from (select u.name as results from
MovieRating m
join 
Users u

on m.user_id=u.user_id
group by m.user_id 

order by count(*) desc, name asc
limit 1) t1
union all
select * from (
select m2.title as results from

MovieRating m1
join 
Movies m2
on m1.movie_id = m2.movie_id
where m1.created_at between '2020-02-01' and '2020-02-29'
group by m1.movie_id
order by avg(rating) desc, title asc
limit 1
) t2