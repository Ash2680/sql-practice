-- Problem: Employees Earning More Than Their Managers
-- Source: LeetCode #181
-- Link: https://leetcode.com/problems/employees-earning-more-than-their-managers/description/
-- Difficulty: Easy
-- Language: MS SQL Server
-- Topics: Self Join

select 
  e.name as Employee
from employee as e
left join employee as m
    on e.managerId = m.id
where e.salary > m.salary
