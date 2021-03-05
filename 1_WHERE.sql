USE [sql-ex]
GO


--Exercise: 1 (Serge I: 2002-09-30)
--Find the model number, speed and hard drive capacity for all the PCs with prices below $500. Result set: model, speed, hd.

SELECT model, speed, hd 
FROM dbo.PC
WHERE price < 500


--Exercise: 2 (Serge I: 2002-09-21)
--List all printer makers. Result set: maker.
SELECT DISTINCT maker 
FROM dbo.Product
WHERE type = 'Printer'


--Exercise: 3 (Serge I: 2002-09-30)
--Find the model number, RAM and screen size of the laptops with prices over $1000.
SELECT model, ram, screen 
FROM dbo.Laptop
WHERE price > 1000


--Exercise: 4 (Serge I: 2002-09-21)
--Find the model number, RAM and screen size of the laptops with prices over $1000.
SELECT * 
FROM dbo.Printer
WHERE color = 'y'


--Exercise: 5 (Serge I: 2002-09-30)
--Find the model number, speed and hard drive capacity of PCs cheaper than $600 having a 12x or a 24x CD drive.
SELECT model, speed, hd 
FROM dbo.PC
WHERE cd IN('12x', '24x') AND price < 600


--Exercise: 31 (Serge I: 2002-10-22)
--For ship classes with a gun caliber of 16 in. or more, display the class and the country.
SELECT class, country 
FROM dbo.Classes
WHERE bore >= 16


--Exercise: 33 (Serge I: 2002-11-02)
--Get the ships sunk in the North Atlantic battle. Result set: ship.
SELECT ship 
FROM dbo.Outcomes
WHERE result = 'sunk' AND battle = 'North Atlantic'


--Exercise: 35 (qwrqwr: 2012-11-23)
--Find models in the Product table consisting either of digits only or Latin letters (A-Z, case insensitive) only.
--Result set: model, type.
SELECT model, type 
FROM dbo.Product
WHERE model NOT LIKE '%[^0-9]%' OR model NOT LIKE '%[^A-Z]%'


--Exercise: 42 (Serge I: 2002-11-05)
--Find the names of ships sunk at battles, along with the names of the corresponding battles.
SELECT ship, battle 
FROM dbo.Outcomes
WHERE result = 'sunk'
