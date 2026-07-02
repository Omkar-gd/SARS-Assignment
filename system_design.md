# SARS - Software System Design
# Task 2.1 Requirements and Architecture Choice

## Task 2.1(a) Functional Requirements
1. Students can log in securely using the Authentication module
2. Students can view their marks and enroll in available courses using the Student Portal
3. Administrators can manage students, courses, and faculty through the Admin Panel

## Non-Functional Requirements
1. Scalability
The system should support up to 50,000 concurrent users during examination result publication.
Design Principle: Scalability

2. Security
The system must protect student records and user accounts using secure authentication and authorization.
Design Principle: Security

3. Availability
The system should remain accessible even during peak traffic and hardware failures.
Design Principle: Availability

# Task 2.1(b) Monolithic vs Microservices
# Monolithic Architecture
Advantages
- Easy to develop.
- Easy to deploy.
- Simpler management.
Disadvantages
- Difficult to scale individual modules.
- A failure in one module can affect the whole application.
- Updates require redeploying the entire application.

# Microservices Architecture
Advantages
- Each service can be deployed independently.
- Better fault isolation.
- Easier to scale individual services.
- Suitable for large applications.
Disadvantages
- More complex to manage.
- Requires communication between services.
- Monitoring is more difficult.

### Recommendation
- For SARS with 50,000 concurrent users, Microservices Architecture is recommended. It provides better scalability, independent deployment, and fault isolation. Although it increases management complexity, it is more suitable for handling high traffic and future expansion.

# Task 2.2 High-Level Design
# (a) Main Components
# 1. Authentication Service
Responsibility:
- User login and authentication.
Interface:
- REST API

# 2. Student Portal
Responsibility:
- View marks
- Enroll in courses
Interface:
- REST API

# 3. Admin Panel
Responsibility:
- Manage students
- Manage courses
- Manage faculty
Interface:
- REST API

# 4. Database
Responsibility:
- Store all student, course, enrollment and faculty information.
Interface:
- Database Query Interface

# (b) Layered Architecture
# Presentation Layer
Purpose:
Displays web pages and receives user input.
Receives:
- Login details
- Enrollment requests
- Marks request
Passes:
- User requests to Business Layer.

# Business Layer
Purpose:
Processes business logic.
Receives:
- Requests from Presentation Layer.
Passes:
- Database requests to Data Access Layer.

# Data Access Layer
Purpose:
Reads and writes data to the database.
Receives:
- SQL requests.
Returns:
- Student records
- Marks
- Course details

# (c) Scaling and Load Balancing
- Horizontal Scaling is recommended because SARS must support approximately 50,000 concurrent users.
- Multiple web servers can be added behind a Load Balancer.
- Load Balancing Algorithm : Round Robin
- Reason:
  It distributes requests equally among all servers and is simple and effective for handling large numbers of users.

# (d) Elasticity
- Elasticity allows the system to automatically increase servers during examination result publication and reduce servers during semester breaks.
- This reduces infrastructure cost while maintaining performance during peak traffic.

# (e) Session Management
Problem:
A student's session may exist only on Server A. If the next request goes to Server B, the student may be logged out.

- Strategy 1:
  Sticky Sessions
- Trade-off:
  If one server fails, user sessions are lost.

- Strategy 2:
  Store sessions in a shared database or Redis.
- Trade-off:
  Requires additional infrastructure but improves reliability and fault tolerance.
