USE DBEnrollment;

-- Task 1: Count students enrolled in Basic Programming (CS1001)
SELECT COUNT(*) AS TotalStudents
FROM enrollment
WHERE CourseID = 'CS1001';

-- Task 2: Calculate total active credits per student
SELECT -- which columns to display
    s.StudentID, -- ex: s123
    s.StudentName, -- ex: ali 
    -- ex : sum of credit Ali has 
    SUM(c.Credit) AS TotalActiveCredits -- sum: adds up credit value , result named as TotalActive Credits
FROM student AS s -- retrieve data from student table
JOIN enrollment AS e -- combines student and enrollment table
    ON s.StudentID = e.StudentID -- condition : matches each student with their enrollment records
JOIN course AS c -- brings in course table
    ON e.CourseID = c.CourseID 
WHERE e.CourseStatus = 'Active'  -- for enrollment course status : active ONLY 
GROUP BY s.StudentID, s.StudentName -- make Ali's rows as one group
ORDER BY s.StudentID; -- sorts by ascending studentID