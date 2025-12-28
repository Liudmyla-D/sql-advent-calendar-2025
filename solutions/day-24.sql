-- SQL Advent Calendar - Day 24
-- Title: New Year Goals - User Type Analysis
-- Difficulty: hard
--
-- Question:
-- As the New Year begins, the goals tracker team wants to understand how user types differ. How many completed goals does the average user have in each user_type?
--
-- As the New Year begins, the goals tracker team wants to understand how user types differ. How many completed goals does the average user have in each user_type?
--

-- Table Schema:
-- Table: user_goals
--   user_id: INT
--   user_type: VARCHAR
--   goal_id: INT
--   goal_status: VARCHAR
--

-- My Solution:

with cnt_goals as (
  select user_id, user_type, count(goal_id) as goal_cnt
  from user_goals
  where goal_status = 'Completed'
  group by 1,2 
)
SELECT user_type, avg(goal_cnt) as avg_goals
from cnt_goals
group by 1
