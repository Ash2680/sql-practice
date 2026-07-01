-- Problem: Laptop vs. Mobile Viewership
-- Source: DataLemur
-- Link: https://datalemur.com/questions/laptop-mobile-viewership
-- Difficulty: Easy
-- Language: PostgreSQL
-- Topics: Conditional Aggregation, CASE WHEN, COUNT

select 
    count(case when device_type = 'laptop' then user_id end) as laptop_views,
    count(case when device_type in ('tablet', 'phone') then user_id end) as mobile_views 
from viewership;
