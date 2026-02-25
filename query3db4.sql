SELECT State, COUNT(CustomerId) AS TotalCustomers
FROM customers
WHERE State IS NOT NULL
GROUP BY  State
ORDER BY State asc;
