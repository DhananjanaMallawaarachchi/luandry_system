package com.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CreateAccountServlet")
public class CreateAccountServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");
        String address = request.getParameter("address");
        String password = request.getParameter("password");

        // Database connection setup
        String url = "jdbc:mysql://localhost:3306/laundry";
        String dbUsername = "root";
        String dbPassword = "";
        Connection conn = null;

        try {
            // Load JDBC driver
            Class.forName("com.mysql.jdbc.Driver");

            // Connect to database
            conn = DriverManager.getConnection(url, dbUsername, dbPassword);

            // Prepare SQL query
            String query = "INSERT INTO users (name, email, phoneNumber, address, password) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, name);
            stmt.setString(2, email);
            stmt.setString(3, phoneNumber);
            stmt.setString(4, address);
            stmt.setString(5, password);

            // Execute update
            int rowCount = stmt.executeUpdate();
            
            // Response based on success
            if (rowCount > 0) {
                response.getWriter().println("Account created successfully for " + name);
                response.sendRedirect("Login.jsp");  // Redirects the user to the login page after account creation

            } else {
                response.getWriter().println("Error creating account.");
            }

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            response.getWriter().println("Error: Unable to load JDBC driver.");
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Error: Unable to execute SQL query.");
        } finally {
            // Close connection
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
