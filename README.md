# SARS Assignment
## TASK 1.1 - Normalisation

## Task 1.1(a) Partial and Transitive Dependencies
## Partial dependencies
The composite primary key is (student_id, course_code).
These are the attributes depend only on student_id:
- student_name
- department
- advisor_name
- advisor_email
These are the attributes depend only on course_code:
- course_name
- instructor_name
- instructor_email
These are the attributes depend on both student_id and course_code:
- enrollment_year
- marks_obtained

## Transitive Dependencies
advisor_name → advisor_email
instructor_name → instructor_email
course_code → instructor_name → instructor_email


## Task 1.1(b) BCNF Decomposition
The StudentRecords table is done into the following BCNF tables:

## Student
Primary Key: student_id
Attributes:
- student_id
- student_name
- department
- advisor_id
Foreign Key:
- advisor_id → Advisor(advisor_id)

## Advisor
Primary Key: advisor_id
Attributes:
- advisor_id
- advisor_name
- advisor_email

## Instructor
Primary Key: instructor_id
Attributes:
- instructor_id
- instructor_name
- instructor_email

## Course
Primary Key: course_code
Attributes:
- course_code
- course_name
- instructor_id
Foreign Key:
- instructor_id → Instructor(instructor_id)

## Enrollment
Primary Key: (student_id, course_code)
Attributes:
- student_id
- course_code
- enrollment_year
- marks_obtained
Foreign Keys:
- student_id → Student(student_id)
- course_code → Course(course_code)
This decomposition removes update, insertion, and deletion anomalies and satisfies BCNF because every non-key attribute depends only on the key.


## Task 1.1(c) Data Integrity
## Entity Integrity
This is Satisfied because every table has a primary key and primary key values cannot be NULL

## Referential Integrity
This is Satisfied by using foreign keys:
- Student.advisor_id references Advisor.advisor_id
- Course.instructor_id references Instructor.instructor_id
- Enrollment.student_id references Student.student_id
- Enrollment.course_code references Course.course_code

## Domain Integrity
This is Satisfied by using appropriate data types and constraints such as INT, VARCHAR, and marks_obtained values between 0 and 100

## User-defined Integrity
This si Satisfied by business rules such as:
- Every student must have a valid student_id
- Every course must have a unique course_code
- Marks must be within the allowed range

## Task 1.5 – Transaction and Concurrency
## Transaction
A transaction is a group of SQL statements that are executed as a single unit of work.

## COMMIT
COMMIT permanently saves changes.

## ROLLBACK
ROLLBACK cancels all changes that are made during the transaction if an error occurs.

## Non-Repeatable Read
This happens when a transaction reads the same row twice and gets different values because another transaction updated the data.

## MVCC (Multi-Version Concurrency Control)
MVCC allows multiple users to read data at the same time without blocking each other by keeping multiple versions of the data.


# Part 2 - SOLID Principles
## Single Responsibility Principle (SRP)
The Student class only manages student-related information. Email notifications are handled separately.

## Open/Closed Principle (OCP)
The Enrollment class can be extended by creating WaitlistedEnrollment without modifying the original Enrollment class.

## Dependency Inversion Principle (DIP)
The Enrollment class depends on the EnrollmentRepository interface rather than a specific database implementation.


