-- Frequent Actor-Director Duos
SELECT 
    actor_id,
    director_id
FROM ActorDirector
GROUP BY actor_id,director_id
HAVING COUNT(*)>=3;

-- Large Classes
SELECT class
FROM Courses
GROUP BY class
HAVING COUNT(*)>=5;

-- Email Duplicates
SELECT email
FROM Person
GROUP BY email
HAVING COUNT(*)>1;