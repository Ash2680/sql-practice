-- Problem: Department Top Three Salaries
-- Source: LeetCode #185
-- Link: https://leetcode.com/problems/department-top-three-salaries/description/
-- Difficulty: Hard
-- Language: MS SQL Server
-- Topics: Window functions, DENSE_RANK, Left Join, Subquery

select 
    department, 
    employee, 
    salary
from (
    select 
        d.name as department, 
        e.name as employee, 
        e.salary,
        dense_rank() over (partition by d.name order by e.salary desc) as salary_rank
    from employee as e
    left join department as d
        on e.departmentId = d.id
) as aa
where salary_rank <= 3
