/*23. Напишите запрос, который показывает треки 2013 года, отсортированные по количеству проданных экземпляров. На выходе в первой колонке 
должно быть название трека, во второй в отсортированном по убыванию порядку количество экземпляров трека.*/
SELECT t.name,
       Count(il.invoiceid) AS Quantity
FROM   track t
       JOIN invoiceline il
         ON t.trackid = il.trackid
       JOIN invoice i
         ON i.invoiceid = il.invoiceid
WHERE  Strftime('%Y', i.invoicedate) = '2013'
GROUP  BY t.name
ORDER  BY quantity DESC;  