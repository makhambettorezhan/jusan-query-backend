/*3. A query that returns customers from Brazil with their invoice ID */
SELECT c.firstname,
       c.lastname,
       i.invoiceid,
       i.invoicedate,
       c.country
FROM   customer c
       JOIN invoice i
         ON c.customerid = i.customerid
WHERE  c.country = 'Brazil';