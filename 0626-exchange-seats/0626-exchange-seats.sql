# Write your MySQL query statement below

with s as (select id,student,
coalesce(case when id%2=0 then lag(id) over (order by id) 
else lead(id) over (order by id) end,id) as new_id
from Seat)

select new_id as id, student from s order by new_id