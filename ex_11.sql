/*11. Напишите запрос, который включает название трека для каждой позиции из таблицы InvoiceLine. На выходе в первой колонке должен быть идентификатор 
счет-фактуры, во второй название трека.*/
SELECT il.InvoiceId,
       t.name
FROM invoiceline il
JOIN Track t
ON il.TrackId=t.TrackId
GROUP BY t.name;