SHOW databases;
Create database SalesPeople;
USE SalesPeople;
CREATE TABLE SalesPeople (Snum INT PRIMARY KEY, Sname VARCHAR(20) UNIQUE, City VARCHAR(20), Comm DECIMAL(4, 2));
INSERT INTO SalesPeople (Snum, Sname, City, Comm) VALUES (1001, 'Peel', 'London', 0.12),(1002, 'Serres', 'San Jose', 0.13),(1004, 'Motika', 'London', 0.11),(1007, 'Rifkin', 'Barcelona', 0.15),(1003, 'Axelrod', 'New York', 0.10);
SELECT * from SalesPeople;
-----------------------------------------
Create database Customers;
USE Customers;
Create Table Customers (Cnum INT PRIMARY KEY, Cname VARCHAR(20), City VARCHAR(20) NOT NULL, Snum INT);
INSERT INTO Customers (Cnum, Cname, City, Snum) VALUES
(2001, 'Hoffman', 'London', 1001), 
(2002, 'Giovanni', 'Rome', 1003),
(2003, 'Liu', 'San Jose', 1002),
(2004, 'Grass', 'Berlin', 1002),
(2006, 'Clemens', 'London', 1001),
(2008, 'Cisneros', 'San Jose', 1007),
(2007, 'Pereira', 'Rome', 1004);
SELECT * from Customers;
---------------------------
Create database Orders;
USE Orders;
CREATE TABLE Orders (Onum INT PRIMARY KEY, Amt DECIMAL(8, 2), Odate DATE, Cnum INT, Snum INT);
INSERT INTO Orders (Onum, Amt, Odate, Cnum, Snum) VALUES
(3001, 18.69, '1990-03-10', 2008, 1007),
(3003, 767.19, '1990-03-10', 2001, 1001),
(3002, 1900.10, '1990-03-10', 2007, 1004),
(3005, 5160.45, '1990-03-10', 2003, 1002),
(3006, 1098.16, '1990-03-10', 2008, 1007),
(3009, 1713.23, '1990-04-10', 2002, 1003),
(3007, 75.75, '1990-04-10', 2004, 1002),
(3008, 4273.00, '1990-05-10', 2006, 1001),
(3010, 1309.95, '1990-06-10', 2004, 1002),
(3011, 9891.88, '1990-06-10', 2006, 1001);
SELECT * from Orders;
-----------------------------------------------
SELECT COUNT(*) AS NumberOfSalespeople FROM SalesPeople WHERE UPPER(Sname) LIKE 'A%';

--------------------------------
SELECT S.Snum, S.Sname FROM SalesPeople S INNER JOIN Orders O ON S.Snum = O.Snum GROUP BY S.Snum, S.Sname HAVING SUM(O.Amt) > 2000;

------------------------
SELECT COUNT(*) AS NumberOfSalespeopleInNewYork FROM SalesPeople WHERE City = 'Newyork';

---------------------------------------------
SELECT City, COUNT(*) AS NumberOfSalespeople FROM SalesPeople WHERE City IN ('London', 'Paris') GROUP BY City;

------------------------------------
SELECT S.Snum, S.Sname, O.Odate, COUNT(*) AS NumberOfOrders FROM SalesPeople S INNER JOIN Orders O ON S.Snum = O.Snum GROUP BY S.Snum, S.Sname, O.Odate ORDER BY S.Snum, O.Odate;







    









