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
