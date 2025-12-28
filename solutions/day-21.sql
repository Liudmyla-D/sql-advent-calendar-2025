-- SQL Advent Calendar - Day 21
-- Title: Fireside Story Running Total
-- Difficulty: hard
--
-- Question:
-- The Snow Queen hosts nightly fireside chats and records how many stories she tells each evening. Can you calculate the running total of stories she has shared over time, in the order they were told?
--
-- The Snow Queen hosts nightly fireside chats and records how many stories she tells each evening. Can you calculate the running total of stories she has shared over time, in the order they were told?
--

-- Table Schema:
-- Table: story_log
--   log_date: DATE
--   stories_shared: INT
--

-- My Solution:

select log_date, stories_shared
  , sum(stories_shared) over (order by log_date) as running_total
from story_log
order by 1
