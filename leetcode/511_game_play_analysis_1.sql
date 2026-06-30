-- Problem: Game Play Analysis I
-- Source: LeetCode #511
-- Link: https://leetcode.com/problems/game-play-analysis-i/description/
-- Difficulty: Easy
-- Language: MS SQL Server
-- Topics: Window functions, ROW_NUMBER, Subquery

select 
    player_id, 
    event_date as first_login  
from (
    select 
        player_id, 
        event_date, 
        row_number() over (partition by player_id order by event_date) as counter
    from activity
) as aa
where counter = 1
