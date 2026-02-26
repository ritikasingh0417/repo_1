CREATE TABLE Department (
  2      DeptID INT PRIMARY KEY,
  3      DeptName VARCHAR(100),
  4      Block VARCHAR(50)
  5  );

 CREATE TABLE Student (
  2      StudentID NUMBER PRIMARY KEY,
  3      Name VARCHAR(100),
  4      DOB DATE,
  5      Gender CHAR(1),
  6      Phone VARCHAR(15),
  7      DeptID INT,
  8      FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
  9  );

Table created.
 CREATE TABLE Faculty (
  2      FacultyID INT PRIMARY KEY,
  3      Name VARCHAR(100),
  4      Designation VARCHAR(100),
  5      Email VARCHAR(100),
  6      DeptID INT,
  7      FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
  8  );

Table created.

 CREATE TABLE Course (
  2      CourseID INT PRIMARY KEY,
  3      CourseName VARCHAR(100),
  4      Credits INT,
  5      DeptID INT,
  6      FacultyID INT,
  7      FOREIGN KEY (DeptID) REFERENCES Department(DeptID),
  8      FOREIGN KEY (FacultyID) REFERENCES Faculty(FacultyID)
  9  );

Table created.
 CREATE TABLE Enrollment (
  2      EnrollID INT PRIMARY KEY,
  3      Semester VARCHAR(10),
  4      Grade VARCHAR(5),
  5      StudentID NUMBER,
  6      CourseID INT,
  7      FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
  8      FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
  9  );

Table created.

 INSERT INTO Department VALUES (101, 'Civil Engineering', 'Block A');

1 row created.

 INSERT INTO Department VALUES (102, 'Mechanical Engineering', 'Block B');

1 row created.

 INSERT INTO Department VALUES (105, 'Computer Science and Engineering', 'Block C');

1 row created.

 INSERT INTO Department VALUES (110, 'Electrical and Electronics Engineering', 'Block D');

1 row created.
 INSERT INTO Department VALUES (118, '3D Animation and Graphics', 'Block E');

1 row created.

 INSERT INTO Department VALUES (119, 'Civil Engineering with Computer Application', 'Block F');

1 row created.

 INSERT INTO Department VALUES (157, 'Computer Science and Engineering (AIML)', 'Block G');

1 row created.

 INSERT INTO Student VALUES (23101128001, 'Saksham kumar', DATE '2005-09-11', 'M', '6745231299', 101);

1 row created.
 INSERT INTO Student VALUES (23105128002, 'Shreya Raj', DATE '2004-03-18', 'F', '7890654324', 105);

1 row created.

 INSERT INTO Student VALUES (23105128002, 'Rakesh Kumar', DATE '2003-12-07', 'M', '8790876543', 105);

1 row created.

 INSERT INTO Student VALUES (23110128001, 'Himanshu Bhaskar', DATE '2003-09-18', 'M', '9128475601', 110);

1 row created.

 INSERT INTO Student VALUES (23157128001, 'Ritika Kumari', DATE '2004-03-12', 'F', '9126700011', 157);

1 row created.

 INSERT INTO Faculty VALUES (518, 'E. Haque', 'Associate Professor', 'ehtasham47@gmail.com', 105);

1 row created.

 INSERT INTO Faculty VALUES (519, 'Md. Izhar', 'Associate Professor', 'mdizhar1996@gmail.com', 105);

1 row created.

 INSERT INTO Faculty VALUES (523, 'Praveen Kumar', 'Assistant Professor', 'praveenkumaryadav782@gmail.com', 157);

1 row created.

 INSERT INTO Faculty VALUES (506, 'Rupesh Kumar', 'Associate Professor', 'rupesh.kumar@gmail.com', 101);

1 row created.
 INSERT INTO Course VALUES (105501, 'Artificial Intelligence', 4, 105, 518);

1 row created.

 INSERT INTO Course VALUES (105502, 'Database Management Systems', 4, 105, 519);

1 row created.

 INSERT INTO Course VALUES (621, 'Machine Learning', 4, 157, 523);

1 row created.

 INSERT INTO Course VALUES (101503, 'Geotechnical Engineering I', 4, 101, 506);

1 row created.

 INSERT INTO Enrollment VALUES (1201, '5th', 'A', 23105128001, 105501);

1 row created.

 INSERT INTO Enrollment VALUES (1202, '5th', 'A-', 23105128001, 105502);

1 row created.

 INSERT INTO Enrollment VALUES (1206, '5th', 'B+', 23105128002, 105501);

1 row created.

 SELECT S.StudentID, S.Name, E.CourseID FROM Student S INNER JOIN Enrollment E ON S.StudentID = E.StudentID;

 STUDENTID
----------
NAME
--------------------------------------------------------------------------------
  COURSEID
----------
2.3105E+10
Shreya Raj
    105501

2.3105E+10
Shreya Raj
    105502

 STUDENTID
----------
NAME
--------------------------------------------------------------------------------
  COURSEID
----------

2.3105E+10
Rakesh kumar
    105501

 SELECT S.Name, E.Semester FROM Student S INNER JOIN Enrollment E ON S.StudentID = E.StudentID;

NAME
--------------------------------------------------------------------------------
SEMESTER
----------
Shreya Raj
5th

Shreya Raj
5th

Rakesh kumar
5th
 SELECT S.Name, E.Grade FROM Student S INNER JOIN Enrollment E ON S.StudentID = E.StudentID;

NAME
--------------------------------------------------------------------------------
GRADE
-----
Shreya Raj
A

Shreya Raj
A-

Rakesh kumar
B+

 SELECT C.CourseName, C.Credits, F.Name FROM Course C INNER JOIN Faculty F ON C.FacultyID = F.FacultyID;

COURSENAME
--------------------------------------------------------------------------------
   CREDITS
----------
NAME
--------------------------------------------------------------------------------
Artificial Intelligence
         4
E. Haque

Database Management Systems
         4
Md. Izhar

COURSENAME
--------------------------------------------------------------------------------
   CREDITS
----------
NAME
--------------------------------------------------------------------------------

Machine Learning
         4
Praveen Kumar

Geotechnical Engineering I
         4

COURSENAME
--------------------------------------------------------------------------------
   CREDITS
----------
NAME
--------------------------------------------------------------------------------
Rupesh Kumar

 SELECT C.CourseName FROM Course C INNER JOIN Faculty F ON C.FacultyID = F.FacultyID WHERE F.FacultyID = 523;

COURSENAME
--------------------------------------------------------------------------------
Machine Learning

 SELECT F.Name, F.Designation, C.CourseName FROM Faculty F INNER JOIN Course C ON F.FacultyID = C.FacultyID;

NAME
--------------------------------------------------------------------------------
DESIGNATION
--------------------------------------------------------------------------------
COURSENAME
--------------------------------------------------------------------------------
E. Haque
Associate Professor
Artificial Intelligence

Md. Izhar
Associate Professor
Database Management Systems

NAME
--------------------------------------------------------------------------------
DESIGNATION
--------------------------------------------------------------------------------
COURSENAME
--------------------------------------------------------------------------------

Praveen Kumar
Assistant Professor
Machine Learning

Rupesh Kumar
Associate Professor

NAME
--------------------------------------------------------------------------------
DESIGNATION
--------------------------------------------------------------------------------
COURSENAME
--------------------------------------------------------------------------------
Geotechnical Engineering I

 SELECT S.Name, C.CourseName FROM Student S INNER JOIN Enrollment E ON S.StudentID = E.StudentID INNER JOIN Course C ON E.CourseID = C.CourseID;

NAME
--------------------------------------------------------------------------------
COURSENAME
--------------------------------------------------------------------------------
Shreya Raj
Artificial Intelligence

Shreya Raj
Database Management Systems

Rakesh kumar
Artificial Intelligence
 SELECT S.Name, C.CourseName, E.Semester FROM Student S INNER JOIN Enrollment E ON S.StudentID = E.StudentID INNER JOIN Course C ON E.CourseID = C.CourseID;

NAME
--------------------------------------------------------------------------------
COURSENAME
--------------------------------------------------------------------------------
SEMESTER
----------
Shreya Raj
Artificial Intelligence
5th

Shreya Raj
Database Management Systems
5th

NAME
--------------------------------------------------------------------------------
COURSENAME
--------------------------------------------------------------------------------
SEMESTER
----------

Rakesh kumar
Artificial Intelligence
5th

 SELECT S.Name, C.CourseName, E.Grade FROM Student S INNER JOIN Enrollment E ON S.StudentID = E.StudentID INNER JOIN Course C ON E.CourseID = C.CourseID WHERE E.Semester = '5th';

NAME
--------------------------------------------------------------------------------
COURSENAME
--------------------------------------------------------------------------------
GRADE
-----
Shreya Raj
Artificial Intelligence
A

Shreya Raj
Database Management Systems
A-

NAME
--------------------------------------------------------------------------------
COURSENAME
--------------------------------------------------------------------------------
GRADE
-----

Rakesh kumar
Artificial Intelligence
B+
 SELECT C.CourseName FROM Course C INNER JOIN Enrollment E ON C.CourseID = E.CourseID WHERE E.StudentID = 23105128001;

COURSENAME
--------------------------------------------------------------------------------
Artificial Intelligence
Database Management Systems

SELECT S.Name, S.DeptID, C.CourseName FROM Student S INNER JOIN Enrollment E ON S.StudentID = E.StudentID INNER JOIN Course C ON E.CourseID = C.CourseID;

NAME
--------------------------------------------------------------------------------
    DEPTID
----------
COURSENAME
--------------------------------------------------------------------------------
Shreya Raj
       105
Artificial Intelligence

Shreya Raj
       105
Database Management Systems

NAME
--------------------------------------------------------------------------------
    DEPTID
----------
COURSENAME
--------------------------------------------------------------------------------

Rakesh Kumar
       105
Artificial Intelligence

 SELECT D.DeptName, C.CourseName FROM Department D INNER JOIN Course C ON D.DeptID = C.DeptID;

DEPTNAME
--------------------------------------------------------------------------------
COURSENAME
--------------------------------------------------------------------------------
Computer Science and Engineering
Artificial Intelligence

Computer Science and Engineering
Database Management Systems

Computer Science and Engineering (AIML)
Machine Learning


DEPTNAME
--------------------------------------------------------------------------------
COURSENAME
--------------------------------------------------------------------------------
Civil Engineering
Geotechnical Engineering I
 SELECT F.Name, D.DeptName FROM Faculty F INNER JOIN Department D ON F.DeptID = D.DeptID;

NAME
--------------------------------------------------------------------------------
DEPTNAME
--------------------------------------------------------------------------------
E. Haque
Computer Science and Engineering

Md. Izhar
Computer Science and Engineering

Praveen Kumar
Computer Science and Engineering (AIML)


NAME
--------------------------------------------------------------------------------
DEPTNAME
--------------------------------------------------------------------------------
Rupesh Kumar
Civil Engineering

 SELECT S.Name, C.CourseName FROM Student S INNER JOIN Enrollment E ON S.StudentID = E.StudentID INNER JOIN Course C ON E.CourseID = C.CourseID WHERE S.DeptID = 105;

NAME
--------------------------------------------------------------------------------
COURSENAME
--------------------------------------------------------------------------------
Shreya Raj
Artificial Intelligence

Shreya Raj
Database Management Systems

Rakesh Kumar
Artificial Intelligence

 SELECT S.Name, C.CourseName FROM Student S INNER JOIN Enrollment E ON S.StudentID = E.StudentID INNER JOIN Course C ON E.CourseID = C.CourseID ORDER BY S.Name ASC;

NAME
--------------------------------------------------------------------------------
COURSENAME
--------------------------------------------------------------------------------
Rakesh Kumar
Artificial Intelligence

Shreya Raj
Artificial Intelligence

Shreya Raj
Database Management Systems
 SELECT F.Name, C.CourseName, C.Credits FROM Faculty F INNER JOIN Course C ON F.FacultyID = C.FacultyID ORDER BY C.Credits DESC;

NAME
--------------------------------------------------------------------------------
COURSENAME
--------------------------------------------------------------------------------
   CREDITS
----------
E. Haque
Artificial Intelligence
         4

Rupesh Kumar
Geotechnical Engineering I
         4

NAME
--------------------------------------------------------------------------------
COURSENAME
--------------------------------------------------------------------------------
   CREDITS
----------

Praveen Kumar
Machine Learning
         4

Md. Izhar
Database Management Systems

NAME
--------------------------------------------------------------------------------
COURSENAME
--------------------------------------------------------------------------------
   CREDITS
----------
         4

 SELECT C.CourseName, COUNT(E.StudentID) FROM Course C INNER JOIN Enrollment E ON C.CourseID = E.CourseID GROUP BY C.CourseName;

COURSENAME
--------------------------------------------------------------------------------
COUNT(E.STUDENTID)
------------------
Artificial Intelligence
                 2

Database Management Systems
                 1


 SELECT F.Name, COUNT(C.CourseID) FROM Faculty F INNER JOIN Course C ON F.FacultyID = C.FacultyID GROUP BY F.Name;

NAME
--------------------------------------------------------------------------------
COUNT(C.COURSEID)
-----------------
E. Haque
                1

Md. Izhar
                1

Praveen Kumar
                1


NAME
--------------------------------------------------------------------------------
COUNT(C.COURSEID)
-----------------
Rupesh Kumar
                1

 SELECT D.DeptName, COUNT(S.StudentID) FROM Department D INNER JOIN Student S ON D.DeptID = S.DeptID GROUP BY D.DeptName;

DEPTNAME
--------------------------------------------------------------------------------
COUNT(S.STUDENTID)
------------------
Civil Engineering
                 1

Computer Science and Engineering
                 2

Electrical and Electronics Engineering
                 1


DEPTNAME
--------------------------------------------------------------------------------
COUNT(S.STUDENTID)
------------------
Computer Science and Engineering (AIML)
                 1

 SELECT C.CourseName, MIN(E.Grade) AS MaxGrade FROM Course C INNER JOIN Enrollment E ON C.CourseID = E.CourseID GROUP BY C.CourseName;