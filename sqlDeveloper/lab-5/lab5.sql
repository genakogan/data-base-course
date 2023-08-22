--using product table from Lab3
/*DROP TABLE IF EXISTS Product;
CREATE TABLE Product (
    Maker VARCHAR(1),
    Model INTEGER PRIMARY KEY,
    Type VARCHAR(7)
);*/
/*INSERT INTO Product VALUES ('A', 1001, 'PC');
INSERT INTO Product VALUES ('A', 1002, 'PC');
INSERT INTO Product VALUES ('A', 1003, 'PC');
INSERT INTO Product VALUES ('A', 2004, 'LAPTOP');
INSERT INTO Product VALUES ('A', 2005, 'LAPTOP');
INSERT INTO Product VALUES ('A', 2006, 'LAPTOP');
INSERT INTO Product VALUES ('B', 1004, 'PC');
INSERT INTO Product VALUES ('B', 1005, 'PC');
INSERT INTO Product VALUES ('B', 1006, 'PC');
INSERT INTO Product VALUES ('B', 2001, 'LAPTOP');
INSERT INTO Product VALUES ('B', 2002, 'LAPTOP');
INSERT INTO Product VALUES ('B', 2003, 'LAPTOP');
INSERT INTO Product VALUES ('C', 1007, 'PC');
INSERT INTO Product VALUES ('C', 1008, 'PC');
INSERT INTO Product VALUES ('C', 2008, 'LAPTOP');
INSERT INTO Product VALUES ('C', 2009, 'LAPTOP');
INSERT INTO Product VALUES ('C', 3002, 'PRINTER');
INSERT INTO Product VALUES ('C', 3003, 'PRINTER');
INSERT INTO Product VALUES ('C', 3006, 'PRINTER');
INSERT INTO Product VALUES ('D', 1009, 'PC');
INSERT INTO Product VALUES ('D', 1010, 'PC');
INSERT INTO Product VALUES ('D', 1011, 'PC');
INSERT INTO Product VALUES ('D', 2007, 'LAPTOP');
INSERT INTO Product VALUES ('E', 1012, 'PC');
INSERT INTO Product VALUES ('E', 1013, 'PC');
INSERT INTO Product VALUES ('E', 2010, 'LAPTOP');
INSERT INTO Product VALUES ('F', 3001, 'PRINTER');
INSERT INTO Product VALUES ('F', 3004, 'PRINTER');
INSERT INTO Product VALUES ('G', 3005, 'PRINTER');
INSERT INTO Product VALUES ('H', 3007, 'PRINTER');*/

-- t1
/*SELECT AVG(speed)
FROM pc;*/

-- t2
/*SELECT AVG(speed) AS average_speed
FROM Laptop
WHERE price > 2500;*/

-- t3
/*SELECT AVG(price)
FROM pc
WHERE  model in (SELECT model FROM product WHERE maker like 'A');*/

-- t4
/*SELECT AVG(price)
FROM (
  SELECT price
  FROM PC
  WHERE Model IN (
    SELECT model
    FROM Product
    WHERE Maker = 'D'
  )
  UNION
  SELECT price
  FROM Laptop
  WHERE Model IN (
    SELECT model
    FROM Product
    WHERE Maker = 'D'
  )
) AS subquery;*/

-- t5
/*SELECT speed, AVG(price)
FROM pc
GROUP BY speed;*/

-- t6
/*SELECT maker, AVG(screen)
FROM product,laptop
WHERE product.model = laptop.model
GROUP BY maker;*/

-- t7
/*SElECT maker
FROM product
WHERE model IN (SELECT model
                FROM pc)
GROUP BY maker
HAVING COUNT(model)>=3;*/

-- t8
/*SELECT pr.maker, MAX(p.price)
FROM product pr, pc p
WHERE pr.model = p.model
GROUP BY maker;*/

-- t9
/*SELECT speed,AVG(price)
FROM pc
WHERE speed<900
GROUP BY speed;*/

-- t10
/*SELECT P.maker, AVG(HD)
FROM Pc C,Product P
WHERE C.Model=P.Model AND P.maker IN (SELECT maker
                                             FROM Product
                                             WHERE Type LIKE 'PRINTER')
GROUP BY p.maker;*/