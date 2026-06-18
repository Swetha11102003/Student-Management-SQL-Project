CREATE DATABASE student_management;
use student_management;

CREATE TABLE Students(
Student_id INT PRIMARY KEY,
Student_Name VARCHAR(50),
Gender VARCHAR(10),
Age INT,
Class INT
);

CREATE TABLE Subjects(
Subject_id INT PRIMARY KEY,
Subject_Name VARCHAR(50)
);


CREATE TABLE Marks(
Student_id INT,
Subject_id INT,
Marks INT,

FOREIGN KEY(STUDENT_ID) REFERENCES STUDENTS(STUDENT_ID),
FOREIGN KEY(SUBJECT_ID) REFERENCES SUBJECTS(SUBJECT_ID)
);

INSERT INTO Students VALUES
(101,'Rahul','Male',18,10),
(102,'Priya','Female',17,10),
(103,'Aman','Male',18,10),
(104,'Sneha','Female',17,10),
(105,'Kiran','Male',18,10);


INSERT INTO Subjects VALUES
(1,'Math'),
(2,'Science'),
(3,'English'),
(4,'Social'),
(5,'Computer');


INSERT INTO Marks VALUES
(101,1,95),
(101,2,88),
(101,3,90),
(101,4,85),
(101,5,92),


(102,1,89),
(102,2,91),
(102,3,90),
(102,4,85),
(102,5,92),


(103,1,75),
(103,2,80),
(103,3,78),
(103,4,82),
(103,5,76),


(104,1,92),
(104,2,95),
(104,3,93),
(104,4,89),
(104,5,91),


(105,1,68),
(105,2,72),
(105,3,70),
(105,4,75),
(105,5,74);


































































