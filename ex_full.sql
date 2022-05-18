 /*1. A query that outputs id, name, lastname of customers out of US */
SELECT c.customerid,
       c.firstname,
       c.lastname,
       c.country
FROM   customer c
WHERE  c.country <> 'US';

/*2. A query that returns customers name from Brazil */
SELECT c.firstname,
       c.lastname
FROM   customer c
WHERE  c.country = 'Brazil';

/*3. A query that returns customers from Brazil with their invoice ID */
SELECT c.firstname,
       c.lastname,
       i.invoiceid,
       i.invoicedate,
       c.country
FROM   customer c
       JOIN invoice i
         ON c.customerid = i.customerid
WHERE  c.country = 'Brazil';

/*4. A query that prints employees who are in sales*/
SELECT e.firstname,
       e.lastname,
       e.title
FROM   employee e
WHERE  title LIKE '%sales%'
        OR '%agent%';

/*5. A query that outputs a country list where that have invoice accounts*/
SELECT DISTINCT i.billingcountry
FROM   invoice i
WHERE  i.billingcountry <> 'NULL';

/*6. A query that returns invoice id associated with Employee */
SELECT i.invoiceid,
       e.firstname,
       e.lastname
FROM   employee e
       JOIN customer c
         ON c.supportrepid = e.employeeid
       JOIN invoice i
         ON i.customerid = c.customerid;

/*7. Напишите запрос, который показывает общую сумму счета, имя клиента, страну и имя агента по продаже для всех счетов и клиентов. На выходе в первой 
колонке должна быть общая стоимость счет-фактуры, во второй имя и фамилия покупателя, в третьей страна выставления счета, в четвертой имя и фамилия продавца.*/
SELECT i.total,
       c.firstname || ' ' || c.lastname as Customer,
       c.country,
       e.firstname || ' ' || e.lastname as Employee
FROM   customer c
       LEFT JOIN employee e
         ON e.employeeid = c.supportrepid
       LEFT JOIN invoice i
         ON i.customerid = c.customerid;

/*8. NOT SURE YET. Сколько счетов было выставлено в 2009 и 2011 годах? Каковы соответствующие объемы продаж за каждый год? На выходе в первой колонке должен быть 
год выставления счет-фактуры, во второй сумма стоимостей всех счет-фактур.*/
SELECT i.invoicedate,
       i.total
FROM   invoice i
WHERE  Strftime('%Y', i.invoicedate) = '2009'
        OR Strftime('%Y', i.invoicedate) = '2011';

/*9. Просматривая таблицу InvoiceLine, напишите запрос, который подсчитывает количество позиций для счета-фактуры с InvoiceId 37. На выходе в первой колонке
 должно быть количество позиций.*/
SELECT Count(*)
FROM   invoiceline il
WHERE  il.invoiceid = 37;

/*10. Просматривая таблицу InvoiceLine, напишите запрос, который подсчитывает количество позиций для каждой счета-фактуры. На выходе в первой колонке должен быть
 идентификатор счет-фактуры, во второй количество позиций. HINT: GROUP BY.*/
SELECT Count(il.invoiceid),
       il.invoicelineid
FROM   invoiceline il
       LEFT JOIN invoice i
       ON i.invoiceid = il.invoiceid
GROUP BY i.invoiceid;

/*11. Напишите запрос, который включает название трека для каждой позиции из таблицы InvoiceLine. На выходе в первой колонке должен быть идентификатор 
счет-фактуры, во второй название трека.*/
SELECT il.invoiceid,
       t.name
FROM   invoiceline il
       JOIN track t
         ON t.trackid = il.invoiceid;

/*12. Напишите запрос, который включает название приобретенного трека и имя исполнителя для каждой позиции счета-фактуры из таблицы InvoiceLine. 
На выходе в первой колонке должен быть идентификатор счет-фактуры, во второй название трека, в третьей имя исполнителя.*/
SELECT il.invoiceid,
       t.name,
       art.name
FROM   invoiceline il
       JOIN track t
         ON t.trackid = il.invoiceid
       JOIN album a
         ON a.albumid = t.albumid
       JOIN artist art
         ON art.artistid = a.artistid;

/*13. Напишите запрос, который показывает количество позиций счет-фактур в каждой стране. На выходе в первой колонке должно быть количество позиций 
счет-фактур, во второй название страны. HINT: GROUP BY*/
SELECT Count(i.invoiceid),
       i.billingcountry
FROM   invoice i
GROUP  BY i.billingcountry;

/*14. Напишите запрос, который показывает общее количество треков в каждом Playlist.
 На выходе в первой колонке должно быть количество треков, во второй название плейлиста.*/
SELECT Count(t.trackid),
       p.name
FROM   track t
       JOIN playlisttrack pt
         ON pt.trackid = t.trackid
       JOIN playlist p
         ON p.playlistid = pt.playlistid
GROUP  BY p.name;

/*
15. Напишите запрос, который показывает все треки, но не отображает их идентификаторы. На выходе в первой колонке должно быть название трека, 
во второй название альбома, в третье медиа-тип, в четвертой жанр трека.
*/
SELECT t.name,
       a.title,
       g.name,
       m.name
FROM   track t
       JOIN album a
         ON t.trackid = a.albumid
       JOIN genre g
         ON t.genreid = g.genreid
       JOIN mediatype m
         ON t.mediatypeid = m.mediatypeid;

/*16. Напишите запрос, который показывает все счета-фактуры и количество позиций. На выходе в первой колонке должен быть 
идентификатор счет-фактуры, во второй количество позиций в счет-фактуре.*/
select il.InvoiceId, COUNT(il.InvoiceLineId) as 'Positions'
from InvoiceLine il
group by il.InvoiceId;

/*17. Напишите запрос, который показывает общий объем продаж, совершенных каждым торговым агентом. 
На выходе в первой колонке должна быть сумма продаж, во второй имя и фамилия продавца.*/
SELECT Sum(i.total),
       e.firstname,
       e.lastname
FROM   employee e
       LEFT JOIN customer c
              ON c.supportrepid = e.employeeid
       LEFT JOIN invoice i
              ON i.customerid = c.customerid
WHERE  e.title LIKE '%sales%'
        OR '%agent%'
GROUP  BY e.employeeid;

/*18. Какой торговый агент сделал самый большой объем продаж в 2009 году? На выходе в первой колонке должна быть сумма продаж, во второй имя и фамилия продавца.*/
SELECT Max(total),
       fullname
FROM   (SELECT Sum(i.total)      AS Total,
               ( e.firstname
                 || ' '
                 || e.lastname ) AS FullName
        FROM   employee e
               LEFT JOIN customer c
                      ON c.supportrepid = e.employeeid
               LEFT JOIN invoice i
                      ON i.customerid = c.customerid
        WHERE  e.title = 'Sales Support Agent'
               AND Strftime('%Y', i.invoicedate) = '2009'
        GROUP  BY e.employeeid);

/*19. Какой торговый агент добился наибольшего объема продаж в 2010 году? На выходе в первой колонке должна быть сумма продаж, во второй имя и фамилия продавца.*/
SELECT Max(total),
       fullname
FROM   (SELECT Sum(i.total)      AS Total,
               ( e.firstname
                 || ' '
                 || e.lastname ) AS FullName
        FROM   employee e
               LEFT JOIN customer c
                      ON c.supportrepid = e.employeeid
               LEFT JOIN invoice i
                      ON i.customerid = c.customerid
        WHERE  e.title = 'Sales Support Agent'
               AND Strftime('%Y', invoicedate) = '2010'
        GROUP  BY e.employeeid);

/*20. Какой торговый агент сделал больше всего по объему продаж за все время? На выходе в первой колонке должна быть сумма продаж, во второй имя и фамилия продавца.*/
SELECT Max(total),
       fullname
FROM   (SELECT Sum(i.total)      AS Total,
               ( e.firstname
                 || ' '
                 || e.lastname ) AS FullName
        FROM   employee e
               LEFT JOIN customer c
                      ON c.supportrepid = e.employeeid
               LEFT JOIN invoice i
                      ON i.customerid = c.customerid
        WHERE  e.title = 'Sales Support Agent'
        GROUP  BY e.employeeid);

/*21. Напишите запрос, который показывает количество клиентов, назначенных каждому торговому агенту. На выходе в первой колонке должно быть 
количество клиентов, во второй имя и фамилия продавца.*/
SELECT Count(c.customerid) AS Total,
       ( e.firstname
         || ' '
         || e.lastname )   AS FullName
FROM   employee e
       LEFT JOIN customer c
              ON c.supportrepid = e.employeeid
WHERE  e.title = 'Sales Support Agent'
GROUP  BY e.employeeid;

/*22. Напишите запрос, который показывает общий объем продаж по странам. На выходе в первой колонке должно быть название страны, во второй в отсортированном 
по убыванию сумма счет-фактур.*/
SELECT i.billingcountry,
       Sum(i.total) AS Total
FROM   invoice i
GROUP  BY i.billingcountry
ORDER  BY total;

/*23. NOT FINISHED. Напишите запрос, который показывает треки 2013 года, отсортированные по количеству проданных экземпляров. На выходе в первой колонке 
должно быть название трека, во второй в отсортированном по убыванию порядку количество экземпляров трека.*/
SELECT t.name,
       Sum(il.quantity) AS Quantity
FROM   invoiceline il
       LEFT JOIN invoice i
              ON i.invoiceid = il.invoiceid
       LEFT JOIN track t
              ON t.trackid = il.trackid
WHERE  Strftime('%Y', invoicedate) = '2013'
GROUP  BY t.trackid
ORDER  BY quantity DESC;

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