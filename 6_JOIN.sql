USE [sql-ex]
GO


--Exercise: 6 (Serge I: 2002-10-28)
--For each maker producing laptops with a hard drive capacity of 10 Gb or
--higher, find the speed of such laptops. Result set: maker, speed.
SELECT maker, 
	   speed
  FROM Product 
 INNER JOIN Laptop ON Product.model = Laptop.model
 WHERE hd >= 10


--Exercise: 9 (Serge I: 2002-11-02)
--Find the makers of PCs with a processor speed of 450 MHz or more. Result set: maker.
SELECT DISTINCT maker
  FROM PC 
 INNER JOIN Product ON PC.model = Product.model
 WHERE PC.speed >= 450
   AND type = 'pc'

