USE myPractical;

CREATE TABLE course (
    Courseid CHAR(10) NOT NULL,
    Coursename VARCHAR(50)
);

INSERT INTO course (Courseid, Coursename)
VALUES
    ('CS1001', 'Programming'),
    ('CS2001', 'Advanced Programming'),
    ('CS3201', 'Neural Network');
    
SELECT * FROM course;

DELETE FROM course;
SELECT * FROM course;
DESCRIBE course;