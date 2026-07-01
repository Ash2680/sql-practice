-- Problem: Recyclable and Low Fat Products
-- Source: LeetCode #1757
-- Link: https://leetcode.com/problems/recyclable-and-low-fat-products/description/
-- Difficulty: Easy
-- Language: MS SQL Server
-- Topics: Filtering, WHERE

select
    product_id
from products
where low_fats = 'Y' and recyclable = 'Y'
