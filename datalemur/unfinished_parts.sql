-- Problem: Unfinished Parts
-- Source: DataLemur
-- Link: https://datalemur.com/questions/tesla-unfinished-parts
-- Difficulty: Easy
-- Language: PostgreSQL
-- Topics: Filtering, WHERE, NULL handling

select part, assembly_step
from parts_assembly
where finish_date is null;
