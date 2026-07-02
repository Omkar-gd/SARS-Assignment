class Student:
    def __init__(self, name):
        self.name = name
    def update(self, message):
        print(self.name + " received notification: " + message)

class Course:
    def __init__(self):
        self.students = []
    def subscribe(self, student):
        self.students.append(student)
    def unsubscribe(self, student):
        self.students.remove(student)
    def notify(self, message):
        for student in self.students:
            student.update(message)

course = Course()
student1 = Student("Omkar")
student2 = Student("Riya")
course.subscribe(student1)
course.subscribe(student2)
course.notify("Exam schedule has been updated.")
