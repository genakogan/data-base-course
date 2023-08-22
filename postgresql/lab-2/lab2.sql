-- t1 
/*DROP TABLE IF EXISTS Students;
CREATE TABLE Students
(
    Id INTEGER,
    LastName VARCHAR(20),
    FirstName VARCHAR(10),
    Address VARCHAR(10),
    BirthDay DATE,
    GroupId SMALLINT
);*/

-- t2
/*INSERT INTO Students VALUES (101, 'Solin', 'Dan', 'BeerSheva ', '01/02/1985', 11);*/

-- t3
/*ALTER TABLE Students
ADD COLUMN AvgMark NUMERIC(5, 2) DEFAULT 0;*/

-- t4
/*INSERT INTO  Students VALUES (102, 'Tal' ,'Ruti', 'Tel-Aviv', '10/07/1988', 12,  70 );

INSERT INTO  Students VALUES (103, 'Kohen', 'Yosi' , 'Dimona' , '01/08/1987', 11, 80);

INSERT INTO  Students VALUES (104, 'Toys' , 'Vered', 'Tel-Aviv', '15/09/1988', 12, 90);*/

-- t5
/*ALTER TABLE Students
ALTER COLUMN Address TYPE VARCHAR(15);*/

-- t6
/*DROP TABLE IF EXISTS Students2;
CREATE TABLE Students2 AS
SELECT * FROM Students;*/

-- t7
/*DELETE FROM Students
WHERE birthday = '1988-07-10';*/

-- t8
/*UPDATE Students2
SET GroupId = 10
WHERE GroupId = 11;*/

-- t9
/*ALTER TABLE Students2 RENAME TO Students_new;*/

-- t10
/*DROP TABLE IF EXISTS Students_new;*/