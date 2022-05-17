/*11. Напишите запрос, который включает название трека для каждой позиции из таблицы InvoiceLine. На выходе в первой колонке должен быть идентификатор 
счет-фактуры, во второй название трека.*/
SELECT il.invoiceid,
       t.name
FROM   invoiceline il
       JOIN track t
         ON t.trackid = il.invoiceid;