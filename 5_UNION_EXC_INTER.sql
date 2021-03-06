USE [sql-ex]
GO 

--Exercise: 7 (Serge I: 2002-11-02)
--Get the models and prices for all commercially available products (of any type) produced by maker B.
SELECT PC.model, PC.price 
FROM PC INNER JOIN PRODUCT 
ON PC.model = Product.model
WHERE product.maker = 'B'
UNION 
SELECT Laptop.model, Laptop.price 
FROM Laptop INNER JOIN PRODUCT 
ON Laptop.model = Product.model
WHERE product.maker = 'B'
UNION 
SELECT Printer.model, Printer.price 
FROM Printer INNER JOIN PRODUCT 
ON Printer.model = Product.model
WHERE product.maker = 'B'


--Exercise: 8 (Serge I: 2003-02-03)
--Find the makers producing PCs but not laptops
SELECT maker 
FROM Product
WHERE type = 'pc'
EXCEPT 
SELECT maker 
FROM Product
WHERE type = 'laptop'

--Exercise: 24 (Serge I: 2003-02-03)
--List the models of any type having the highest price of all products present in the database.
;WITH [All models and prices] AS (
	SELECT model, price FROM Pc
	UNION
	SELECT model, price FROM Printer
	Union
	SELECT model, price FROM Laptop)
SELECT model
FROM [All models and prices]
WHERE price =   (
				SELECT MAX(price)
				FROM [All models and prices]
				)


--Exercise: 38 (Serge I: 2003-02-19)
--Find countries that ever had classes of both battleships (‘bb’) and cruisers (‘bc’).
SELECT country 
FROM Classes
WHERE type = 'bb' 
INTERSECT 
SELECT country 
FROM Classes
WHERE type = 'bc'


--Exercise: 44 (Serge I: 2002-12-04)
--Find all ship names beginning with the letter R.
SELECT name 
From Ships
WHERE name LIKE'R%'
UNION
SELECT ship
FROM Outcomes
WHERE ship LIKE'R%'


--Exercise: 45 (Serge I: 2002-12-04)
--Find all ship names consisting of three or more words (e.g., King George V).
--Consider the words in ship names to be separated by single spaces, and the ship 
--names to have no leading or trailing spaces.
SELECT name 
From Ships
WHERE name LIKE'% % %'
UNION
SELECT ship
FROM Outcomes
WHERE ship LIKE'% % %'

--Exercise: 73 (Serge I: 2009-04-17)
--For each country, determine the battles in which the ships of this country did not participate.
--Result set: country, battle.


--Exercise: 90 (Serge I: 2012-05-04)
--Display all records from the Product table except for three rows 
--with the smallest model numbers and three ones with the greatest model numbers.
SELECT *
FROM dbo.Product
WHERE model	NOT IN 
			(
			SELECT TOP(3) model
			FROM dbo.Product
			ORDER BY model ASC

			UNION 

			SELECT TOP(3) model
			FROM dbo.Product
			ORDER BY model DESC
			)