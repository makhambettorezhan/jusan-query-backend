 /*1. A query that outputs id, name, lastname of customers out of US */
SELECT c.firstname || ' ' || c.lastname as Customer,
       c.customerid,
       c.country
FROM   customer c
WHERE  c.country <> 'USA';