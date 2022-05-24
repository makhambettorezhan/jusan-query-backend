/*22. Напишите запрос, который показывает общий объем продаж по странам. На выходе в первой колонке должно быть название страны, во второй в отсортированном 
по убыванию сумма счет-фактур.*/
SELECT i.billingcountry,
       Sum(i.total) AS Total
FROM   invoice i
GROUP  BY i.billingcountry
ORDER  BY total desc;