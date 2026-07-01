-- Problem: Duplicate Job Listings
-- Source: DataLemur
-- Link: https://datalemur.com/questions/duplicate-job-listings
-- Difficulty: Easy
-- Language: PostgreSQL
-- Topics: Subquery, GROUP BY, Aggregation, HAVING, Deduplication

select count(company_id) as duplicate_companies
from (
    select 
        company_id, title, description, count(*) as counter
    from job_listings
    group by company_id, title, description
) as aa
where counter > 1;
