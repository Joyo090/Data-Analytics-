create database Assessment;
use Assessment;

CREATE TABLE Worker (
    WORKER_ID INT PRIMARY KEY,
    FIRST_NAME VARCHAR(25),
    LAST_NAME VARCHAR(25),
    SALARY INT,
    JOINING_DATE DATETIME,
    DEPARTMENT VARCHAR(25)
);

INSERT INTO Worker VALUES
(1,'Monika','Arora',100000,'2014-02-20 09:00:00','HR'),
(2,'Niharika','Verma',80000,'2014-06-11 09:00:00','Admin'),
(3,'Vishal','Singhal',300000,'2014-02-20 09:00:00','HR'),
(4,'Amitabh','Singh',500000,'2014-02-20 09:00:00','Admin'),
(5,'Vivek','Bhati',500000,'2014-06-11 09:00:00','Admin'),
(6,'Vipul','Diwan',200000,'2014-06-11 09:00:00','Account'),
(7,'Satish','Kumar',75000,'2014-01-20 09:00:00','Account'),
(8,'Geetika','Chauhan',90000,'2014-04-11 09:00:00','Admin');

-- Print all Worker details ordered by FIRST_NAME Ascending and DEPARTMENT Descending
SELECT * FROM Worker
ORDER BY FIRST_NAME ASC, DEPARTMENT DESC;

-- Print details for Workers with first names “Vipul” and “Satish”
SELECT * FROM Worker
WHERE FIRST_NAME IN ('Vipul','Satish');

-- Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets
SELECT * FROM Worker
WHERE FIRST_NAME LIKE '_____h';

-- Workers whose SALARY lies between 100000 and 500000
SELECT * FROM Worker
WHERE SALARY BETWEEN 100000 AND 500000;

-- Show top 6 records of the table
SELECT * FROM Worker
LIMIT 6;

-- Fetch departments that have less than five people
SELECT DEPARTMENT, COUNT(*) FROM Worker
GROUP BY DEPARTMENT
HAVING COUNT(*) < 5;

-- Name of employees having the highest salary in each department
SELECT FIRST_NAME, LAST_NAME, DEPARTMENT, SALARY FROM Worker W
WHERE SALARY = (
    SELECT MAX(SALARY)
    FROM Worker
    WHERE DEPARTMENT = W.DEPARTMENT
);





CREATE TABLE Student (
    StdID INT PRIMARY KEY,
    StdName VARCHAR(50),
    Sex VARCHAR(10),
    Percentage INT,
    Class VARCHAR(10),
    Sec CHAR(1),
    Stream VARCHAR(20),
    DOB DATE
);


INSERT INTO Student VALUES
(1001,'Surekha Joshi','Female',82,'12','A','Science','1998-03-08'),
(1002,'MAAHI AGARWAL','Female',56,'11','C','Commerce','2008-11-23'),
(1003,'Sanam Verma','Male',59,'11','C','Commerce','2006-06-29'),
(1004,'Ronit Kumar','Male',63,'11','C','Commerce','1997-11-05'),
(1005,'Dipesh Pulkit','Male',78,'11','B','Science','2003-09-14'),
(1006,'JAHANVI Puri','Female',60,'11','B','Commerce','2008-11-07'),
(1007,'Sanam Kumar','Male',23,'12','F','Commerce','1998-03-08'),
(1008,'SAHIL SARAS','Male',56,'11','C','Commerce','2008-11-07'),
(1009,'AKSHRA AGARWAL','Female',72,'12','B','Commerce','1996-10-01'),
(1010,'STUTI MISHRA','Female',39,'11','F','Science','2008-11-23'),
(1011,'HARSH AGARWAL','Male',42,'11','C','Science','1998-03-08'),
(1012,'NIKUNJ AGARWAL','Male',49,'12','C','Commerce','1998-06-28'),
(1013,'AKRITI SAXENA','Female',89,'12','A','Science','2008-11-23'),
(1014,'TANI RASTOGI','Female',82,'12','A','Science','2008-11-23');



-- To display all the records form STUDENT table. SELECT * FROM student ;

SELECT * FROM Student;

-- To display any name and date of birth from the table STUDENT. SELECT StdName, DOB FROM student ;

SELECT StdName, DOB FROM Student;

-- To display all students record where percentage is greater of equal to 80 FROM student table. SELECT * FROM student WHERE percentage >= 80;

SELECT * FROM Student
WHERE Percentage >= 80;

-- To display student name, stream and percentage where percentage of student is more than 80. SELECT StdName, Stream, Percentage WHERE percentage > 80;

SELECT StdName, Stream, Percentage FROM Student
WHERE Percentage > 80;

-- To display all records of science students whose percentage is more than 75 form student table. SELECT * FORM student WHERE stream = ‘Science’ AND percentage > 75; 

SELECT * FROM Student
WHERE Stream = 'Science' AND Percentage > 75;