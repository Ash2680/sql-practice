-- Problem: Combine Two Tables
-- Source: LeetCode #175
-- Link: https://leetcode.com/problems/combine-two-tables/
-- Difficulty: Easy
-- Language: MS SQL Server
-- Topics: LEFT JOIN, NULL handling

select 
  person.firstName, 
  person.lastName, 
  address.city, 
  address.state
from person
left join address
  on person.personId  = address.personId
