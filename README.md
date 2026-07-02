# SARS Assignment
# TASK 1.1 - Normalisation
# Task 1.1(a) Partial and Transitive Dependencies

# Partial Dependencies
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


