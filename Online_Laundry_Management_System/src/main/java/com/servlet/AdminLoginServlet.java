package com.servlet;

import com.dao.UserDAO;
import com.laundryservice.model.User;
import com.util.DBUtil;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/login")
public class AdminLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        UserDAO userDAO = new UserDAO();
        User user = userDAO.getUserByUsername(username);  
        

        try (Connection conn = DBUtil.getConnection()) {
            String sql = "SELECT * FROM users WHERE username = ? AND password = ?";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, username);
                stmt.setString(2, password);
                try (ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) {
                        String role = rs.getString("role");
                        HttpSession session = request.getSession();
                        session.setAttribute("username", username);
                        session.setAttribute("role", role);
                        session.setAttribute("user", user);  


                        if ("manager".equals(role)) {
                            response.sendRedirect("dashboard"); // Redirect to manager dashboard
                        } else if ("driver".equals(role)) {
                            response.sendRedirect("driver-dashboard"); // Redirect to driver dashboard
                        } else {
                            response.sendRedirect("login?error=invalid_role"); // Handle invalid roles
                        }
                    } else {
                        response.sendRedirect("login?error=invalid_credentials"); // Handle invalid credentials
                    }
                }
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String error = request.getParameter("error");
        String message = request.getParameter("message");

        if (error != null) {
            switch (error) {
                case "invalid_credentials":
                    request.setAttribute("errorMessage", "Invalid username or password.");
                    break;
                case "invalid_role":
                    request.setAttribute("errorMessage", "Invalid role.");
                    break;
                case "not_logged_in":
                    request.setAttribute("errorMessage", "You need to log in first.");
                    break;
                case "not_authorized":
                    request.setAttribute("errorMessage", "You are not authorized to access this page.");
                    break;
                default:
                    request.setAttribute("errorMessage", "An unknown error occurred.");
            }
        } else if ("logged_out".equals(message)) {
            request.setAttribute("message", "You have been successfully logged out.");
        }

        request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
    }
}
