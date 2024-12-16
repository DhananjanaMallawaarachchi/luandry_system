package com.servlet;

import com.dao.DeliveryDAO;
import com.model.Delivery;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class DeliveryDashboardServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private DeliveryDAO deliveryDAO = new DeliveryDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        
        // Check if the session exists and the user is logged in
        if (session == null || session.getAttribute("username") == null) {
            response.sendRedirect("login?error=not_logged_in");
            return;
        }
     // Check if the logged-in user has the "manager" role
        String role = (String) session.getAttribute("role");
        if (!"manager".equals(role)) {
            response.sendRedirect("login?error=not_authorized");
            return;
        }
    

        List<Delivery> deliveries = deliveryDAO.getAllDeliveries();
        request.setAttribute("deliveries", deliveries);
        request.getRequestDispatcher("/WEB-INF/views/dashboard.jsp").forward(request, response);
    }
}
