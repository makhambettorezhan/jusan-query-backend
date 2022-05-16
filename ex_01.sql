/*1. A query that outputs id, name, lastname of customers out of US */
select c.CustomerId, c.FirstName, c.LastName, c.Country from CUSTOMER c where c.Country <> 'US';

/*2. A query that returns customers name from Brazil */
select c.FirstName, c.LastName from CUSTOMER c where c.Country = 'Brazil';

/*3. A query that returns customers from Brazil with their invoice ID */
select c.FirstName, c.LastName, i.InvoiceId from CUSTOMER c join Invoice i on c.CustomerId = i.InvoiceId where c.Country = 'Brazil' ;

/*4. A query that prints employees who are in sales*/
select e.FirstName, e.LastName, e.Title from Employee e where title like '%sales%' or '%agent%';

/*5. A query that outputs a country list where that have invoice accounts*/
select DISTINCT i.BillingCountry from Invoice i where i.BillingCountry <> 'NULL';

/*6. A query that returns invoice id associated with Employee */
select i.InvoiceId, e.FirstName, e.LastName from Employee e join Customer c on c.SupportRepId = e.EmployeeId join Invoice i on i.CustomerId = c.CustomerId;

/*7. Напишите запрос, который показывает общую сумму счета, имя клиента, страну и имя агента по продаже для всех счетов и клиентов. На выходе в первой 
колонке должна быть общая стоимость счет-фактуры, во второй имя и фамилия покупателя, в третьей страна выставления счета, в четвертой имя и фамилия продавца.*/
select i.Total, c.FirstName, c.LastName, c.Country, e.Firstname, e.LastName from Customer c join Employee e on e.EmployeeId = c.SupportRepId join Invoice i on i.CustomerId = c.CustomerId;

/*8. NOT SURE YET. Сколько счетов было выставлено в 2009 и 2011 годах? Каковы соответствующие объемы продаж за каждый год? На выходе в первой колонке должен быть 
год выставления счет-фактуры, во второй сумма стоимостей всех счет-фактур.*/
select i.InvoiceDate, i.Total from Invoice i where strftime('%Y', i.InvoiceDate) = '2009' OR strftime('%Y', i.InvoiceDate) = '2011';

/*9. Просматривая таблицу InvoiceLine, напишите запрос, который подсчитывает количество позиций для счета-фактуры с InvoiceId 37. На выходе в первой колонке
 должно быть количество позиций.*/
 select COUNT(*) from InvoiceLine il where il.InvoiceId = 37;
 
/*10. NOT SURE. Просматривая таблицу InvoiceLine, напишите запрос, который подсчитывает количество позиций для каждой счета-фактуры. На выходе в первой колонке должен быть
 идентификатор счет-фактуры, во второй количество позиций. HINT: GROUP BY.*/
 select COUNT(il.InvoiceId), il.InvoiceLineId from InvoiceLine il join Invoice i on i.InvoiceId = il.InvoiceId ;
 
 
/*11. Напишите запрос, который включает название трека для каждой позиции из таблицы InvoiceLine. На выходе в первой колонке должен быть идентификатор 
счет-фактуры, во второй название трека.*/
select il.InvoiceId, t.Name from InvoiceLine il join Track t on t.TrackId = il.InvoiceId;

/**/