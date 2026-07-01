-- Problem: Find Emotionally Consistent Users
-- Source: LeetCode #3808
-- Link: https://leetcode.com/problems/find-emotionally-consistent-users/description/
-- Difficulty: Medium
-- Language: PostgreSQL
-- Topics: CTE, Window functions, DENSE_RANK, Conditional Aggregation, Ratio calculation

with base as (
    select
        user_id,
        reaction,
        count(content_id) as reaction_count,
        sum(count(content_id)) over (partition by user_id) as total_reactions
    from reactions
    group by user_id, reaction
),

ranked as (
    select
        user_id,
        reaction,
        round(reaction_count * 1.0 / total_reactions, 2) as reaction_ratio,
        dense_rank() over (partition by user_id order by reaction_count desc) as rnk
    from base
    where total_reactions >= 5
        -- filter early, not at the end
)

select
    user_id,
    reaction as dominant_reaction,
    reaction_ratio
from ranked
where rnk = 1
    and reaction_ratio >= 0.6
order by reaction_ratio desc, user_id
