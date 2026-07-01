-- Problem: Histogram of Tweets
-- Source: DataLemur
-- Link: https://datalemur.com/questions/sql-histogram-tweets
-- Difficulty: Easy
-- Language: PostgreSQL
-- Topics: CTE, Subquery, GROUP BY, Aggregation, DATE_TRUNC, EXTRACT

-- Approach 1 (CTE): DATE_TRUNC to filter by year, cleaner to read
with user_tweets as (
    select 
        user_id,
        count(tweet_id) as tweet_bucket
    from tweets 
    where date_trunc('year', tweet_date) between '2022-01-01' and '2022-12-31'
    group by user_id
)

select
    tweet_bucket,
    count(user_id) as users_num
from user_tweets
group by tweet_bucket;

-- -- Approach 2 (Subquery): EXTRACT to filter by year, slightly more concise
-- select
--     tweet_bucket,
--     count(user_id) as users_num
-- from (
--     select 
--         user_id,
--         count(tweet_id) as tweet_bucket
--     from tweets
--     where extract(year from tweet_date) = 2022
--     group by user_id
-- ) as aa
-- group by tweet_bucket;
