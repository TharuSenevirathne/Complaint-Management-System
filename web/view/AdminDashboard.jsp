<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 6/16/2025
  Time: 3:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="org.example.model.bean.Complaint" %>
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
<html>
<head>
    <meta charset="UTF-8">
    <meta name="author" content="Tharu Senevirathne">
    <meta name="keywords" content="html, css,bootstrap, javascript,java,javaee,servlet,jsp,dbcp,tomcat,intelijIDEA, pos web, complain management system, web development, software engineering, computer science">
    <meta name="description" content="This website is a Complain Management system Web Application designed to manage complains efficiently.">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

    <title>Admin Dashboard - Complaint Management System</title>
    <style>
        body {
            font-family: "Bell MT", sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .container {
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 1200px;
            margin: 50px auto;
        }

        h1, h2 {
            color: white;
            margin-bottom: 20px;
        }

        .admin-header {
            background: #f44848;
            color: white;
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 30px;
            text-align: center;
        }

        .admin-header h1 {
            margin: 0;
        }

        .message {
            padding: 15px;
            margin-bottom: 20px;
            border-radius: 5px;
            font-weight: bold;
        }

        .message.success {
            background-color: #d4edda;
            color: #155724;
        }

        .message.error {
            background-color: #f8d7da;
            color: #721c24;
        }

        form select,
        form input[type="text"],
        form textarea {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
            box-sizing: border-box;
        }

        form input[type="submit"] {
            background-color: #f44848;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
            width: 100%;
        }

        form input[type="submit"].update-btn {
            background-color: #008000;
        }

        form input[type="submit"].update-btn:hover {
            background-color: #006600;
        }

        .cancel-btn {
            background-color: #000000;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
            text-decoration: none;
            display: inline-block;
            text-align: center;
        }

        .cancel-btn:hover {
            background-color: #606060;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 30px;
        }

        th, td {
            padding: 12px;
            border: 1px solid #ccc;
            text-align: left;
            font-size: 14px;
        }

        th {
            background-color: #f44848;
            color: white;
        }

        .actions {
            display: flex;
            gap: 10px;
            align-items: center;
        }

        .actions form {
            margin: 0;
        }

        .update-link {
            background-color: #2866ed;
            color: white;
            text-decoration: none;
            font-weight: bold;
            padding: 8px 16px;
            border-radius: 4px;
            font-size: 12px;
            text-align: center;
            display: inline-block;
        }

        .update-link:hover {
            background-color: #081775;
        }

        .delete-link {
            background-color: #FF0000;
            border: none;
            color: white;
            font-weight: bold;
            cursor: pointer;
            padding: 8px 16px;
            font-size: 12px;
            border-radius: 4px;
        }

        .delete-link:hover {
            background-color: #CC0000;
        }

        .form-buttons {
            display: flex;
            gap: 10px;
        }

        .status-badge {
            padding: 4px 8px;
            border-radius: 4px;
            font-size: 12px;
            font-weight: bold;
            text-transform: uppercase;
        }

        .employee-column {
            font-weight: bold;
            color: #f44848;
        }

        .update-form-container {
            background-color: #f8f9fa;
            padding: 20px;
            border-radius: 8px;
            margin-bottom: 30px;
            border: 2px solid #0abff6;
        }

        .logout-btn {
            background-color: #FF0000;
            border: none;
            color: white;
            font-weight: bold;
            cursor: pointer;
            padding: 8px 16px;
            font-size: 12px;
            border-radius: 4px;
            text-decoration: none;
        }


        .logout-btn:hover {
            background-color: #d32f2f;
        }
    </style>
</head>

<body>
<div class="container">
    <div class="admin-header">
        <i class="fa-solid fa-user-secret"></i>
            Admin Dashboard
        </h1>
        <p>Complaint Management System</p>
    </div>

    <%
        if (request.getAttribute("message") != null) {
    %>
    <div class="message success">
        <%= request.getAttribute("message") %>
    </div>
    <%
    } else if (request.getAttribute("error") != null) {
    %>
    <div class="message error">
        <%= request.getAttribute("error") %>
    </div>
    <%
        }
    %>

    <%
        if (updateComplaint != null) {
    %>
    <div class="update-form-container">
        <h2>Update Complaint Status & Remarks</h2>
        <form id="adminUpdateForm" action="<%= request.getContextPath() %>/admin" method="post"
              onsubmit="return validateAdminUpdateForm()">

            <input type="hidden" name="action" value="update"/>
            <input type="hidden" name="id" value="<%= updateComplaint.getId() %>"/>

            <div style="background-color: #e9ecef; padding: 15px; border-radius: 5px; margin-bottom: 20px;">
                <p><strong>Complaint ID:</strong> <%= updateComplaint.getId() %>
                </p>
                <p><strong>User ID:</strong> <%= updateComplaint.getUserId() %>
                </p>
                <p><strong>Title:</strong> <%= updateComplaint.getTitle() %>
                </p>
                <p><strong>Description:</strong> <%= updateComplaint.getDescription() %>
                </p>
                <p><strong>Current Status:</strong>
                    <span class="status-badge <%= "PENDING".equalsIgnoreCase(updateComplaint.getStatus()) ? "status-pending" :
                                                                 "RESOLVED".equalsIgnoreCase(updateComplaint.getStatus()) ? "status-resolved" : "" %>">
                                        <%= updateComplaint.getStatus() %>
                                    </span>
                </p>
            </div>

            <label for="status"><strong>Update Status:</strong></label>
            <select name="status" id="status" required>
                <option value="">-- Select Status --</option>
                <option value="PENDING" <%= "PENDING".equalsIgnoreCase(updateComplaint.getStatus()) ? "selected" : "" %>>
                    Pending
                </option>
                <option value="RESOLVED" <%= "RESOLVED".equalsIgnoreCase(updateComplaint.getStatus()) ? "selected" : "" %>>
                    Resolved
                </option>
            </select>

            <label for="remarks"><strong>Admin Remarks:</strong></label>
            <textarea name="remarks" id="remarks" placeholder="Add your remarks here..."
                      rows="4"><%= updateComplaint.getRemarks() != null ? updateComplaint.getRemarks() : "" %></textarea>

            <div class="form-buttons" style="margin-top: 15px;">
                <input type="submit" value="Update Complaint" class="update-btn"/>
                <a href="<%= request.getContextPath() %>/complaint" class="cancel-btn">Cancel</a>
            </div>
        </form>
    </div>
    <%
        }
    %>

    <h2>All System Complaints</h2>

    <table>
        <tr>
            <th>ID</th>
            <th>User ID</th>
            <th>Title</th>
            <th>Description</th>
            <th>Status</th>
            <th>Remarks</th>
            <th>Actions</th>
        </tr>

        <%
            if (complaints != null && !complaints.isEmpty()) {
                for (Complaint c : complaints) {
                    String statusClass = "";
                    if ("PENDING".equalsIgnoreCase(c.getStatus())) {
                        statusClass = "status-pending";
                    } else if ("RESOLVED".equalsIgnoreCase(c.getStatus())) {
                        statusClass = "status-resolved";
                    }
        %>

        <tr>
            <td>
                <%= c.getId() %>
            </td>

            <td class="employee-column">
                <%= c.getUserId() %>
            </td>

            <td>
                <%= c.getTitle() %>
            </td>
            <td>
                <%= c.getDescription().length() > 50 ? c.getDescription().substring(0, 50) + "..." : c.getDescription() %>
            </td>
            <td>
                <span class="status-badge <%= statusClass %>"><%= c.getStatus() %></span>
            </td>
            <td>
                <%= c.getRemarks() != null ? (c.getRemarks().length() > 30 ? c.getRemarks().substring(0, 30) + "..." : c.getRemarks()) : "-" %>
            </td>

            <td class="actions">
                <a class="update-link"
                   href="<%= request.getContextPath() %>/complaint?updateId=<%= c.getId() %>">Update</a>

                <form action="<%= request.getContextPath() %>/complaintAction" method="post"
                      onsubmit="return confirm('Are you sure you want to delete this complaint?');"
                      style="display:inline;">
                    <input type="hidden" name="action" value="delete"/>
                    <input type="hidden" name="id" value="<%= c.getId() %>"/>
                    <input type="submit" class="delete-link" value="Delete"/>
                </form>
            </td>
        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="7">No complaints found in the system.</td>
        </tr>
        <%
            }
        %>
    </table>
    <br><br>
    <a class="logout-btn" href="<%= request.getContextPath() %>/login">Logout</a>

</div>

<script>
    function validateAdminUpdateForm() {
        const status = document.getElementById('status').value.trim();
        const remarks = document.getElementById('remarks').value.trim();

        if (!status) {
            alert("Please select a status.");
            return false;
        }

        if (remarks.length > 500 || !remarks) {
            alert("Remarks cannot be empty or exceed 500 characters.");
            return false;
        }
        return true;
    }
</script>
</body>
</html>

