/*7. Напишите запрос, который показывает общую сумму счета, имя клиента, страну и имя агента по продаже для всех счетов и клиентов. На выходе в первой 
колонке должна быть общая стоимость счет-фактуры, во второй имя и фамилия покупателя, в третьей страна выставления счета, в четвертой имя и фамилия продавца.*/
SELECT i.total,
       c.firstname || ' ' || c.lastname as Customer,
       i.billingcountry,
       e.firstname || ' ' || e.lastname as Employee
FROM   Invoice i
       LEFT JOIN  customer c
         ON i.customerid = c.customerid
       LEFT JOIN employee e
         ON e.employeeid = c.supportrepid
       WHERE e.title = 'Sales Support Agent';