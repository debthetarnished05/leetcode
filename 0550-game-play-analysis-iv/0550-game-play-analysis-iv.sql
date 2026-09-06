# Write your MySQL query statement below
select 

round (count(case when A.event_date=date_add(prev,Interval 1 day) then 1 end)/count(distinct player_id),2) as fraction

from (
    select player_id, event_date , 
    min(event_date) over(
        partition by player_id
        order by event_date
    ) as prev
    from Activity
) A