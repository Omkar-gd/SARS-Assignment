-- Task 1.3
-- Insert Advisors
INSERT INTO Advisor VALUES
(1, 'Rahul Sharma', 'rahul@university.edu'),
(2, 'Priya Mehta', 'priya@university.edu');

-- Insert Instructors
INSERT INTO Instructor VALUES
(1, 'Amit Verma', 'amit@university.edu'),
(2, 'Sneha Rao', 'sneha@university.edu');

-- Insert Students
INSERT INTO Student VALUES
(101, 'Omkar', 'Computer Science', 1),
(102, 'Riya', 'Information Science', 2),
(103, 'Arjun', 'Computer Science', 1);

-- Insert Courses
INSERT INTO Course VALUES
('CS101', 'Database Management Systems', 1),
('CS102', 'Operating Systems', 2);

-- Insert Enrollments
INSERT INTO Enrollment VALUES
(101, 'CS101', 2026, 85),
(102, 'CS102', 2026, 72),
(103, 'CS101', 2026, 30);

-- Update Instructor Email
UPDATE Instructor
SET instructor_email = 'amit.verma@university.edu'
WHERE instructor_id = 1;

-- Delete students with marks less than 35
DELETE FROM Enrollment
WHERE marks_obtained < 35;


-- Task 1.4
-- 1. Students enrolled in CS101 or CS102 (IN)
SELECT * FROM Enrollment
WHERE course_code IN ('CS101', 'CS102');

-- 2. Students with marks between 60 and 90 (BETWEEN)
SELECT * FROM Enrollment
WHERE marks_obtained BETWEEN 60 AND 90;

-- 3. Average marks department-wise (GROUP BY)
SELECT department, AVG(marks_obtained) AS average_marks
FROM Student
JOIN Enrollment
ON Student.student_id = Enrollment.student_id
GROUP BY department;

-- 4. Departments having average marks greater than 70 (HAVING)
SELECT department, AVG(marks_obtained) AS average_marks
FROM Student
JOIN Enrollment
ON Student.student_id = Enrollment.student_id
GROUP BY department
HAVING AVG(marks_obtained) > 70;

-- 5. Student names with course names (INNER JOIN)
SELECT student_name, course_name
FROM Student
INNER JOIN Enrollment
ON Student.student_id = Enrollment.student_id
INNER JOIN Course
ON Enrollment.course_code = Course.course_code;

-- 6. All students and their courses (LEFT JOIN)
SELECT student_name, course_name
FROM Student
LEFT JOIN Enrollment
ON Student.student_id = Enrollment.student_id
LEFT JOIN Course
ON Enrollment.course_code = Course.course_code;

-- 7. Students scoring above department average (Correlated Subquery)
SELECT student_name, marks_obtained
FROM Student s
JOIN Enrollment e
ON s.student_id = e.student_id
WHERE marks_obtained >
(
SELECT AVG(e2.marks_obtained)
FROM Student s2
JOIN Enrollment e2
ON s2.student_id = e2.student_id
WHERE s2.department = s.department
);

-- 8. Students not enrolled in CS102 (EXCEPT)
SELECT student_id
FROM Enrollment
EXCEPT
SELECT student_id
FROM Enrollment
WHERE course_code='CS102';

-- 9. ROW_NUMBER()
SELECT student_id,
marks_obtained,
ROW_NUMBER() OVER(ORDER BY marks_obtained DESC) AS row_num
FROM Enrollment;

-- 10. RANK()
SELECT student_id,
marks_obtained,
RANK() OVER(ORDER BY marks_obtained DESC) AS rank_num
FROM Enrollment;

-- 11. DENSE_RANK()
SELECT student_id,
marks_obtained,
DENSE_RANK() OVER(ORDER BY marks_obtained DESC) AS dense_rank_num
FROM Enrollment;
