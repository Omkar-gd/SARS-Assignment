# SARS Assignment
# TASK 1.1 - Normalisation
# Task 1.1(a) Partial and Transitive Dependencies

# Partial dependencies
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

# Transitive Dependencies
advisor_name → advisor_email
instructor_name → instructor_email
course_code → instructor_name → instructor_email


# Task 1.1(b) BCNF Decomposition
The StudentRecords table is done into the following BCNF tables:

# Student
Primary Key: student_id
Attributes:
- student_id
- student_name
- department
- advisor_id
Foreign Key:
- advisor_id → Advisor(advisor_id)

# Advisor
Primary Key: advisor_id
Attributes:
- advisor_id
- advisor_name
- advisor_email

# Instructor
Primary Key: instructor_id
Attributes:
- instructor_id
- instructor_name
- instructor_email

# Course
Primary Key: course_code
Attributes:
- course_code
- course_name
- instructor_id
Foreign Key:
- instructor_id → Instructor(instructor_id)

# Enrollment
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

