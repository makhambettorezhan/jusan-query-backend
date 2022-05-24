/*4. A query that prints employees who are in sales*/
SELECT e.firstname || ' ' || e.lastname as Employee
FROM   employee e
WHERE  e.title = 'Sales Support Agent';