-- #First Login Analysis
SELECT player_id,
        MIN(event_date) AS first_login
FROM Activity
GROUP BY player_id
ORDER BY player_id;

-- Employee Work Time Summary
SELECT event_day AS day,
emp_id,
SUM(out_time-in_time) AS total_time
FROM 
Employees
GROUP BY event_day,emp_id
ORDER BY event_day,emp_id;

-- Unique Subjects per Teacher
SELECT 
    teacher_id,
    COUNT(DISTINCT subject_id) AS cnt
FROM Teacher
GROUP BY teacher_id;

-- User Follower Count
SELECT 
    user_id,
    COUNT(DISTINCT follower_id) AS followers_count
FROM Followers
GROUP BY user_id;

-- CRM Automotive Sales Analysis
SELECT 
    date_id,
    make_name,
    COUNT(DISTINCT lead_id) AS unique_leads,
    COUNT(DISTINCT partner_id) AS unique_partners
FROM DailySales
GROUP BY date_id,make_name
ORDER BY date_id,make_name;

-- Highest Order Placing Customer
SELECT 
    customer_number
FROM
     Orders
GROUP BY customer_number
ORDER BY COUNT(*) DESC
LIMIT 1;
