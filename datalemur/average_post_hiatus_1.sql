-- Problem: Average Post Hiatus (Part 1)
-- Source: DataLemur
-- Link: https://datalemur.com/questions/sql-average-post-hiatus-1
-- Difficulty: Easy
-- Language: PostgreSQL
-- Topics: GROUP BY, Aggregation, HAVING, EXTRACT, Date arithmetic
-- Note: DATEDIFF (commented out) is T-SQL syntax — not valid in PostgreSQL.
--       PostgreSQL date subtraction returns an INTERVAL; EXTRACT(DAY FROM ...) 
--       pulls the integer day count from it.

select 
    user_id,
    -- datediff(day, min(post_date), max(post_date)) as days_between
    extract(day from max(post_date) - min(post_date)) as days_between
from posts
where extract(year from post_date) = 2021
group by user_id
having count(post_id) >= 2;
