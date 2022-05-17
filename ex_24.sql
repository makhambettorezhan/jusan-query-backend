/*24. Напишите запрос, который показывает топ-5 самых покупаемых треков за все время. На выходе в первой колонке должно быть название трека, 
во второй в отсортированном по убыванию порядке количество экземпляров трека.*/
SELECT t.name,
       Sum(il.quantity) AS Quantity
FROM   invoiceline il
       LEFT JOIN invoice i
              ON i.invoiceid = il.invoiceid
       LEFT JOIN track t
              ON t.trackid = il.trackid
WHERE  Strftime('%Y', invoicedate) = '2013'
GROUP  BY t.trackid
ORDER  BY quantity DESC
LIMIT  5;  