# Complaint Management System

A comprehensive web application built with Java EE for managing and tracking complaints within an organization. This system provides a streamlined workflow for submitting, tracking, and resolving complaints with role-based access control.

## Features

### User Authentication
- Secure login and registration
- Role-based access control (Admin/Employee)
- Password encryption and security

### Complaint Management
- Submit new complaints with details and attachments
- Track complaint status in real-time
- Add comments and updates to complaints
- Search and filter functionality

### Admin Dashboard
- View all complaints
- Manage user accounts
- Generate reports
- Assign complaints to employees

### Employee Dashboard
- View assigned complaints
- Update complaint status
- Add resolution notes
- View complaint history

## Technologies Used

- **Backend**: Java EE, Servlets
- **Frontend**: JSP, HTML5, CSS3, JavaScript
- **Database**: MySQL
- **Build Tool**: Maven
- **Server**: Apache Tomcat
- **Security**: Session management, Input validation

## Usage

1. **Sign Up**
   - New users can register with their details
   - Default role is set to 'Employee'

2. **Sign In**
   - Enter your credentials
   - You'll be redirected to the appropriate dashboard

3. **Using the System**
   - Employees can submit and track complaints
   - Admins can manage users and view all complaints
   - Real-time updates and notifications
