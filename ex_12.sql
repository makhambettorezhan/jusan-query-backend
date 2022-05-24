/*12. Напишите запрос, который включает название приобретенного трека и имя исполнителя для каждой позиции счета-фактуры из таблицы InvoiceLine. 
На выходе в первой колонке должен быть идентификатор счет-фактуры, во второй название трека, в третьей имя исполнителя.*/
SELECT il.invoiceid,
       t.name,
       art.name
FROM   invoiceline il
       LEFT JOIN track t
         ON t.trackid = il.trackId
       LEFT JOIN album a
         ON a.albumid = t.albumid
       LEFT JOIN artist art
         ON art.artistid = a.artistid
GROUP BY t.Name;