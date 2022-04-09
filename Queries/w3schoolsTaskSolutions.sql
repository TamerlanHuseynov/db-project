----------------------------------------------WITH----ALIES--------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
-- 1. FIND OUT THE CUSTOMER COUNT FOR EACH COUNTRY
------------------------------------------------------------------------------------------------------------------------
SELECT COUNTRY,COUNT(COUNTRY) AS Customer_Count
FROM CUSTOMERS
GROUP BY COUNTRY;
------------------------------------------------------------------------------------------------------------------------
-- 2. FIND OUT ANY EMPLOYEES WITH BA DEGREES (BY CHECKING NOTES CONTAINING BA )
------------------------------------------------------------------------------------------------------------------------
SELECT FirstName||' '||LastName AS Full_Name
FROM EMPLOYEES
WHERE NOTES LIKE "% BA %";
------------------------------------------------------------------------------------------------------------------------
-- 3. FIND OUT CUSTOMER NAME AND OrderID  Using the Orders and Customers table
------------------------------------------------------------------------------------------------------------------------
SELECT CustomerName, O.OrderID
FROM CUSTOMERS C
         INNER JOIN ORDERS O ON C.CustomerID=O.CustomerID;
------------------------------------------------------------------------------------------------------------------------
-- 4. FIND OUT CUSTOMER NAME AND OrderID  Using the Orders and Customers table
-- CONTINUE TO FIND OUT THE EMPLOYEE NAME  USING EmployeeID
------------------------------------------------------------------------------------------------------------------------
SELECT FirstName||' '||LastName AS Full_Name, O.OrderID
FROM EMPLOYEES E
         INNER JOIN ORDERS O ON E.EmployeeID=O.EmployeeID;
------------------------------------------------------------------------------------------------------------------------
-- 5. Find out OrderDetailID and ProductName using the OrderDetails table and Products table they are related by ProductID
------------------------------------------------------------------------------------------------------------------------
SELECT OrderDetailID, P.ProductName
FROM ORDERDETAILS O
         INNER JOIN PRODUCTS P ON O.ProductID=P.ProductID;
------------------------------------------------------------------------------------------------------------------------
--OPTIONAL TASK
-- O1. FIND OUT HOW MANY ORDERS EACH CUSTOMER MADE, INCLUDING THOSE CUSTOMERS WHO MADE NO ORDER
------------------------------------------------------------------------------------------------------------------------
SELECT CustomerName, COUNT(O.CustomerID) AS NUMBER_OF_ORDERS
FROM CUSTOMERS C
         LEFT OUTER JOIN ORDERS O ON C.CustomerID=O.CustomerID
GROUP BY CustomerName;
------------------------------------------------------------------------------------------------------------------------
--O2. -- FIND OUT COUNT OF PRODUCTS FOR EACH ORDER FROM OrderDetails table
------------------------------------------------------------------------------------------------------------------------
SELECT O.OrderID, COUNT(OD.ProductID) AS ProductQuantity
FROM ORDERS O
         LEFT OUTER JOIN ORDERDETAILS OD ON O.OrderID = OD.OrderID
GROUP BY O.OrderID;
------------------------------------------------------------------------------------------------------------------------
--O3.  FIND OUT EMPLOYEE FirstName and Count of ORDER they processed including those employees did not process any order (Adam)
------------------------------------------------------------------------------------------------------------------------
SELECT FirstName||' '||LastName AS Full_Name,  COUNT(O.EmployeeID) AS NUMBER_OF_ORDERS
FROM EMPLOYEES E
         LEFT OUTER JOIN ORDERS O ON E.EmployeeID=O.EmployeeID
GROUP BY Full_Name;
------------------------------------------------------------------------------------------------------------------------
--O4. Find out How much each ORDER COST - SUM OF ALL PRODUCT PRICE IN ORDER DETAILS FOR EACH ORDER
------------------------------------------------------------------------------------------------------------------------
SELECT OrderID, COUNT(O.ProductID) AS ORDER_QUANTITY, ROUND(SUM(P.Price*O.Quantity),2) AS TOTAL_PRICE_FOR_EACH_ORDER
FROM ORDERDETAILS O
         INNER JOIN PRODUCTS P ON O.PRODUCTID = P.PRODUCTID
GROUP BY OrderID ;
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
--------------------------------------------WITHOUT ALIES----------------------------------------------------------------------------
-- 1. FIND OUT THE CUSTOMER COUNT FOR EACH COUNTRY
------------------------------------------------------------------------------------------------------------------------
SELECT COUNTRY,COUNT(COUNTRY) AS Customer_Count
FROM CUSTOMERS
GROUP BY COUNTRY;
------------------------------------------------------------------------------------------------------------------------
-- 2. FIND OUT ANY EMPLOYEES WITH BA DEGREES (BY CHECKING NOTES CONTAINING BA )
------------------------------------------------------------------------------------------------------------------------
SELECT FirstName||' '||LastName AS Full_Name
FROM EMPLOYEES
WHERE NOTES LIKE "% BA %";
------------------------------------------------------------------------------------------------------------------------
-- 3. FIND OUT CUSTOMER NAME AND OrderID  Using the Orders and Customers table
------------------------------------------------------------------------------------------------------------------------
SELECT CustomerName, ORDERS.OrderID
FROM CUSTOMERS
INNER JOIN ORDERS ON CUSTOMERS.CustomerID=ORDERS.CustomerID;
------------------------------------------------------------------------------------------------------------------------
-- 4. FIND OUT CUSTOMER NAME AND OrderID  Using the Orders and Customers table
-- CONTINUE TO FIND OUT THE EMPLOYEE NAME  USING EmployeeID
------------------------------------------------------------------------------------------------------------------------
SELECT FirstName||' '||LastName AS Full_Name, ORDERS.OrderID
FROM EMPLOYEES
INNER JOIN ORDERS ON EMPLOYEES.EmployeeID=ORDERS.EmployeeID;
------------------------------------------------------------------------------------------------------------------------
-- 5. Find out OrderDetailID and ProductName using the OrderDetails table and Products table they are related by ProductID
------------------------------------------------------------------------------------------------------------------------
SELECT OrderDetailID, PRODUCTS.ProductName
FROM ORDERDETAILS
INNER JOIN PRODUCTS ON ORDERDETAILS.ProductID=PRODUCTS.ProductID;
------------------------------------------------------------------------------------------------------------------------
--OPTIONAL TASK
-- O1. FIND OUT HOW MANY ORDERS EACH CUSTOMER MADE, INCLUDING THOSE CUSTOMERS WHO MADE NO ORDER
------------------------------------------------------------------------------------------------------------------------
SELECT CustomerName, COUNT(ORDERS.CustomerID) AS NUMBER_OF_ORDERS
FROM CUSTOMERS
LEFT OUTER JOIN ORDERS ON CUSTOMERS.CustomerID=ORDERS.CustomerID
GROUP BY CustomerName;
------------------------------------------------------------------------------------------------------------------------
--O2. -- FIND OUT COUNT OF PRODUCTS FOR EACH ORDER FROM OrderDetails table
------------------------------------------------------------------------------------------------------------------------
SELECT ORDERS.OrderID, COUNT(ORDERDETAILS.ProductID) AS ProductQuantity
FROM ORDERS
LEFT OUTER JOIN ORDERDETAILS  ON ORDERS.OrderID = ORDERDETAILS.OrderID
GROUP BY ORDERS.OrderID;
------------------------------------------------------------------------------------------------------------------------
--O3.  FIND OUT EMPLOYEE FirstName and Count of ORDER they processed including those employees did not process any order (Adam)
------------------------------------------------------------------------------------------------------------------------
SELECT FirstName||' '||LastName AS Full_Name,  COUNT(ORDERS.EmployeeID) AS NUMBER_OF_ORDERS
FROM EMPLOYEES
LEFT OUTER JOIN ORDERS ON EMPLOYEES.EmployeeID=ORDERS.EmployeeID
GROUP BY Full_Name;
------------------------------------------------------------------------------------------------------------------------
--O4. Find out How much each ORDER COST - SUM OF ALL PRODUCT PRICE IN ORDER DETAILS FOR EACH ORDER
------------------------------------------------------------------------------------------------------------------------
SELECT OrderID, COUNT(ORDERDETAILS.ProductID) AS ORDER_QUANTITY, ROUND(SUM(PRODUCTS.Price*ORDERDETAILS.Quantity),2) AS TOTAL_PRICE_FOR_EACH_ORDER
FROM ORDERDETAILS
INNER JOIN PRODUCTS ON ORDERDETAILS.PRODUCTID = PRODUCTS.PRODUCTID
GROUP BY OrderID ;
------------------------------------------------------------------------------------------------------------------------
