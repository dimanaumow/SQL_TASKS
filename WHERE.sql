--задачки на оператор WHERE сайт sql.ex

USE [sql-ex]
GO
--#1 Find the model number, speed and hard drive capacity for all the PCs with prices below $500. Result set: model, speed, hd.

SELECT model, speed, hd FROM dbo.PC
WHERE price < 500

--#2 List all printer makers. Result set: maker.
SELECT DISTINCT maker FROM dbo.Product
WHERE type = 'Printer'

--#3 Find the model number, RAM and screen size of the laptops with prices over $1000.
SELECT model, ram, screen FROM dbo.Laptop
WHERE price > 1000

--#4 Find the model number, RAM and screen size of the laptops with prices over $1000.
SELECT * FROM dbo.Printer
WHERE color = 'y'

--#5 Find the model number, speed and hard drive capacity of PCs cheaper than $600 having a 12x or a 24x CD drive.
SELECT model, speed, hd FROM dbo.PC
WHERE cd IN('12x', '24x') AND price < 600

--#31 For ship classes with a gun caliber of 16 in. or more, display the class and the country.
SELECT class, country FROM dbo.Classes
WHERE bore >= 16

--#33 Get the ships sunk in the North Atlantic battle. Result set: ship.
SELECT ship FROM dbo.Outcomes
WHERE result = 'sunk' AND battle = 'North Atlantic'

--#35 Find models in the Product table consisting either of digits only or Latin letters (A-Z, case insensitive) only.
--Result set: model, type.
SELECT model, type FROM dbo.Product
WHERE model NOT LIKE '%[^0-9]%' OR model NOT LIKE '%[^A-Z]%'

--#42 Find the names of ships sunk at battles, along with the names of the corresponding battles.
SELECT ship, battle FROM dbo.Outcomes
WHERE result = 'sunk'