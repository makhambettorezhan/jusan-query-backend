SELECT i.invoiceid, e.firstname || ' ' || e.lastname AS Employee
FROM Invoice i
JOIN Customer c ON  i.CustomerId = c.CustomerId
JOIN Employee e ON c.CustomerId = e.EmployeeId
WHERE e.Title = 'Sales Support Agent';