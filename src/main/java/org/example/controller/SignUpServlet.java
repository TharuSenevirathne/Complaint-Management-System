package org.example.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.model.bean.User;
import org.example.model.dao.UserDAO;

import java.io.IOException;

@WebServlet("/signup")
public class SignUpServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String confirmPassword = req.getParameter("confirmPassword");
        String role = req.getParameter("role");

        if (username == null || username.isEmpty() ||
                password == null || password.isEmpty() ||
                confirmPassword == null || confirmPassword.isEmpty() ||
                role == null || role.isEmpty()) {

            req.setAttribute("error", "All fields are required.");
            req.getRequestDispatcher("/view/SignUp.jsp").forward(req, resp);
            return;
        }

        if (!password.equals(confirmPassword)) {
            req.setAttribute("error", "Passwords do not match.");
            req.getRequestDispatcher("/view/SignUp.jsp").forward(req, resp);
            return;
        }

        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setRole(role);

        System.out.println(user.getRole());
        System.out.println(user.getUsername());
        System.out.println(user.getPassword());

        UserDAO userDAO = new UserDAO(getServletContext());

        User userIsAlreadyRegistered = userDAO.validate(user.getUsername(), user.getPassword());

        if (userIsAlreadyRegistered != null) {
            req.setAttribute("error", "User is already registered.");
            req.getRequestDispatcher("/view/SignUp.jsp").forward(req, resp);
            return;
        }

        boolean success = userDAO.save(user);

        RequestDispatcher rd;
        if (success) {
            rd = req.getRequestDispatcher("/view/SignIn.jsp");
            rd.forward(req, resp);
        } else {
            req.setAttribute("error", "Registration failed. Try a different username.");
            req.getRequestDispatcher("/view/SignUp.jsp").forward(req, resp);
        }


    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher rd = req.getRequestDispatcher("/view/SignUp.jsp");
        rd.forward(req, resp);
    }
}
