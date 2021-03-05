USE [sql-ex]
GO

--Exercise: 11 (Serge I: 2002-11-02)
--Find out the average speed of PCs.
SELECT AVG(speed) AS [Average speed]
FROM dbo.PC


--Exercise: 12 (Serge I: 2002-11-02)
--Find out the average speed of the laptops priced over $1000.
SELECT AVG(speed) AS [Average speed]
FROM dbo.Laptop
WHERE price > 1000

--Exercise: 21 (Serge I: 2003-02-13)
--Find out the maximum PC price for each maker having models in the PC table. Result set: maker, maximum price.
SELECT Product.maker, MAX(pc.price) AS [Max price]
FROM Product, PC
WHERE Product.model = PC.model
GROUP BY maker


--Exercise: 22 (Serge I: 2003-02-13)
--For each value of PC speed that exceeds 600 MHz, find out the average price of PCs with identical speeds.
--Result set: speed, average price.
SELECT speed, AVG(price) AS [Average price]
FROM PC
WHERE speed > 600
GROUP BY speed


--Exercise: 53 (Serge I: 2002-11-05)
--With a precision of two decimal places, determine the average number of guns for the battleship classes.
SELECT FORMAT(AVG(CAST(numGuns AS float)), '0.00') AS [Average num guns] 
FROM Classes
WHERE type = 'bb'
GROUP BY type