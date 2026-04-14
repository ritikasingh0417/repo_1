  SELECT Name FROM Student
   WHERE DepartmentID = (SELECT DepartmentID FROM Student WHERE StudentID='S401');

NAME
--------------------------------------------------
Aman
Neha
Karan

 SELECT Name FROM Student
   WHERE Gender = (SELECT Gender FROM Student WHERE StudentID='S402');

NAME
--------------------------------------------------
Riya
Neha
Simran
 SELECT Name FROM Student
   WHERE DepartmentID = (SELECT DepartmentID FROM Student WHERE StudentID='S403');

NAME
--------------------------------------------------
Aman
Neha
Karan

 SELECT Name FROM Student
 WHERE DepartmentID IN (
     SELECT DISTINCT DepartmentID FROM Student WHERE Gender='Female'
   );

NAME
--------------------------------------------------
Riya
Simran
Aman
Neha
Karan
 SELECT Name FROM Student
  WHERE StudentID IN (SELECT StudentID FROM Enrollment);

NAME
--------------------------------------------------
Aman
Riya
Neha
Simran
Karan
 SELECT Name FROM Student
    WHERE StudentID NOT IN (SELECT StudentID FROM Enrollment);

NAME
--------------------------------------------------
Raj
 SELECT CourseName FROM Course
  WHERE Credits > (SELECT AVG(Credits) FROM Course);

COURSENAME
--------------------------------------------------
DBMS
Maths
 SELECT Name FROM Student
    WHERE StudentID > 'S403';

NAME
--------------------------------------------------
Raj
Simran
Karan
 SELECT DepartmentID
   FROM Student
   GROUP BY DepartmentID
   HAVING COUNT(*) > (
          SELECT AVG(cnt)
        FROM (SELECT COUNT(*) cnt FROM Student GROUP BY DepartmentID)
   );

DEPARTMENT
----------
D1
 SELECT DISTINCT Name FROM Student
   WHERE StudentID IN (SELECT StudentID FROM Enrollment);

NAME
--------------------------------------------------
Aman
Riya
Neha
Simran
Karan
 SELECT Name FROM Student
   WHERE DepartmentID IS NOT NULL;

NAME
--------------------------------------------------
Aman
Riya
Neha
Raj
Simran
Karan

6 rows selected.
 SELECT CourseName FROM Course
   WHERE CourseID IN (SELECT CourseID FROM Enrollment);

COURSENAME
--------------------------------------------------
DBMS
OS
Maths
 SELECT CourseName FROM Course
   WHERE Credits = (SELECT MAX(Credits) FROM Course);

COURSENAME
--------------------------------------------------
Maths
 SELECT Name FROM Student
   WHERE StudentID IN (
       SELECT StudentID
      FROM Enrollment
       GROUP BY StudentID
       HAVING COUNT(*) > 1
   );

NAME
--------------------------------------------------
Aman

 SELECT DepartmentID
   FROM Student
  GROUP BY DepartmentID
   HAVING COUNT(*) = (
       SELECT MAX(cnt)
       FROM (SELECT COUNT(*) cnt FROM Student GROUP BY DepartmentID)
   );

DEPARTMENT
----------
D1

 SELECT DISTINCT Name FROM Student
   WHERE StudentID IN (
       SELECT StudentID FROM Enrollment
       WHERE CourseID IN (
          SELECT CourseID FROM Enrollment WHERE StudentID='S401'
       )
   );

NAME
--------------------------------------------------
Aman
Riya
Simran
Karan

 SELECT Name FROM Student
   WHERE StudentID NOT IN (SELECT StudentID FROM Enrollment);

NAME
--------------------------------------------------
Raj

SELECT CourseName FROM Course
   WHERE CourseID NOT IN (SELECT CourseID FROM Enrollment);