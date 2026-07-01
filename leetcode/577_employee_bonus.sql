-- Problem: Employee Bonus
-- Source: LeetCode #577
-- Link: https://leetcode.com/problems/employee-bonus/description/
-- Difficulty: Easy
-- Language: MS SQL Server
-- Topics: Left Join, NULL handling

select
    e.name,
    b.bonus
from employee as e
left join bonus as b
    on e.empId = b.empId 
where b.bonus is null or b.bonus < 1000
