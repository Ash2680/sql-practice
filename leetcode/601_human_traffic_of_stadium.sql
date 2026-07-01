-- Problem: Human Traffic of Stadium
-- Source: LeetCode #601
-- Link: https://leetcode.com/problems/human-traffic-of-stadium/description/
-- Difficulty: Hard
-- Language: MS SQL Server
-- Topics: CTE, Window functions, ROW_NUMBER, GROUP BY, HAVING, Consecutive rows

with base as (
    select 
        id,
        visit_date,
        people,
        id - row_number() over (order by id) as slab
    from stadium
    where people >= 100
) 

select id, visit_date, people
from base
where slab in (select slab from base group by slab having count(*) >= 3)
