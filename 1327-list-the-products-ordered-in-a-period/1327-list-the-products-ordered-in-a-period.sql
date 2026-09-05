# Write your MySQL query statement below
select p.product_name, o.unit from Products p 
join (
    select product_id, date_format(order_date,'%Y-%m') as order_month, sum(unit) as unit
    from Orders
    group by product_id,order_month
    having order_month = '2020-02'
) o
on p.product_id = o.product_id
where o.unit >=100