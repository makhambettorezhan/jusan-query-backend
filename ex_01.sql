 /*1. A query that outputs id, name, lastname of customers out of US */
SELECT c.customerid,
       c.firstname,
       c.lastname,
       c.country
FROM   customer c
WHERE  c.country <> 'US';