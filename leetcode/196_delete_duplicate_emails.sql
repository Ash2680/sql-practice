-- Problem: Delete Duplicate Emails
-- Source: LeetCode #196
-- Link: https://leetcode.com/problems/delete-duplicate-emails/description/
-- Difficulty: Easy
-- Language: MS SQL Server
-- Topics: Window functions, ROW_NUMBER, DELETE, Subquery (deletable CTE)

delete p
from (
    select 
        id,
        row_number() over (partition by email order by id) as rn
    from person
) as p
where rn > 1
