-- Problem: Completed Trades
-- Source: DataLemur
-- Link: https://datalemur.com/questions/completed-trades
-- Difficulty: Easy
-- Language: PostgreSQL
-- Topics: Left Join, Subquery, GROUP BY, Aggregation, ORDER BY, LIMIT

select
    city, count(order_id) as total_orders
from (
    select 
        u.city,
        u.user_id,
        t.order_id
    from users as u
    left join trades as t
        on u.user_id = t.user_id
    where t.status = 'Completed'
) as aa
group by city
order by count(order_id) desc
limit 3;
