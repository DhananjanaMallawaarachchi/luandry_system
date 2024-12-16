package com.servlet;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.dao.DeliveryDAO;
import com.dao.DriverDAO;
import com.model.Delivery;

import java.io.IOException;
import java.util.List;

@WebServlet("/driver-dashboard")
public class DriverDashboardServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private DeliveryDAO deliveryDAO = new DeliveryDAO();
    private DriverDAO driverDAO = new DriverDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        
        // Check if the session exists and the user is logged in
        if (session == null || session.getAttribute("username") == null) {
            response.sendRedirect("login.jsp?error=not_logged_in");
            return;
        }
        
        // Check if the logged-in user has the "driver" role
        String role = (String) session.getAttribute("role");
        if (!"driver".equals(role)) {
            response.sendRedirect("login.jsp?error=not_authorized");
            return;
        }

        String username = (String) session.getAttribute("username");
        
        // Fetch the driver's ID using the username
        Integer driverId = driverDAO.getDriverIdByUsername(username);
        
        // Check if the driver ID is valid
        if (driverId == null) {
            response.sendRedirect("login.jsp?error=invalid_driver");
            return;
        }

        // Fetch the driver's deliveries using the driver ID
        List<Delivery> deliveries = deliveryDAO.getDeliveriesForDriver(driverId);
        
        // Set the deliveries attribute and forward to the dashboard
        request.setAttribute("deliveries", deliveries);
        request.getRequestDispatcher("WEB-INF/views/driver-dashboard.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("username") == null) {
            response.sendRedirect("login.jsp?error=not_logged_in");
            return;
        }

        // Get delivery ID and new status from request
        String deliveryIdParam = request.getParameter("deliveryId");
        String newStatus = request.getParameter("deliveryStatus");

        // Validate parameters
        if (deliveryIdParam != null && !deliveryIdParam.isEmpty() && newStatus != null && !newStatus.isEmpty()) {
            try {
                long deliveryId = Long.parseLong(deliveryIdParam);

                // Debug: Print the received values
                System.out.println("Delivery ID: " + deliveryId);  // Debugging output
                System.out.println("New Status: " + newStatus);    // Debugging output

                // Update the delivery status in the database
                boolean updateSuccess = deliveryDAO.updateDriverStatus(deliveryId, newStatus);

                if (updateSuccess) {
                    request.setAttribute("message", "Delivery status updated successfully.");
                } else {
                    request.setAttribute("error", "Failed to update delivery status.");
                }
            } catch (NumberFormatException e) {
                request.setAttribute("error", "Invalid delivery ID format.");
            }
        } else {
            request.setAttribute("error", "Invalid delivery ID or status.");
        }

        // Refresh the deliveries and forward back to the dashboard
        String username = (String) session.getAttribute("username");
        Integer driverId = driverDAO.getDriverIdByUsername(username);
        List<Delivery> deliveries = deliveryDAO.getDeliveriesForDriver(driverId);
        request.setAttribute("deliveries", deliveries);

        request.getRequestDispatcher("WEB-INF/views/driver-dashboard.jsp").forward(request, response);
    }
}
