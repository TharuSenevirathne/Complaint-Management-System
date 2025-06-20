# Complaint Management System 

## 📝 Project Overview

This is a **Web-Based Complaint Management System** developed using **Jakarta EE**, **JSP**, and **MySQL** for the **IJSE GDSE Advanced API Development Assignment**. The system is designed for internal use by municipal employees and administrators to manage complaints through a secure, session based interface.

It supports:
- Complaint submission, tracking, and resolution.
- Role-based access for **Employees** and **Admins**.
- Synchronous form submissions only (AJAX strictly avoided).
- Structured according to the **MVC (Model-View-Controller)** architecture.

---

## 🛠️ Technology Stack

| Component | Technology |
|----------|------------|
| Frontend | JSP, HTML, CSS, JavaScript (form validation only) |
| Backend | Jakarta EE (Servlets), Apache Commons DBCP |
| Database | MySQL (via DBCP connection pool) |
| Server | Apache Tomcat |
| Architecture | MVC |

---

## 🚀 Features

### 🔐 Authentication Module
- Secure user login with session handling.
- Role-based dashboards for Admin and Employee.

### 📋 Complaint Management
**Employee:**
- Submit new complaints.
- View, edit, or delete own complaints (if unresolved).

**Admin:**
- View all submitted complaints.
- Update complaint status and add remarks.
- Delete any complaint.

---

