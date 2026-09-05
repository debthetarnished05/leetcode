# Write your MySQL query statement below
select r.contest_id, round(((count(distinct r.user_id)/count(distinct u.user_id))*100),2) as percentage from Register r, Users u
group by r.contest_id
order by percentage desc, contest_id asc;