-- SQL Advent Calendar - Day 12
-- Title: North Pole Network Most Active Users
-- Difficulty: hard
--
-- Question:
-- The North Pole Network wants to see who's the most active in the holiday chat each day. Write a query to count how many messages each user sent, then find the most active user(s) each day. If multiple users tie for first place, return all of them.
--
-- The North Pole Network wants to see who's the most active in the holiday chat each day. Write a query to count how many messages each user sent, then find the most active user(s) each day. If multiple users tie for first place, return all of them.
--

-- Table Schema:
-- Table: npn_users
--   user_id: INT
--   user_name: VARCHAR
--
-- Table: npn_messages
--   message_id: INT
--   sender_id: INT
--   sent_at: TIMESTAMP
--

-- My Solution:

with counts as (
  select u.user_name, date(m.sent_at) as day, count(m.message_id) as count_msg
  from npn_users u
  join npn_messages m ON u.user_id = m.sender_id
  group by date(m.sent_at), m.sender_id
  ),
  ranked as (
  SELECT day, user_name, count_msg,
          dense_rank () over (partition by day order by count_msg desc) as rnk  
  from counts
  )
SELECT user_name, day, count_msg
  from ranked
where rnk = 1
order by 2, 1
