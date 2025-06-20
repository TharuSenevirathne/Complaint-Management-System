<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 6/16/2025
  Time: 3:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<%@ page import="edu.vidura.model.bean.Complaint" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<Complaint> complaints = (List<Complaint>) request.getAttribute("complaints");
    String username = (String) session.getAttribute("user");

    String updateId = request.getParameter("updateId");
    Complaint updateComplaint = null;
    if (updateId != null && complaints != null) {
        for (Complaint c : complaints) {
            if (String.valueOf(c.getId()).equals(updateId)) {
                updateComplaint = c;
                break;
            }
        }
    }
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - ComplaintHub</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-red: #dc2626;
            --secondary-red: #ef4444;
            --light-red: #fee2e2;
            --dark-red: #991b1b;
            --pure-white: #ffffff;
            --light-gray: #f8fafc;
            --medium-gray: #e2e8f0;
            --dark-gray: #1f2937;
            --success-green: #10b981;
            --warning-orange: #f59e0b;
            --shadow-light: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
            --shadow-medium: 0 10px 15px -3px rgba(0, 0, 0, 0.1);
            --shadow-heavy: 0 20px 25px -5px rgba(0, 0, 0, 0.1);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, var(--light-gray) 0%, var(--light-red) 100%);
            min-height: 100vh;
            line-height: 1.6;
        }

        .sidebar {
            position: fixed;
            top: 0;
            left: 0;
            height: 100vh;
            width: 280px;
            background: linear-gradient(180deg, var(--primary-red) 0%, var(--dark-red) 100%);
            color: white;
            padding: 30px 0;
            box-shadow: var(--shadow-heavy);
            z-index: 1000;
            transition: transform 0.3s ease;
        }

        .sidebar-header {
            padding: 0 30px;
            margin-bottom: 40px;
            border-bottom: 1px solid rgba(255, 255, 255, 0.2);
            padding-bottom: 30px;
        }

        .sidebar-brand {
            font-size: 1.8rem;
            font-weight: 800;
            margin-bottom: 10px;
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .sidebar-subtitle {
            opacity: 0.8;
            font-size: 0.9rem;
            font-weight: 400;
        }

        .sidebar-nav {
            list-style: none;
            padding: 0 15px;
        }

        .nav-item {
            margin-bottom: 8px;
        }

        .nav-link {
            display: flex;
            align-items: center;
            gap: 15px;
            padding: 15px 20px;
            color: rgba(255, 255, 255, 0.9);
            text-decoration: none;
            border-radius: 12px;
            transition: all 0.3s ease;
            font-weight: 500;
        }

        .nav-link:hover, .nav-link.active {
            background: rgba(255, 255, 255, 0.15);
            color: white;
            transform: translateX(5px);
        }

        .nav-link i {
            font-size: 1.1rem;
            width: 20px;
        }

        .main-content {
            margin-left: 280px;
            padding: 30px;
            min-height: 100vh;
        }

        .top-bar {
            background: white;
            border-radius: 20px;
            padding: 20px 30px;
            margin-bottom: 30px;
            box-shadow: var(--shadow-light);
            display: flex;
            justify-content: between;
            align-items: center;
            flex-wrap: wrap;
            gap: 20px;
        }

        .welcome-section {
            flex: 1;
        }

        .welcome-title {
            font-size: 1.8rem;
            font-weight: 700;
            color: var(--dark-gray);
            margin-bottom: 5px;
        }

        .welcome-subtitle {
            color: #6b7280;
            font-size: 1rem;
        }

        .top-actions {
            display: flex;
            gap: 15px;
            align-items: center;
        }

        .logout-btn {
            background: linear-gradient(135deg, var(--primary-red), var(--secondary-red));
            color: white;
            padding: 12px 25px;
            border-radius: 50px;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s ease;
            box-shadow: var(--shadow-light);
            border: none;
            cursor: pointer;
        }

        .logout-btn:hover {
            transform: translateY(-2px);
            box-shadow: var(--shadow-medium);
            color: white;
        }

        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 25px;
            margin-bottom: 30px;
        }

        .stat-card {
            background: white;
            padding: 30px;
            border-radius: 20px;
            box-shadow: var(--shadow-light);
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .stat-card:hover {
            transform: translateY(-5px);
            box-shadow: var(--shadow-medium);
        }

        .stat-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 4px;
            background: linear-gradient(90deg, var(--primary-red), var(--secondary-red));
        }

        .stat-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 15px;
        }

        .stat-title {
            font-size: 0.9rem;
            font-weight: 600;
            color: #6b7280;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .stat-icon {
            width: 50px;
            height: 50px;
            border-radius: 15px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
            color: white;
        }

        .stat-icon.total {
            background: linear-gradient(135deg, var(--primary-red), var(--secondary-red));
        }

        .stat-icon.pending {
            background: linear-gradient(135deg, var(--warning-orange), #fbbf24);
        }

        .stat-icon.resolved {
            background: linear-gradient(135deg, var(--success-green), #34d399);
        }

        .stat-number {
            font-size: 2.5rem;
            font-weight: 800;
            color: var(--dark-gray);
            margin-bottom: 5px;
        }

        .stat-label {
            color: #6b7280;
            font-size: 0.9rem;
        }

        .alert-modern {
            border: none;
            border-radius: 15px;
            padding: 20px 25px;
            margin-bottom: 25px;
            box-shadow: var(--shadow-light);
            position: relative;
            overflow: hidden;
        }

        .alert-modern.alert-success {
            background: linear-gradient(135deg, #d1fae5, #ecfdf5);
            color: #065f46;
            border-left: 4px solid var(--success-green);
        }

        .alert-modern.alert-danger {
            background: linear-gradient(135deg, #fee2e2, #fef2f2);
            color: #991b1b;
            border-left: 4px solid var(--primary-red);
        }

        .update-form-container {
            background: white;
            border-radius: 20px;
            padding: 35px;
            margin-bottom: 30px;
            box-shadow: var(--shadow-light);
            border: 1px solid var(--medium-gray);
        }

        .update-form-header {
            display: flex;
            align-items: center;
            gap: 15px;
            margin-bottom: 25px;
            padding-bottom: 20px;
            border-bottom: 2px solid var(--light-red);
        }

        .update-form-header h2 {
            color: var(--dark-gray);
            font-weight: 700;
            margin: 0;
        }

        .update-form-header i {
            color: var(--primary-red);
            font-size: 1.5rem;
        }

        .complaint-info {
            background: linear-gradient(135deg, var(--light-red), var(--pure-white));
            padding: 25px;
            border-radius: 15px;
            margin-bottom: 25px;
            border: 1px solid rgba(220, 38, 38, 0.1);
        }

        .info-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 15px;
        }

        .info-item {
            display: flex;
            flex-direction: column;
            gap: 5px;
        }

        .info-label {
            font-weight: 600;
            color: var(--dark-gray);
            font-size: 0.9rem;
        }

        .info-value {
            color: #4b5563;
            font-size: 0.95rem;
        }

        .form-group {
            margin-bottom: 25px;
        }

        .form-label {
            display: block;
            font-weight: 600;
            color: var(--dark-gray);
            margin-bottom: 8px;
            font-size: 1rem;
        }

        .form-control {
            width: 100%;
            padding: 15px 20px;
            border: 2px solid var(--medium-gray);
            border-radius: 12px;
            font-size: 1rem;
            transition: all 0.3s ease;
            background: var(--pure-white);
        }

        .form-control:focus {
            outline: none;
            border-color: var(--primary-red);
            box-shadow: 0 0 0 3px rgba(220, 38, 38, 0.1);
        }

        .form-buttons {
            display: flex;
            gap: 15px;
            flex-wrap: wrap;
            margin-top: 30px;
        }

        .btn-modern {
            padding: 15px 30px;
            border-radius: 50px;
            font-weight: 600;
            text-decoration: none;
            border: none;
            cursor: pointer;
            transition: all 0.3s ease;
            font-size: 1rem;
            display: inline-flex;
            align-items: center;
            gap: 10px;
        }

        .btn-primary-modern {
            background: linear-gradient(135deg, var(--primary-red), var(--secondary-red));
            color: white;
            box-shadow: var(--shadow-light);
        }

        .btn-primary-modern:hover {
            transform: translateY(-2px);
            box-shadow: var(--shadow-medium);
            color: white;
        }

        .btn-secondary-modern {
            background: transparent;
            color: var(--primary-red);
            border: 2px solid var(--primary-red);
        }

        .btn-secondary-modern:hover {
            background: var(--primary-red);
            color: white;
            transform: translateY(-2px);
        }

        .data-table-container {
            background: white;
            border-radius: 20px;
            overflow: hidden;
            box-shadow: var(--shadow-light);
            margin-bottom: 30px;
        }

        .table-header {
            background: linear-gradient(135deg, var(--primary-red), var(--secondary-red));
            color: white;
            padding: 25px 30px;
        }

        .table-header h2 {
            margin: 0;
            font-weight: 700;
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .modern-table {
            width: 100%;
            border-collapse: collapse;
        }

        .modern-table th {
            background: var(--light-gray);
            padding: 20px 15px;
            text-align: left;
            font-weight: 600;
            color: var(--dark-gray);
            font-size: 0.9rem;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            border-bottom: 2px solid var(--medium-gray);
        }

        .modern-table td {
            padding: 20px 15px;
            border-bottom: 1px solid var(--medium-gray);
            vertical-align: middle;
        }

        .modern-table tr:hover {
            background: var(--light-red);
            transition: background 0.2s ease;
        }

        .status-badge {
            padding: 8px 16px;
            border-radius: 50px;
            font-size: 0.85rem;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .status-pending {
            background: linear-gradient(135deg, #fef3c7, #fbbf24);
            color: #92400e;
        }

        .status-resolved {
            background: linear-gradient(135deg, #d1fae5, #10b981);
            color: #065f46;
        }

        .action-buttons {
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
        }

        .action-btn {
            padding: 8px 15px;
            border-radius: 8px;
            text-decoration: none;
            font-size: 0.85rem;
            font-weight: 600;
            border: none;
            cursor: pointer;
            transition: all 0.2s ease;
        }

        .update-btn {
            background: linear-gradient(135deg, var(--success-green), #34d399);
            color: white;
        }

        .update-btn:hover {
            transform: translateY(-1px);
            color: white;
        }

        .delete-btn {
            background: linear-gradient(135deg, var(--primary-red), var(--secondary-red));
            color: white;
        }

        .delete-btn:hover {
            transform: translateY(-1px);
            color: white;
        }

        .empty-state {
            text-align: center;
            padding: 60px 30px;
            color: #6b7280;
        }

        .empty-state i {
            font-size: 4rem;
            color: var(--primary-red);
            margin-bottom: 20px;
        }

        .mobile-toggle {
            display: none;
            position: fixed;
            top: 20px;
            left: 20px;
            z-index: 1001;
            background: var(--primary-red);
            color: white;
            border: none;
            border-radius: 50%;
            width: 50px;
            height: 50px;
            font-size: 1.2rem;
            cursor: pointer;
            box-shadow: var(--shadow-medium);
        }

        @media (max-width: 768px) {
            .sidebar {
                transform: translateX(-100%);
            }

            .sidebar.active {
                transform: translateX(0);
            }

            .main-content {
                margin-left: 0;
                padding: 20px;
            }

            .mobile-toggle {
                display: block;
            }

            .top-bar {
                padding: 20px;
                flex-direction: column;
                align-items: flex-start;
            }

            .stats-grid {
                grid-template-columns: 1fr;
            }

            .modern-table {
                font-size: 0.85rem;
            }

            .modern-table th,
            .modern-table td {
                padding: 15px 10px;
            }

            .action-buttons {
                flex-direction: column;
            }
        }

        .loading-overlay {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: rgba(255, 255, 255, 0.9);
            display: none;
            justify-content: center;
            align-items: center;
            z-index: 9999;
        }

        .spinner {
            width: 50px;
            height: 50px;
            border: 4px solid var(--light-red);
            border-top: 4px solid var(--primary-red);
            border-radius: 50%;
            animation: spin 1s linear infinite;
        }

        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }

        .fade-in {
            animation: fadeIn 0.5s ease-in;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>
<div class="container-fluid p-4">
    <h2>Welcome, <%= username != null ? username : "Administrator" %>!</h2>
    <p>Total Complaints: <%= complaints != null ? complaints.size() : 0 %></p>

    <%
        int pendingCount = 0;
        int resolvedCount = 0;
        if (complaints != null) {
            for (Complaint c : complaints) {
                if ("PENDING".equalsIgnoreCase(c.getStatus())) {
                    pendingCount++;
                } else if ("RESOLVED".equalsIgnoreCase(c.getStatus())) {
                    resolvedCount++;
                }
            }
        }
    %>

    <p>Pending: <%= pendingCount %> | Resolved: <%= resolvedCount %></p>

    <% if (request.getAttribute("message") != null) { %>
    <div class="alert alert-success">
        <%= request.getAttribute("message") %>
    </div>
    <% } else if (request.getAttribute("error") != null) { %>
    <div class="alert alert-danger">
        <%= request.getAttribute("error") %>
    </div>
    <% } %>

    <% if (updateComplaint != null) { %>
    <h4>Update Complaint #<%= updateComplaint.getId() %></h4>
    <form action="<%= request.getContextPath() %>/admin" method="post">
        <input type="hidden" name="action" value="update"/>
        <input type="hidden" name="id" value="<%= updateComplaint.getId() %>"/>

        <div class="mb-3">
            <label class="form-label">Status</label>
            <select name="status" class="form-select">
                <option value="">-- Select Status --</option>
                <option value="PENDING" <%= "PENDING".equalsIgnoreCase(updateComplaint.getStatus()) ? "selected" : "" %>>Pending</option>
                <option value="RESOLVED" <%= "RESOLVED".equalsIgnoreCase(updateComplaint.getStatus()) ? "selected" : "" %>>Resolved</option>
            </select>
        </div>

        <div class="mb-3">
            <label class="form-label">Remarks</label>
            <textarea name="remarks" class="form-control" rows="4"><%= updateComplaint.getRemarks() != null ? updateComplaint.getRemarks() : "" %></textarea>
        </div>

        <button type="submit" class="btn btn-primary">Update</button>
        <a href="<%= request.getContextPath() %>/complaint" class="btn btn-secondary">Cancel</a>
    </form>
    <% } %>

    <hr>
    <h4>All Complaints</h4>
    <% if (complaints != null && !complaints.isEmpty()) { %>
    <table class="table table-bordered table-striped">
        <thead>
        <tr>
            <th>ID</th>
            <th>User ID</th>
            <th>Title</th>
            <th>Description</th>
            <th>Status</th>
            <th>Remarks</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <% for (Complaint c : complaints) { %>
        <tr>
            <td>#<%= c.getId() %></td>
            <td><%= c.getUserId() %></td>
            <td><%= c.getTitle() %></td>
            <td><%= c.getDescription().length() > 50 ? c.getDescription().substring(0, 50) + "..." : c.getDescription() %></td>
            <td><%= c.getStatus() %></td>
            <td><%= c.getRemarks() != null ? (c.getRemarks().length() > 30 ? c.getRemarks().substring(0, 30) + "..." : c.getRemarks()) : "-" %></td>
            <td>
                <a href="<%= request.getContextPath() %>/complaint?updateId=<%= c.getId() %>" class="btn btn-sm btn-warning">Update</a>
                <form action="<%= request.getContextPath() %>/complaintAction" method="post" style="display:inline;">
                    <input type="hidden" name="action" value="delete"/>
                    <input type="hidden" name="id" value="<%= c.getId() %>"/>
                    <button type="submit" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure?')">Delete</button>
                </form>
            </td>
        </tr>
        <% } %>
        </tbody>
    </table>
    <% } else { %>
    <p>No complaints found.</p>
    <% } %>
</div>
</body>
</html>

