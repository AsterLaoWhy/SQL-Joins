/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
 SELECT p.Name, c.Name 
 FROM products as p
 LEFT JOIN categories AS c ON p.CategoryID = c.CategoryID
 WHERE p.CategoryID = 1;
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 SELECT p.Name, p.Price, r.Rating
 FROM reviews AS r
 LEFT JOIN products AS p ON r.ProductID=p.ProductID
 WHERE r.Rating=5;
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT e.EmployeeID, e.FirstName, e.MiddleInitial, e.LastName, SUM(s.Quantity) AS TotalQuantitySold
FROM employees AS e
LEFT JOIN sales as s ON e.EmployeeID = s.EmployeeID
GROUP BY e.EmployeeID
ORDER BY TotalQuantitySold DESC
LIMIT 1;
/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT c.Name, d.Name
FROM categories AS c
LEFT JOIN departments AS d ON c.DepartmentID=d.DepartmentID
WHERE c.Name = 'Appliances' OR c.Name = 'Games';
/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM()*/
SELECT p.Name,p.ProductID, SUM(s.Quantity+s.PricePerUnit) AS TotalPriceSold
FROM products AS p
LEFT JOIN sales as s ON p.ProductID=s.ProductID
WHERE p.ProductID=97; 

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT p.Name, r.Reviewer, r.Rating, r.comment, p.ProductID
FROM products as p
LEFT JOIN reviews AS r ON p.ProductID=r.ProductID
WHERE p.ProductID=857
LIMIT 1;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */
SELECT e.EmployeeID as ID, e.FirstName as FirstName, e.LastName as LastName, p.Name as ProductName, s.Quantity as Quantity
FROM employees as e
LEFT JOIN sales as s ON e.EmployeeID = s.EmployeeID
LEFT JOIN products as p ON s.ProductID = p.ProductID;