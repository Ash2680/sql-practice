-- Problem: Customers Who Never Order
-- Source: LeetCode #183
-- Link: https://leetcode.com/problems/customers-who-never-order/description/
-- Difficulty: Easy
-- Language: MS SQL Server
-- Topics: Left Join, GROUP BY, HAVING, Subquery

select customer as customers
from (
    select 
        c.id as cust_id, 
        c.name as customer, 
        count(o.id) as orders
    from customers as c
    left join orders as o
        on c.id = o.customerId  
    group by c.id, c.name
    having count(o.id) = 0
) as aa
