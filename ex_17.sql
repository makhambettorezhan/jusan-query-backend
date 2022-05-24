 /*17. Напишите запрос, который показывает общий объем продаж, совершенных каждым торговым агентом. 
На выходе в первой колонке должна быть сумма продаж, во второй имя и фамилия продавца.*/
SELECT Sum(i.total),
       e.firstname
       || ' '
       || e.lastname as 'Employee'
FROM   invoice i
       JOIN employee e
              ON c.supportrepid = e.employeeid
       JOIN customer c
         ON i.customerid = c.customerId
GROUP  BY e.employeeId;  