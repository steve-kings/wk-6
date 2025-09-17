-- ===============================================
-- WEEK 6: SQL Joins and Advanced Queries
-- Student: Stephen
-- ===============================================

USE salesDB;

-- ===============================================
-- ASSIGNMENT QUESTIONS
-- ===============================================

-- Question 1: Get employee details with office information using INNER JOIN
-- INNER JOIN returns only records that have matching values in both tables
SELECT 
    e.firstName,
    e.lastName,
    e.email,
    e.officeCode
FROM employees e
INNER JOIN offices o ON e.officeCode = o.officeCode;

-- Question 2: Get product details with product line information using LEFT JOIN
-- LEFT JOIN returns all records from products table, with matching productlines data
SELECT 
    p.productName,
    p.productVendor,
    p.productLine
FROM products p
LEFT JOIN productlines pl ON p.productLine = pl.productLine;

-- Question 3: Get order details with customer information using RIGHT JOIN
-- RIGHT JOIN returns all records from orders table, with matching customers data
-- Limited to first 10 orders
SELECT 
    o.orderDate,
    o.shippedDate,
    o.status,
    o.customerNumber
FROM customers c
RIGHT JOIN orders o ON c.customerNumber = o.customerNumber
LIMIT 10;

-- ===============================================
-- ADDITIONAL JOIN EXAMPLES
-- ===============================================

-- Example: FULL JOIN simulation (MySQL doesn't support FULL JOIN directly)
-- Get all employees and all offices, whether they match or not
SELECT 
    e.firstName,
    e.lastName,
    o.city,
    o.country
FROM employees e
LEFT JOIN offices o ON e.officeCode = o.officeCode
UNION
SELECT 
    e.firstName,
    e.lastName,
    o.city,
    o.country
FROM employees e
RIGHT JOIN offices o ON e.officeCode = o.officeCode;

-- Example: Multiple table joins
-- Get order details with customer and employee information
SELECT 
    o.orderNumber,
    c.customerName,
    CONCAT(e.firstName, ' ', e.lastName) AS salesRep,
    o.orderDate
FROM orders o
INNER JOIN customers c ON o.customerNumber = c.customerNumber
LEFT JOIN employees e ON c.salesRepEmployeeNumber = e.employeeNumber;

-- Example: Self join to find employee hierarchy
-- Find employees and their managers
SELECT 
    emp.firstName AS employee_name,
    mgr.firstName AS manager_name
FROM employees emp
LEFT JOIN employees mgr ON emp.reportsTo = mgr.employeeNumber;

-- ===============================================
-- ASSIGNMENT COMPLETED BY: Stephen
-- ===============================================