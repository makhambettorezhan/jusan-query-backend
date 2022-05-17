/*4. A query that prints employees who are in sales*/
SELECT e.firstname,
       e.lastname,
       e.title
FROM   employee e
WHERE  title LIKE '%sales%'
        OR '%agent%';