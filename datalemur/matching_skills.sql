-- Problem: Matching Skills
-- Source: DataLemur
-- Link: https://datalemur.com/questions/matching-skills
-- Difficulty: Easy
-- Language: PostgreSQL
-- Topics: CTE, Subquery, Conditional Aggregation, CASE WHEN, Pivoting

-- Approach 1 (Subquery): FLAG each skill separately, filter where all three are 1
select candidate_id
from (
    select 
        candidate_id,
        max(case when skill = 'Python' then 1 else 0 end) as flag1,
        max(case when skill = 'Tableau' then 1 else 0 end) as flag2,  
        max(case when skill = 'PostgreSQL' then 1 else 0 end) as flag3
    from candidates
    group by candidate_id
) aa
where flag1 = 1 and flag2 = 1 and flag3 = 1
order by candidate_id asc;

-- -- Approach 2 (CTE): SUM each skill, filter where total = 3 (cleaner condition)
-- with skills as (
--     select 
--         candidate_id,
--         sum(case when skill = 'Python' then 1 else 0 end) as python,
--         sum(case when skill = 'Tableau' then 1 else 0 end) as tableau,
--         sum(case when skill = 'PostgreSQL' then 1 else 0 end) as postgresql
--     from candidates
--     group by candidate_id
-- )

-- select 
--     candidate_id
-- from skills
-- where python + tableau + postgresql = 3
-- order by candidate_id asc;
