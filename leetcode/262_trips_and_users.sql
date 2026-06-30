-- Problem: Trips and Users
-- Source: LeetCode #262
-- Link: https://leetcode.com/problems/trips-and-users/description/
-- Difficulty: Hard
-- Language: MS SQL Server
-- Topics: Left Join, CASE WHEN, GROUP BY, Aggregation, Date Filtering

select 
    request_at as Day, 
    round((sum(cancelled_ride) * 1.0) / count(trip_id), 2) as [Cancellation Rate]
from (
    select 
        t.id as trip_id,
        t.client_id,
        t.driver_id,
        t.city_id,
        t.status,
        t.request_at,
        case when t.status like 'cancel%' then 1 else 0 end as cancelled_ride
    from trips as t
    left join users as u1
        on t.client_id = u1.users_id
    left join users as u2
        on t.driver_id = u2.users_id
    where u1.banned = 'No' and u2.banned = 'No'
) as aa
where request_at between '2013-10-01' and '2013-10-03'
group by request_at
