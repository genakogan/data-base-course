-- t1
/*SELECT ename  
FROM emp
WHERE ename LIKE 'S%' AND sal > 2000;*/ 

-- t2
/*SELECT AVG(sal)
FROM emp
WHERE deptno = 10;*/

-- t3
/*SELECT COUNT(ename)
FROM emp
WHERE deptno = 10;*/

-- t4
/*SELECT job ,sal 
FROM emp
WHERE sal>1000 and sal<2000;*/

-- t5
/*SELECT job ,sal 
FROM emp
WHERE job = 'CLERK';*/

-- t6
/*SELECT AVG(sal) 
FROM emp
WHERE job = 'CLERK';*/

-- t7
/*SELECT ename
FROM emp
WHERE NOT job  = 'CLERK';*/

-- t8
/*SELECT ename
FROM emp
WHERE NOT deptno = 20;*/

-- t9
/*SELECT ename
FROM emp
WHERE ename LIKE '%RK';*/

-- t10
/*SELECT *
FROM emp
WHERE ENAME LIKE 'TURNER';*/

-- t11
/*SELECT ename
FROM emp
WHERE HIREDATE > '2/12/1981' AND MGR=7566;*/

-- t12
/*SELECT ename 
FROM emp
WHERE HIREDATE BETWEEN  '3/12/1981' AND  '21/1/1982';*/

