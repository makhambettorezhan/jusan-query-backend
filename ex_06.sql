/*6. A query that returns invoice id associated with Employee */
SELECT i.invoiceid,
       e.firstname,
       e.lastname
FROM   employee e
       JOIN customer c
         ON c.supportrepid = e.employeeid
       JOIN invoice i
         ON i.customerid = c.customerid
		 where e.title like '%sales%'
		 order by i.InvoiceId;
