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


--Exercise: 13 (Serge I: 2002-11-02)
--Find out the average speed of the PCs produced by maker A.
SELECT AVG(speed) AS [Average spped]
  FROM PC
 INNER JOIN Product ON PC.model = Product.model
 WHERE maker = 'A'

 
 --Exercise: 14 (Serge I: 2002-11-05)
 --For the ships in the Ships table that have at least 10 guns, get the class, name, and country.
 SELECT Classes.class, 
		name, 
		country
   FROM Ships 
   JOIN Classes ON Ships.class = Classes.class
  WHERE numGuns >= 10


--Exercise: 16 (Serge I: 2003-02-03)
--Get pairs of PC models with identical speeds and the same RAM capacity. Each resulting pair should be displayed 
--only once, i.e. (i, j) but not (j, i).
--Result set: model with the bigger number, model with the smaller number, speed, and RAM.
SELECT DISTINCT 
	   pc_1.model,
	   pc_2.model, 
	   pc_1.speed,
	   pc_1.ram
  FROM PC AS pc_1, PC AS pc_2 
 WHERE pc_1.model > pc_2.model
   AND pc_1.speed = pc_2.speed
   AND pc_1.ram = pc_2.ram


--Exercise: 19 (Serge I: 2003-02-13)
--For each maker having models in the Laptop table, find out 
--the average screen size of the laptops he produces.
--Result set: maker, average screen size.
SELECT maker, 
	   AVG(screen) AS [Average screen]
  FROM Laptop
  JOIN Product ON Laptop.model = Product.model
 GROUP BY maker


--Exercise: 23 (Serge I: 2003-02-14)
--Get the makers producing both PCs having a speed of 750 MHz or higher 
--and laptops with a speed of 750 MHz or higher. Result set: maker
SELECT maker
  FROM Product 
  INNER JOIN PC ON Product.model = PC.model
  WHERE speed>=750 
INTERSECT
SELECT maker
  FROM Product 
 INNER JOIN Laptop ON Product.model = Laptop.model
 WHERE speed>=750 

 
 --Exercise: 49 (Serge I: 2003-02-17)
 --Find the names of the ships having a gun caliber of 16 inches (including ships in the Outcomes table).
SELECT name
  FROM Ships
 INNER JOIN Classes	ON Classes.class = Ships.class
		AND Classes.bore = 16
UNION
SELECT ship
  FROM Outcomes
 INNER JOIN Classes ON Classes.class = Outcomes.ship
		AND Classes.bore = 16



--Exercise: 50 (Serge I: 2002-11-05)
--Find the battles in which Kongo-class ships from the Ships table were engaged.
SELECT battle
  FROM Outcomes
  JOIN Ships ON Ships.name = Outcomes.ship
 WHERE Ships.class = 'Kongo'



--Exercise: 55 (Serge I: 2003-02-16)
--For each class, determine the year the first ship of this class was launched.
--If the lead ship’s year of launch is not known, get the minimum year of launch for the ships of this class.
--Result set: class, year.
SELECT Classes.class AS class, min(launched) AS [min date]
  FROM Classes 
  LEFT JOIN Ships ON Classes.class = Ships.class
 GROUP BY Classes.class


--Exercise: 56 (Serge I: 2003-02-16)
--For each class, find out the number of ships of this class that were sunk in battles.
--Result set: class, number of ships sunk.



--Exercise: 71 (Serge I: 2008-02-23)
--Find the PC makers with all personal computer models produced by them being present in the PC table.
SELECT maker
  FROM Product AS PR
  LEFT JOIN PC ON PC.model = PR.model
 WHERE PR.type = 'PC' 
	OR PR.type IS NULL
 GROUP BY PR.maker
HAVING COUNT(PR.model) = COUNT(PC.model)


--Exercise: 73 (Serge I: 2009-04-17)
--For each country, determine the battles in which the ships of this country did not participate.
--Result set: country, battle.
SELECT DISTINCT country, name
  FROM Classes CROSS JOIN Battles
EXCEPT
SELECT country, battle
  FROM Outcomes 
  LEFT JOIN Ships ON Outcomes.ship = Ships.name
       LEFT JOIN Classes ON Outcomes.ship = Classes.class
		    OR Ships.class = Classes.class
 GROUP BY country, battle


 SELECT class FROM Classes
 SELECT name FROM Ships
 SELECT ship FROM Outcomes