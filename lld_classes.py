class Student:
    def __init__(self, student_id, student_name, department):
        self.student_id = student_id
        self.student_name = student_name
        self.department = department
    def view_marks(self):
        pass
    def enroll_course(self, course_code):
        pass

class Enrollment:
    def __init__(self, enrollment_id, student_id, course_code, marks):
        self.enrollment_id = enrollment_id
        self.student_id = student_id
        self.course_code = course_code
        self.marks = marks
    def enroll(self):
        pass
    def drop_course(self):
        pass

class WaitlistedEnrollment(Enrollment):
    def enroll(self):
        print("Student added to waitlist")

class EnrollmentRepository:
    def save(self, enrollment):
        pass
    def delete(self, enrollment_id):
        pass
    def get_by_student(self, student_id):
        pass
