/*16. Напишите запрос, который показывает все счета-фактуры и количество позиций. На выходе в первой колонке должен быть 
идентификатор счет-фактуры, во второй количество позиций в счет-фактуре.*/
select il.InvoiceId, COUNT(il.InvoiceLineId) as 'Positions'
from InvoiceLine il
group by il.InvoiceId;