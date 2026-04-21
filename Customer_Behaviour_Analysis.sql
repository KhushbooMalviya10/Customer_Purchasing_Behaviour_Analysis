SELECT * FROM shopping_trends

---1. Total Revenue
SELECT SUM(Purchase_Amount_USD) AS total_revenue
FROM shopping_trends;


---2. Total Orders
SELECT COUNT(*) AS total_orders
FROM shopping_trends;


---3. Revenue by Category
SELECT Category, SUM(Purchase_Amount_USD) AS revenue
FROM shopping_trends
GROUP BY Category
ORDER BY revenue DESC;

---4. Revenue by Gender
SELECT Gender, SUM(Purchase_Amount_USD) AS revenue
FROM shopping_trends
GROUP BY Gender;


---5. Top 5 Customers
SELECT TOP 5 Customer_ID, SUM(Purchase_Amount_USD) AS total_spent
FROM shopping_trends
GROUP BY Customer_ID
ORDER BY total_spent DESC;



---6. Most Popular Category
SELECT Category, COUNT(*) AS total_orders
FROM shopping_trends
GROUP BY Category
ORDER BY total_orders DESC;



----7. Payment Method Usage
SELECT Payment_Method, COUNT(*) AS usage_count
FROM shopping_trends
GROUP BY Payment_Method
ORDER BY usage_count DESC;


---8. Average Purchase
SELECT AVG(Purchase_Amount_USD) AS avg_purchase
FROM shopping_trends;



---9. Discount Impact
SELECT Discount_Applied, AVG(Purchase_Amount_USD) AS avg_spent
FROM shopping_trends
GROUP BY Discount_Applied;



---10. Subscription Impact
SELECT Subscription_Status, AVG(Purchase_Amount_USD) AS avg_spent
FROM shopping_trends
GROUP BY Subscription_Status;


---11. Age Group Analysis
SELECT 
    CASE 
        WHEN Age BETWEEN 18 AND 25 THEN '18-25'
        WHEN Age BETWEEN 26 AND 35 THEN '26-35'
        WHEN Age BETWEEN 36 AND 50 THEN '36-50'
        ELSE '50+'
    END AS age_group,
    SUM(Purchase_Amount_USD) AS total_spending
FROM shopping_trends
GROUP BY 
    CASE 
        WHEN Age BETWEEN 18 AND 25 THEN '18-25'
        WHEN Age BETWEEN 26 AND 35 THEN '26-35'
        WHEN Age BETWEEN 36 AND 50 THEN '36-50'
        ELSE '50+'
    END
ORDER BY total_spending DESC;



---12. Top Category per Gender
SELECT Gender, Category, SUM(Purchase_Amount_USD) AS revenue
FROM shopping_trends
GROUP BY Gender, Category
ORDER BY Gender, revenue DESC;



---13. Customers Above Average Spending
SELECT Customer_ID, SUM(Purchase_Amount_USD) AS total_spent
FROM shopping_trends
GROUP BY Customer_ID
HAVING SUM(Purchase_Amount_USD) > (
    SELECT AVG(Purchase_Amount_USD) FROM shopping_trends
);

---14. Repeat Customers
SELECT Customer_ID, COUNT(*) AS total_orders
FROM shopping_trends
GROUP BY Customer_ID
HAVING COUNT(*) > 1
ORDER BY total_orders DESC;


---15. High Value Orders
SELECT *
FROM shopping_trends
WHERE Purchase_Amount_USD > (
    SELECT AVG(Purchase_Amount_USD) * 1.5 FROM shopping_trends
);
