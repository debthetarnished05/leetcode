# Write your MySQL query statement below



select category, count(*) as accounts_count from

(select account_id, income, 
case when income<20000 then 'Low Salary'
when income<=50000 then 'Average Salary'
else 'High Salary'
end as category
from Accounts) as a

group by category

UNION ALL

SELECT 'Low Salary', 0
WHERE NOT EXISTS (
    SELECT 1
    FROM Accounts
    WHERE income < 20000
)

UNION ALL

SELECT 'Average Salary', 0
WHERE NOT EXISTS (
    SELECT 1
    FROM Accounts
    WHERE income >= 20000 AND income <= 50000
)

UNION ALL

SELECT 'High Salary', 0
WHERE NOT EXISTS (
    SELECT 1
    FROM Accounts
    WHERE income > 50000
);