/*13. Напишите запрос, который показывает количество позиций счет-фактур в каждой стране. На выходе в первой колонке должно быть количество позиций 
счет-фактур, во второй название страны. HINT: GROUP BY*/
SELECT Count(*),
       i.billingcountry
FROM InvoiceLine il
JOIN invoice i
ON il.invoiceId = i.invoiceId
GROUP  BY i.billingcountry;
