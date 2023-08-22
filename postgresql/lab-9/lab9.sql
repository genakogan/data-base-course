
/********************************/
/* BLOCK */
/********************************/
-- block: t1 
/*select * from emp;*/

/*DO $$
DECLARE
    updated_count INTEGER;
BEGIN
    UPDATE emp
    SET SAL = SAL * 1.15
    WHERE deptno = 10;
    
    GET DIAGNOSTICS updated_count = ROW_COUNT;
    RAISE NOTICE '% employee(s) updated', updated_count;
END $$;*/

-- block: t2 
/*select * from emp;*/
/*DO $$
DECLARE
    old_job TEXT := 'ME';
    new_job TEXT := 'PRESIDENT';
    num_changes INTEGER := 0;
BEGIN
    UPDATE emp
    SET job = new_job
    WHERE job = old_job;

    GET DIAGNOSTICS num_changes = ROW_COUNT;
    
    RAISE NOTICE 'Number of changes: %', num_changes;
END $$;
*/

/********************************/
/* CURSOR */
/********************************/

-- cursor: t1 
/*DO $$
DECLARE
	dept_cur CURSOR FOR SELECT deptno, dname, loc FROM dept;
	dept_rec RECORD;
BEGIN
	OPEN dept_cur;
	
	LOOP
		FETCH dept_cur INTO dept_rec;
		EXIT WHEN NOT FOUND;
		
		RAISE NOTICE 'deptno: %', dept_rec.deptno;
		RAISE NOTICE 'dname: %', dept_rec.dname;
		RAISE NOTICE 'loc: %', dept_rec.loc;
	END LOOP;
	
	CLOSE dept_cur;
END $$;*/

-- cursor: t2 - using loop 
/*DO $$
DECLARE
    r_dept RECORD;
BEGIN
    -- Drop the table if it exists
    IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'old_dept') THEN
        DROP TABLE old_dept;
    END IF;
    
    -- Create the table
    CREATE TABLE old_dept (
        DEPTNO INTEGER PRIMARY KEY,
        DNAME VARCHAR(14),
        LOC VARCHAR(13)
    );
    
    -- Loop through the cursor
    FOR r_dept IN SELECT deptno, dname, loc FROM dept LOOP        
        -- Insert into the old_dept table
        INSERT INTO old_dept (deptno, dname, loc)
        VALUES (r_dept.deptno, r_dept.dname, r_dept.loc);
    END LOOP;
    
    -- Get the row count and output it
    RAISE NOTICE '% department(s) copied', FOUND;
END $$;*/

/*select * from old_dept;*/

-- cursor: t2 - without loop 
/*DO $$
DECLARE
    row_count INTEGER;
BEGIN
    -- Drop the table if it exists
    IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'old_dept') THEN
        DROP TABLE old_dept;
    END IF;
    
    -- Create the table
    CREATE TABLE old_dept (
        DEPTNO INTEGER PRIMARY KEY,
        DNAME VARCHAR(14),
        LOC VARCHAR(13)
    );
    
    -- Insert into the old_dept table
    INSERT INTO old_dept (deptno, dname, loc)
    SELECT deptno, dname, loc FROM dept;
    
    -- Get the row count
    GET DIAGNOSTICS row_count = ROW_COUNT;
    
    -- Output the row count
    RAISE NOTICE '% department(s) copied', row_count;
END $$;*/



