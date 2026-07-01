-- Problem: Find Golden Hour Customers
-- Source: LeetCode #3705
-- Link: https://leetcode.com/problems/find-golden-hour-customers/description/
-- Difficulty: Medium
-- Language: PostgreSQL
-- Topics: CTE, Conditional Aggregation, EXTRACT, Ratio filtering

with base as (
    select 
        customer_id,
        count(
            case 
                when extract(hour from order_timestamp) in (11, 12, 13, 18, 19, 20) then order_id
            end) as peak_order_count,
        count(order_id) as order_count,
        round(avg(order_rating), 2) as avg_rating,
        count(order_rating) as rating_count
    from restaurant_orders
    group by customer_id
)

select 
    customer_id,
    order_count as total_orders,
    round((100.0 * peak_order_count / order_count), 0) as peak_hour_percentage,
    avg_rating as average_rating
from base
where (order_count >= 3)
    and (peak_order_count * 1.0 / order_count >= 0.6)
    and (avg_rating >= 4)
    and (rating_count * 1.0 / order_count >= 0.5)
order by average_rating desc, customer_id desc
