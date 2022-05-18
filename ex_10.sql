/*10. Просматривая таблицу InvoiceLine, напишите запрос, который подсчитывает количество позиций для каждой счета-фактуры. На выходе в первой колонке должен быть
 идентификатор счет-фактуры, во второй количество позиций. HINT: GROUP BY.*/
SELECT Count(il.invoiceid),
       il.invoicelineid
FROM   invoiceline il
       LEFT JOIN invoice i
       ON i.invoiceid = il.invoiceid
GROUP BY i.invoiceid;