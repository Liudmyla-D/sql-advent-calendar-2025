-- SQL Advent Calendar - Day 15
-- Title: The Grinch's Mischief Tracker
-- Difficulty: hard
--
-- Question:
-- The Grinch is tracking his daily mischief scores to see how his behavior changes over time. Can you find how many points his score increased or decreased each day compared to the previous day?
--
-- The Grinch is tracking his daily mischief scores to see how his behavior changes over time. Can you find how many points his score increased or decreased each day compared to the previous day?
--

-- Table Schema:
-- Table: grinch_mischief_log
--   log_date: DATE
--   mischief_score: INTEGER
--

-- My Solution:

with prev_scores as(
  SELECT log_date, mischief_score, lag(mischief_score) over() as prev_score
  from grinch_mischief_log
)
select log_date, mischief_score, (mischief_score-prev_score) as changing
from prev_scores
