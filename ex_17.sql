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