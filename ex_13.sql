/*13. Напишите запрос, который показывает количество позиций счет-фактур в каждой стране. На выходе в первой колонке должно быть количество позиций 
счет-фактур, во второй название страны. HINT: GROUP BY*/
SELECT Count(i.invoiceid),
       i.billingcountry
FROM   invoice i
GROUP  BY i.billingcountry;