package com.servlet;

import com.dao.UserDAO;
import com.laundryservice.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/updateUser")
@MultipartConfig
public class UserManagementServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user"); 

        if (user == null) {
            response.sendRedirect("login.jsp"); 
            return;
        }

        // Retrieve form fields
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Update user fields
        user.setUsername(username);
        user.setEmail(email);
        if (password != null && !password.isEmpty()) {
            user.setPassword(password); 
        }

        // Update the user in the database
        UserDAO userDAO = new UserDAO();
        boolean updateSuccess = userDAO.update(user);

        if (updateSuccess) {
            session.setAttribute("user", user);  
            response.sendRedirect("updateUser?success=profile_updated");
        } else {
            response.sendRedirect("updateUser?error=update_failed");
        }
        
        
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Forward to JSP or handle GET-specific logic
        request.getRequestDispatcher("/WEB-INF/views/userManagement.jsp").forward(request, response);
    }
}
