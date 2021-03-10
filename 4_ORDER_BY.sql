USE [sql-ex]
GO 


--Exercise: 10 (Serge I: 2002-09-23)
--Find the printer models having the highest price. Result set: model, price.
SELECT TOP(1) WITH TIES model, 
						price
  FROM Printer
 ORDER BY price DESC


--Exercise: 18 (Serge I: 2003-02-03)
--Find the makers of the cheapest color printers. Result set: maker, price.
SELECT maker, 
	   price
  FROM Product 
 INNER JOIN Printer ON Product.model = Printer.model
 WHERE price =
			(
			SELECT MIN(price) 
			  FROM Printer
			 WHERE color = 'y'
			)
	   AND color = 'y'
 GROUP BY maker, 
		  price


--Exercise: 90 (Serge I: 2012-05-04)
--Display all records from the Product table except for three rows 
--with the smallest model numbers and three ones with the greatest model numbers.
SELECT *
  FROM dbo.Product
 WHERE model NOT IN 
			(
			SELECT TOP(3) model
			  FROM dbo.Product
			 ORDER BY model ASC
			UNION 
			SELECT TOP(3) model
			  FROM dbo.Product
			 ORDER BY model DESC
			)

