CREATE DATABASE Lab;
USE Lab;

-- Q1
CREATE TABLE lab5student (
  matricno VARCHAR(10) PRIMARY KEY,
  stuname  VARCHAR(50) NOT NULL,
  hpno     VARCHAR(25),
  cgpa     DECIMAL(5,2)
);

CREATE TABLE lab5course (
  courseid VARCHAR(15) PRIMARY KEY,
  cname    VARCHAR(50) NOT NULL,
  faculty  VARCHAR(25),
  credit   INT
);

CREATE TABLE lab5enrollment (
  matricno VARCHAR(10),
  courseid VARCHAR(15),
  semester VARCHAR(20),
  result   INT,
  grade    VARCHAR(5),
  PRIMARY KEY (matricno, courseid, semester),
  FOREIGN KEY (matricno) REFERENCES lab5student(matricno),
  FOREIGN KEY (courseid) REFERENCES lab5course(courseid)
);

-- Q2
INSERT INTO lab5student (matricno, stuname, hpno, cgpa) VALUES
('S53001', 'Ahmad Faiz Ali',       '012-3456781', 3.45),
('S53002', 'Nur Aisyah Hamzah',    '013-4567892', 3.80),
('S53003', 'Muhammad Irfan Razak', '014-5678903', 2.95),
('S53004', 'Siti Aminah Omar',     '011-6789014', 3.20),
('S53005', 'Wan Hakim Wan Ismail', '019-7890125', 3.60);

INSERT INTO lab5course (courseid, cname, faculty, credit) VALUES
('CSF3101', 'Programming',            'Computer Science', 3),
('CSF3201', 'Database',               'Computer Science', 3),
('CSF3303', 'Software Engineering',   'Computer Science', 3),
('CSF3402', 'Advanced Database',      'Computer Science', 4),
('CSF3501', 'Computer Networks',      'Computer Science', 3);

INSERT INTO lab5enrollment (matricno, courseid, semester, result, grade) VALUES
('S53001', 'CSF3201', '2025/2026-1', 78, 'A-'),
('S53001', 'CSF3402', '2025/2026-2', 85, 'A'),
('S53002', 'CSF3402', '2025/2026-2', 91, 'A'),
('S53002', 'CSF3101', '2025/2026-1', 88, 'A'),
('S53003', 'CSF3303', '2025/2026-1', 65, 'B'),
('S53004', 'CSF3402', '2025/2026-2', 72, 'B+'),
('S53004', 'CSF3501', '2025/2026-1', 69, 'B'),
('S53005', 'CSF3201', '2025/2026-1', 80, 'A-');

SELECT * FROM lab5student;
SELECT * FROM lab5course;
SELECT * FROM lab5enrollment;

-- 3a. Inner join with USING
SELECT matricno, stuname, courseid, cname
FROM lab5student
INNER JOIN lab5enrollment USING (matricno)
INNER JOIN lab5course     USING (courseid)
WHERE courseid = 'CSF3402';

-- 3b. Same query with ON (for comparison)
SELECT s.matricno, s.stuname, c.courseid, c.cname
FROM lab5student s
INNER JOIN lab5enrollment e ON s.matricno = e.matricno
INNER JOIN lab5course c     ON e.courseid = c.courseid
WHERE c.courseid = 'CSF3402';

-- 3c. Difference is visible with SELECT *
SELECT * FROM lab5student JOIN lab5enrollment USING (matricno);   -- matricno appears once
SELECT * FROM lab5student s JOIN lab5enrollment e ON s.matricno = e.matricno;  -- matricno appears twice

-- JUSTIFICATION
-- * Both queries return the same rows: S53001, S53002 and S53004 for CSF3402.
-- * USING works only when the join columns have the SAME NAME in both tables
--   (matricno, courseid here) and only for equality joins; ON can join
--   differently named columns and use other operators.
-- * With USING the shared column is merged and appears once in SELECT *,
--   and it needs no table prefix. With ON the column appears twice
--   (s.matricno, e.matricno) and must be prefixed to avoid ambiguity.
