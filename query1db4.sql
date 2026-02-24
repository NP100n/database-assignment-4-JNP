SELECT DISTINCT c.LastName, c.Email
FROM customers c
JOIN invoices i on c. CustomerId = i.CustomerId
