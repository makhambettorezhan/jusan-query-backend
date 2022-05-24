/*2. A query that returns customers name from Brazil */
SELECT c.firstname || ' ' || c.lastname as Customer
FROM   customer c
WHERE  c.country = 'Brazil';