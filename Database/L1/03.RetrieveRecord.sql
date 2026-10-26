USE DBEnrollment;

-- Task 1: List all students
SELECT StudentID, StudentName, Program -- specifies which columns u want to display
FROM student -- which table to retrieve the data
ORDER BY StudentID; -- sorts the results according to studentID
-- mysql default order : ascending ASC

-- Task 2: Find registrations for CS2010
SELECT s.StudentID, s.StudentName, e.CourseID -- student.StudentID
-- start with student table
FROM student AS s -- AS s : temporary alias
JOIN enrollment AS e -- JOIN : combines related rows from two tables
-- JOIN & ON : matching condition ( ex: if then)
    ON s.StudentID = e.StudentID -- first table : s.StudentID & s.StudentName, second table : s.StudentID & e.CourseID
WHERE e.CourseID = 'CS2010' -- filters to CS2010 only
ORDER BY s.StudentID; -- sorts studentId in asc

-- Task 3: Find blocked registrations for the 2015 intake
SELECT s.StudentName, e.CourseID, c.Description
FROM student AS s
JOIN enrollment AS e
    ON s.StudentID = e.StudentID
JOIN course AS c
    ON e.CourseID = c.CourseID
WHERE s.Intake = 2015
    AND e.CourseStatus = 'Blocked'
ORDER BY s.StudentID;