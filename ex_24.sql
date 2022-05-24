/*24. Напишите запрос, который показывает топ-5 самых покупаемых треков за все время. На выходе в первой колонке должно быть название трека, 
во второй в отсортированном по убыванию порядке количество экземпляров трека.*/
SELECT t.name,
       COUNT(il.quantity) AS Quantity
FROM   invoiceline il
       LEFT JOIN invoice i
              ON i.invoiceid = il.invoiceid
       LEFT JOIN track t
              ON t.trackid = il.trackid
GROUP  BY t.Name
ORDER  BY quantity DESC
LIMIT  5;