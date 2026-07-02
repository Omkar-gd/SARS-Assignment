CREATE TABLE Advisor (
    advisor_id INT PRIMARY KEY,
    advisor_name VARCHAR(100) NOT NULL,
    advisor_email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE Instructor (
    instructor_id INT PRIMARY KEY,
    instructor_name VARCHAR(100) NOT NULL,
    instructor_email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    department VARCHAR(100) NOT NULL,
    advisor_id INT,
    FOREIGN KEY (advisor_id) REFERENCES Advisor(advisor_id)
);

CREATE TABLE Course (
    course_code VARCHAR(20) PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    instructor_id INT,
    FOREIGN KEY (instructor_id) REFERENCES Instructor(instructor_id)
);

CREATE TABLE Enrollment (
    student_id INT,
    course_code VARCHAR(20),
    enrollment_year INT NOT NULL,
    marks_obtained INT CHECK (marks_obtained BETWEEN 0 AND 100),
    PRIMARY KEY (student_id, course_code),
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (course_code) REFERENCES Course(course_code)
);
