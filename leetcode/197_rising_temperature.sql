-- Problem: Rising Temperature
-- Source: LeetCode #197
-- Link: https://leetcode.com/problems/rising-temperature/
-- Difficulty: Easy
-- Language: MS SQL Server
-- Topics: Window functions, LAG, DATEDIFF, Subquery

select id
from (
    select 
        id, 
        recordDate, 
        lag(recordDate) over (order by recordDate) as lag_recordDate,
        temperature, 
        lag(temperature) over (order by recordDate) as lag_temp
    from weather
) as aa
where temperature > lag_temp
  and datediff(day, lag_recordDate, recordDate) = 1
