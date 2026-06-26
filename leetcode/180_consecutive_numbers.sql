-- Problem: Consecutive Numbers
-- Source: LeetCode #180
-- Link: https://leetcode.com/problems/consecutive-numbers/description/
-- Difficulty: Medium
-- Language: MS SQL Server
-- Topics: Window functions, LAG, Subquery, DISTINCT

select distinct num as ConsecutiveNums  
from (
    select 
        num, 
        lag(num,1) over (order by id) as lag1, 
        lag(num,2) over (order by id) as lag2 
    from logs 
) as aa 
where num = lag1 
  and lag1 = lag2
