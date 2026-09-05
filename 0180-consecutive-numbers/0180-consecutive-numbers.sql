# Write your MySQL query statement below
Select distinct num as ConsecutiveNums from(
    select id, num, lag(num) over(order by id) as prev1, lag(num,2) over (order by id) as  prev2 from Logs
) l
where num = prev1 and prev1=prev2