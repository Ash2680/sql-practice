-- Problem: Department Highest Salary
-- Source: LeetCode #184
-- Link: https://leetcode.com/problems/department-highest-salary/description/
-- Difficulty: Medium
-- Language: MS SQL Server
-- Topics: Window functions, MAX OVER PARTITION BY, Left Join, Subquery

select 
    dept_name as Department, 
    emp_name as Employee, 
    emp_salary as Salary
from (
    select 
        d.name as dept_name,
        e.name as emp_name,
        e.salary as emp_salary,
        max(e.salary) over (partition by d.name) as max_dep_salary
    from employee as e
    left join Department as d
        on e.departmentId = d.id
) as aa
where emp_salary = max_dep_salary
