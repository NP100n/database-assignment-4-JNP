SELECT DISTINCT c.State
FROM customers c
Where c.State IS NOT NULL
GROUP BY c.State
HAVING COUNT(c.CustomerId) > 10
