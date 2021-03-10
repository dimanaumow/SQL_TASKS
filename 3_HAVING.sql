USE [sql-ex]
GO


--Exercise: 15 (Serge I: 2003-02-03)
--Get hard drive capacities that are identical for two or more PCs. Result set: hd.
SELECT hd 
  FROM PC
 GROUP BY hd
HAVING COUNT(*) >= 2


--Exercise: 20 (Serge I: 2003-02-13)
--Find the makers producing at least three distinct models of PCs. Result set: maker, number of PC models.
SELECT maker, 
	   COUNT(model) AS [Count models]
  FROM PRODUCT
 WHERE type = 'pc'
 GROUP BY maker
HAVING COUNT(model) >= 3


--Exercise: 40 (Serge I: 2012-04-20)
--Get the makers who produce only one product type and more than one model. Output: maker, type.
SELECT maker, 
	   MAX(type) AS [Product type]
  FROM Product
 GROUP BY maker
HAVING COUNT(DISTINCT type) = 1 
   AND COUNT(model) > 1


--Exercise: 85 (Serge I: 2012-03-16)
--Get makers producing either printers only or personal computers only; in case of PC manufacturers they should produce at least 3 models.
SELECT maker 
  FROM Product
 GROUP BY maker
HAVING COUNT(DISTINCT type) = 1 
  AND (MIN(type) = 'PRINTER' 
	   OR (MIN(type) = 'PC' 
	   AND COUNT(model) >= 3))

