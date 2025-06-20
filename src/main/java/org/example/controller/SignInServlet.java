package org.example.controller;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.example.model.bean.User;
import org.example.model.dao.UserDAO;

import java.io.IOException;

@WebServlet("/login")
public class SignInServlet extends HttpServlet {
    private UserDAO userDAO;

    @Override
    public void init() throws ServletException {
        ServletContext context = getServletContext();
        userDAO = new UserDAO(context);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        User user = userDAO.validate(username, password);

        if (user != null) {
            HttpSession session = req.getSession();
            session.setAttribute("user", user.getUsername());
            session.setAttribute("role", user.getRole());
            session.setAttribute("userId", user.getId());
            session.setMaxInactiveInterval(30 * 60);

            if ("ADMIN".equalsIgnoreCase(user.getRole())) {
                resp.sendRedirect(req.getContextPath() + "/complaint");
            } else if ("EMPLOYEE".equalsIgnoreCase(user.getRole())) {
                resp.sendRedirect(req.getContextPath() + "/complaint");
            } else {
                req.setAttribute("errorMessage", "Unauthorized role.");
                req.getRequestDispatcher("/views/SignIn.jsp").forward(req, resp);
            }
        } else {
            req.setAttribute("errorMessage", "Invalid username or password.");
            resp.sendRedirect(req.getContextPath() + "/login");
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/view/SignIn.jsp").forward(req, resp);
    }
}
