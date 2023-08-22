/***************************/
/* Function and Procedure */
/***************************/
-- t1
/*DROP TABLE IF EXISTS old_emp;

CREATE TABLE old_emp AS
SELECT *
FROM EMP;

/*select *from old_emp;*/
DROP FUNCTION IF EXISTS DelEmployee(par_job text);

CREATE OR REPLACE FUNCTION DelEmployee(par_job text)
RETURNS VOID AS $$
DECLARE
    counter INTEGER;
BEGIN
    DELETE FROM old_emp
    WHERE job = par_job;
    GET DIAGNOSTICS counter= ROW_COUNT; -- Discard the value
	RAISE NOTICE '%', counter;
END;
$$ LANGUAGE plpgsql;

DO $$
BEGIN
    PERFORM DelEmployee('ANALYST');
    RAISE NOTICE 'Deletion complete';
END;
$$;*/

-- t2
/*CREATE OR REPLACE FUNCTION DelEmployee(par_job text)
RETURNS INTEGER AS $$
DECLARE
    counter INTEGER;
BEGIN
    DELETE FROM old_emp
    WHERE job = par_job;
    GET DIAGNOSTICS counter = ROW_COUNT;
    RETURN counter;
END;
$$ LANGUAGE plpgsql;

DO $$
DECLARE
    counter INTEGER;
BEGIN
    counter := DelEmployee('ANALYST');
    RAISE NOTICE '%', counter;
END;
$$;*/



/***************************/
/* TRIGGERS */
/***************************/
-- t3
/*DROP TABLE IF EXISTS ce;

CREATE TABLE ce(
    un VARCHAR(10),
    tn VARCHAR(10),
    a VARCHAR(10),
    ac DATE
);*/

/*CREATE OR REPLACE FUNCTION triger1_function()
RETURNS TRIGGER AS $$
DECLARE
    name TEXT;
BEGIN
    name := current_user;
    IF TG_OP = 'DELETE' THEN
        INSERT INTO ce VALUES (name, 'emp', 'DELETING', CURRENT_DATE); 
    ELSIF TG_OP = 'INSERT' THEN
        INSERT INTO ce VALUES (name, 'emp', 'INSERTING', CURRENT_DATE); 
    ELSIF TG_OP = 'UPDATE' THEN
        INSERT INTO ce VALUES (name, 'emp', 'UPDATING', CURRENT_DATE); 
    END IF;
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;*/


/*CREATE TRIGGER triger1
AFTER INSERT OR DELETE OR UPDATE ON emp
FOR EACH ROW
EXECUTE FUNCTION triger1_function();

INSERT INTO emp(empno, deptno) VALUES(4000, 10);
SELECT * FROM ce;*/

/*select * from emp;*/


-- t4
/*CREATE TABLE emp_new (
    empno SERIAL PRIMARY KEY,
    old_sal NUMERIC(7, 2),
    new_sal NUMERIC(7, 2)
);*/

-- Drop the existing trigger if it exists
DROP TRIGGER IF EXISTS update_salary_trigger ON emp;

-- Create or replace the trigger function
CREATE OR REPLACE FUNCTION update_salary_trigger()
RETURNS TRIGGER AS $$
BEGIN
    IF (NEW.sal > OLD.sal * 1.55) THEN
        INSERT INTO emp_new(empno, old_sal, new_sal)
        VALUES (NEW.empno, OLD.sal, NEW.sal);
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Create the trigger
CREATE TRIGGER update_salary_trigger
AFTER UPDATE OF sal ON emp
FOR EACH ROW
EXECUTE FUNCTION update_salary_trigger();

-- Perform the update
UPDATE emp
SET sal = 5000
WHERE empno = 7698;

-- Check the contents of emp_new table
SELECT * FROM emp_new;

