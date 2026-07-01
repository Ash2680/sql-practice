-- Problem: Calculate Special Bonus
-- Source: LeetCode #1873
-- Link: https://leetcode.com/problems/calculate-special-bonus/description/
-- Difficulty: Easy
-- Language: MS SQL Server
-- Topics: CASE WHEN, Modulo, String functions

select 
    employee_id,
    case when employee_id % 2 = 0 then 0
        when left(name, 1) = 'M' then 0
        else salary end as bonus
from employees
order by employee_id
