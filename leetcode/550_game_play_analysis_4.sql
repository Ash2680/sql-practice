-- Problem: Game Play Analysis IV
-- Source: LeetCode #550
-- Link: https://leetcode.com/problems/game-play-analysis-iv/description/
-- Difficulty: Medium
-- Language: MS SQL Server
-- Topics: Window functions, ROW_NUMBER, Conditional Aggregation, Pivoting, DATEDIFF

select 
    round(count(case when datediff(day, first_login, second_login) = 1 then player_id end) * 1.0 / count(*), 2) as fraction
from (
    select 
        player_id, 
        max(case when counter = 1 then event_date end) as first_login,
        max(case when counter = 2 then event_date end) as second_login
    from (
        select 
            player_id,
            event_date,
            row_number() over (partition by player_id order by event_date) as counter
        from activity
    ) as aa
    group by player_id
) as ab
