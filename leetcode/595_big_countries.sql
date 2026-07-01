-- Problem: Big Countries
-- Source: LeetCode #595
-- Link: https://leetcode.com/problems/big-countries/description/
-- Difficulty: Easy
-- Language: MS SQL Server
-- Topics: Filtering, WHERE, OR condition

select 
    name, population, area
from world
where area >= 3000000 or population >= 25000000
