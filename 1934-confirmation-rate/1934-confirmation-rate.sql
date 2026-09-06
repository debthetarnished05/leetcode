# Write your MySQL query statement below

select s.user_id, coalesce(round((count(case when c.action='confirmed' then 1 end)/count(c.time_stamp)),2),0) as confirmation_rate from
Confirmations c 
right join 
Signups s
on c.user_id=s.user_id
group by s.user_id