/*5. A query that outputs a country list where that have invoice accounts*/
SELECT DISTINCT i.billingcountry
FROM   invoice i
WHERE  i.billingcountry <> 'NULL';