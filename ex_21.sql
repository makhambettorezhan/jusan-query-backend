/*21. Напишите запрос, который показывает количество клиентов, назначенных каждому торговому агенту. На выходе в первой колонке должно быть 
количество клиентов, во второй имя и фамилия продавца.*/
SELECT Count(*) AS Total,
       ( e.firstname
         || ' '
         || e.lastname )   AS FullName
FROM   employee e
       JOIN customer c
              ON c.supportrepid = e.employeeid
GROUP  BY e.EmployeeId;