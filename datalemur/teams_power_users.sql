-- Problem: Teams Power Users
-- Source: DataLemur
-- Link: https://datalemur.com/questions/teams-power-users
-- Difficulty: Easy
-- Language: PostgreSQL
-- Topics: GROUP BY, Aggregation, DATE_TRUNC, ORDER BY, LIMIT

select
    sender_id as user_id,
    count(message_id) as message_count
from messages
where date_trunc('month', sent_date) = '2022-08-01'
group by sender_id
order by count(message_id) desc
limit 2;
