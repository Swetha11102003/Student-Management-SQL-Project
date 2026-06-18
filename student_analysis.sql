use student_management;

SELECT * FROM Students;

SELECT * FROM Subjects;

SELECT * FROM Marks;



-- How many students are there?
SELECT COUNT(Student_id) AS TOTAL_STUDENTS from students;

-- How many male and female students are there?
SELECT COUNT(STUDENT_ID) AS TOTAL_STUDENTS,GENDER FROM Students GROUP BY GENDER;

-- What is the average age of students?
SELECT AVG(Age) AS Average_age FROM Students;

-- List students in descending order of age.
SELECT Student_name,Age FROM Students ORDER BY Student_name,Age DESC;

-- How many subjects are there?
SELECT COUNT(Subject_id) AS TOTAL_SUBJECTS FROM Subjects;


-- What is the average mark in each subject?
SELECT Subject_id,AVG(Marks) AS AVERAGE_Marks FROM Marks GROUP BY Subject_id;

-- What is the highest mark in each subject?
SELECT Subject_id,MAX(Marks) AS High_marks FROM Marks GROUP BY Subject_id;

-- What is the lowest mark in each subject?
SELECT Subject_id,MIN(Marks) AS LOW_marks FROM Marks GROUP BY Subject_id;

-- Calculate the total marks of each student.
SELECT Student_id,SUM(Marks) AS Total_marks FROM Marks GROUP BY Student_id;

-- Calculate the average marks of each student.
SELECT Student_id,AVG(Marks) AS Average_marks FROM Marks GROUP BY Student_id;


-- Show student names along with their marks.
SELECT Student_name,Marks FROM Students INNER JOIN Marks ON Students.Student_id=Marks.Student_id;

-- Show student names and subject names.
SELECT STUDENT_NAME,Subject_name,Marks FROM STUDENTs INNER JOIN Marks ON STUDENTS.STUDENT_ID=MARKS.STUDENT_ID INNER JOIN SUBJECTS ON Subjects.Subject_id=Marks.Subject_id WHERE Student_NAME='RAHUL';

-- Show Rahul's marks in all subjects.
SELECT STUDENT_NAME,Subject_name,Marks FROM STUDENTs INNER JOIN Marks ON STUDENTS.STUDENT_ID=MARKS.STUDENT_ID INNER JOIN SUBJECTS ON Subjects.Subject_id=Marks.Subject_id;

-- Find the topper in Math.
SELECT STUDENT_NAME,Subject_name,Marks AS HIGH FROM STUDENTs INNER JOIN Marks ON STUDENTS.STUDENT_ID=MARKS.STUDENT_ID INNER JOIN SUBJECTS ON Subjects.Subject_id=Marks.Subject_id WHERE SUBJECT_NAME='MATH' ORDER BY MARKS DESC LIMIT 1;

-- Find the student with the highest total marks.
SELECT STUDENT_NAME,SUM(Marks) AS TOTAL_MARKS FROM STUDENTs INNER JOIN Marks ON STUDENTS.STUDENT_ID=MARKS.STUDENT_ID GROUP BY STUDENT_NAME ORDER BY TOTAL_MARKS LIMIT 1;


/* Classify marks:
>=90 : Excellent
75–89 : Good
50–74 : Average
<50 : Needs Improvement */

SELECT MARKS,
CASE
	WHEN MARKS>=90 THEN 'EXCELLENT'
	WHEN MARKS>=75 THEN 'GOOD'
	WHEN MARKS>=50 THEN 'AVERAGE'
	ELSE 'NEEDS IMPROVEMENT'
END AS RESULTS
FROM MARKS;


-- Show Pass/Fail status.

SELECT
CASE
	WHEN MARKS>=50 THEN 'PASS'
	ELSE 'ELSE'
END AS RESULTS
FROM MARKS;

-- ----------- -- SUBQUERIES -- ---------------
-- Find students scoring above the overall average
SELECT MARKS FROM MARKS WHERE MARKS>(SELECT AVG(MARKS) FROM MARKS);

-- Find subjects with above-average marks.
SELECT SUBJECT_ID FROM MARKS WHERE MARKS>(SELECT AVG(MARKS) FROM MARKS);


-- Use a CTE to find the class topper.(CTE)
WITH TOPPER AS
(SELECT AVG(MARKS) AS AVERAGE_MARKS FROM MARKS
)
SELECT * FROM MARKS WHERE MARKS>(SELECT AVERAGE_MARKS FROM TOPPER);


-- ------------------(WINDOW FUNCTIONS)----------------------

-- Rank students by total marks.
SELECT STUDENT_ID,SUM(MARKS) AS TOTAL_MARKS,
RANK() OVER(ORDER BY SUM(MARKS) DESC) AS STUDENT_RANK FROM MARKS GROUP BY STUDENT_ID;


-- Find the top 3 students.

WITH STU_RK AS(
SELECT STUDENT_ID,SUM(MARKS) AS TOTAL_MARKS,
RANK() OVER(ORDER BY SUM(MARKS) DESC
) AS STUDENT_RANK 
FROM MARKS 
GROUP BY STUDENT_ID)
SELECT * FROM STU_RK WHERE STUDENT_RANK<=3;


-- Assign row numbers to students.

WITH ROW_N AS(
SELECT STUDENT_ID,SUM(MARKS) AS TOTAL_MARKS,
ROW_NUMBER() OVER(ORDER BY SUM(MARKS) DESC
) AS STUDENT_ROW 
FROM MARKS 
GROUP BY STUDENT_ID)
SELECT * FROM ROW_N;


-- Find the previous student's total using LAG().
WITH PREV_N AS(
SELECT STUDENT_ID,SUM(MARKS) AS TOTAL_MARKS
FROM MARKS 
GROUP BY STUDENT_ID)
SELECT STUDENT_ID,TOTAL_MARKS,LAG(TOTAL_MARKS) OVER(ORDER BY TOTAL_MARKS DESC
) AS PREVIOUS_TOTAL FROM PREV_N;


-- Find the next student's total using LEAD().
WITH NEXT_N AS(
SELECT STUDENT_ID,SUM(MARKS) AS TOTAL_MARKS,
LEAD(SUM(MARKS)) OVER(ORDER BY SUM(MARKS) DESC
) AS NEXT_TOTAL
FROM MARKS 
GROUP BY STUDENT_ID)
SELECT * FROM NEXT_N;













