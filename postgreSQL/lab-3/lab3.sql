-- t1
/*SELECT model,speed,hd
FROM pc
WHERE price>1600 AND (hd = 10 OR hd = 20);*/

-- t2
/*SELECT model,speed megahertz,hd gigabytes
FROM pc
WHERE price>1600;*/

-- t3
/*SELECT DISTINCT  maker
FROM product p,pc
WHERE p.model = pc.model
ORDER BY maker;*/

-- t4
/*SELECT model,ram,screen
FROM laptop l
WHERE l.price > 2000 AND (screen >= 14 OR ram >= 64);*/

-- t5
/*SELECT maker,speed
FROM product p,laptop l
WHERE l.hd >= 1 AND p.model = l.model;*/

-- t6
/*SELECT p1.model
FROM pc p1,pc p2
WHERE p1.speed > p2.speed AND p2.model = 1001;*/

-- t7
/*SELECT p.model,price
FROM product p,pc
WHERE p.model = pc.model AND p.maker = 'A'
UNION
SELECT p.model,price
FROM product p,laptop l
WHERE p.model = l.model AND p.maker = 'A'
UNION
SELECT p.model,price
FROM product p,printer p2
WHERE p.model = p2.model AND p.maker = 'A';*/

-- t8
/*SELECT model,speed,price
FROM pc
WHERE price > 2000 AND speed > 100 
UNION
SELECT model,speed,price
FROM laptop
WHERE price > 2000 AND speed > 100;*/

-- t9
/*SELECT maker
FROM product p,pc
WHERE pc.price > 2000 AND pc.speed > 100 AND pc.model = p.model
INTERSECT
SELECT maker
FROM product p,laptop l
WHERE l.price > 2000 AND l.speed > 100 AND l.model = p.model;*/

-- t10
/*-- Drop table if it exists
DROP TABLE IF EXISTS copy_dept;

-- Create table copy_dept as select from dept
CREATE TABLE copy_dept AS SELECT * FROM dept;

-- Insert values into copy_dept
INSERT INTO copy_dept VALUES (50, 'CHEKING', 'BOSTON');

-- Select dname, ename, sal from emp e, copy_dept d
SELECT d.dname, e.ename, e.sal
FROM emp e
RIGHT JOIN copy_dept d ON d.deptno = e.deptno
WHERE d.loc IN ('BOSTON', 'CHICAGO');*/

-- t11
/*SELECT maker
FROM product p
INNER JOIN laptop l ON p.model = l.model
EXCEPT
SELECT maker
FROM product p
INNER JOIN pc ON p.model = pc.model;*/

-- t12
/*SELECT hd, COUNT(hd) count
FROM pc
GROUP BY hd
HAVING COUNT(hd) > 1;*/

-- t13
/*SELECT DISTINCT p1.model
FROM pc p1,pc p2
WHERE p1.speed = p2.speed AND p1.ram = p2.ram
GROUP BY p1.model
HAVING COUNT(p1.model) > 1;*/

