package org.example.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.model.bean.Complaint;
import org.example.model.dao.ComplaintDAO;

import java.io.IOException;

@WebServlet("/updateComplaint")
public class UpdateComplaintsServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String idParam = req.getParameter("id");
            String title = req.getParameter("title");
            String description = req.getParameter("description");

            int id = Integer.parseInt(idParam.trim());

            if (id <= 0) {
                resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid complaint ID.");
                return;
            }

            Complaint complaint = new Complaint();
            complaint.setId(id);
            complaint.setTitle(title.trim());
            complaint.setDescription(description.trim());

            ComplaintDAO dao = new ComplaintDAO(getServletContext());
            boolean updated = dao.update(complaint);

            if (updated) {
                resp.sendRedirect(req.getContextPath() + "/complaint");
            } else {
                resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to update complaint. Please try again.");
            }

        } catch (NumberFormatException e) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid complaint ID format.");
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An unexpected error occurred while updating the complaint.");
        }
    }
}
