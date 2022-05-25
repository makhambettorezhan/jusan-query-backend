SELECT i.InvoiceId, e.FirstName ||  ' ' ||  e.LastName AS EmployeeFullName
FROM Invoice i
JOIN Customer c ON  i.CustomerId = c.CustomerId
JOIN Employee e ON c.CustomerId = e.EmployeeId
WHERE e.Title LIKE '%sales%'
AND e.Title LIKE '%agent%';
/*SELECT i.invoiceid, e.firstname || ' ' || e.lastname AS Employee
FROM Invoice i
JOIN Customer c ON  i.CustomerId = c.CustomerId
JOIN Employee e ON c.CustomerId = e.EmployeeId
WHERE e.Title = 'Sales Support Agent'
ORDER BY i.invoiceid;*/
