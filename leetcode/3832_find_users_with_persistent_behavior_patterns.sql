-- Problem: Find Users With Persistent Behavior Patterns
-- Source: LeetCode #3832
-- Link: https://leetcode.com/problems/find-users-with-persistent-behavior-patterns/description/
-- Difficulty: Hard
-- Language: PostgreSQL
-- Topics: CTE, Window functions, ROW_NUMBER, Consecutive rows, Island detection

with islands as (
    SELECT
        user_id,
        action,
        action_date,
        action_date - ROW_NUMBER() OVER (
            PARTITION BY user_id, action
            ORDER BY action_date
        )::int AS island_id
    FROM activity
),

streak as (
    SELECT
        user_id,
        action,
        COUNT(*)                        AS streak_length,
        MIN(action_date)                AS start_date,
        MAX(action_date)                AS end_date
    FROM islands
    GROUP BY user_id, action, island_id
),

best_streak AS (
    SELECT
        user_id,
        action,
        streak_length,
        start_date,
        end_date,
        ROW_NUMBER() OVER (
            PARTITION BY user_id
            ORDER BY streak_length DESC, start_date
        )                               AS rnk
    FROM streak
    WHERE streak_length >= 5
)

SELECT
    user_id,
    action,
    streak_length,
    start_date,
    end_date
FROM best_streak
WHERE rnk = 1
ORDER BY streak_length DESC, user_id;
