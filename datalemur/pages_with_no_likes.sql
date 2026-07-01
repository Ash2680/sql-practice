-- Problem: Pages with No Likes
-- Source: DataLemur
-- Link: https://datalemur.com/questions/sql-page-with-no-likes
-- Difficulty: Easy
-- Language: PostgreSQL
-- Topics: Left Join, Subquery, NULL handling, Aggregation

select page_id
from (
    select 
        p.page_id,
        count(pl.liked_date) as likes
    from pages as p
    left join page_likes as pl
        on p.page_id = pl.page_id
    group by p.page_id
) as aa
where likes = 0 
order by page_id;
