-- Problem: Combine Two Tables
-- Source: LeetCode #175
-- Link: https://leetcode.com/problems/combine-two-tables/
-- Difficulty: Easy
-- Topics: LEFT JOIN, NULL handling
-- Approach: LEFT JOIN ensures all persons appear even without a matching address — city and state return NULL if no address exists

select 
  person.firstName, 
  person.lastName, 
  address.city, 
  address.state
from person
left join address
  on person.personId  = address.personId
