-- SQL Advent Calendar - Day 18
-- Title: 12 Days of Data - Progress Tracking
-- Difficulty: hard
--
-- Question:
-- Over the 12 days of her data challenge, Data Dawn tracked her daily quiz scores across different subjects. Can you find each subject's first and last recorded score to see how much she improved?
--
-- Over the 12 days of her data challenge, Data Dawn tracked her daily quiz scores across different subjects. Can you find each subject's first and last recorded score to see how much she improved?
--

-- Table Schema:
-- Table: daily_quiz_scores
--   subject: VARCHAR
--   quiz_date: DATE
--   score: INTEGER
--

-- My Solution:

with ranked as (
  select subject, quiz_date, score, row_number () over (partition by subject order by quiz_date) as min
  , row_number () over (partition by subject order by quiz_date desc) as max
from daily_quiz_scores
)
SELECT subject, max (case when min = 1 then quiz_date end) as first_date
, max (case when min = 1 then score end) as first_score
, max (case when max = 1 then quiz_date end) as last_date
, max (case when max = 1 then score end) as last_score
, max (case when max = 1 then score end) - max (case when min = 1 then score end) as dif_score
from ranked
group by subject
