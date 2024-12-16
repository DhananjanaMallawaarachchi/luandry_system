package com.servlet;

import com.dao.DeliveryDAO;
import com.dao.OrderDAO;
import com.model.Delivery;
import com.laundryservice.model.Order;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/dashboard")
public class AddDeliveryServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private DeliveryDAO deliveryDAO = new DeliveryDAO();
    private OrderDAO orderDAO = new OrderDAO(); // DAO to fetch orders

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

        // Fetch existing deliveries
        List<Delivery> deliveries = deliveryDAO.getAllDeliveries();
        
        // Fetch orders (to add deliveries for)
        List<Order> orders = orderDAO.getAllOrders();
        
        // Set attributes to be accessed in the JSP
        request.setAttribute("deliveries", deliveries);
        request.setAttribute("orders", orders);
        
        // Forward to the dashboard view
        request.getRequestDispatcher("/WEB-INF/views/dashboard.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Handle adding deliveries from orders
        String orderId = request.getParameter("orderId");
        
        if (orderId != null && !orderId.isEmpty()) {
            try {
                int id = Integer.parseInt(orderId);

                
                // Add pick-up and drop-off deliveries for the selected order
                Delivery pickupDelivery = new Delivery();
                Delivery dropoffDelivery = new Delivery();
                
                pickupDelivery.setId((long) id);
                pickupDelivery.setDeliveryType("pickup");
                pickupDelivery.setDeliveryStatus("pending");

                dropoffDelivery.setId((long) id);
                dropoffDelivery.setDeliveryType("dropoff");
                dropoffDelivery.setDeliveryStatus("pending");

                // Save the deliveries in the database
                deliveryDAO.saveDelivery(pickupDelivery);
                deliveryDAO.saveDelivery(dropoffDelivery);

                // Redirect with a success message
                response.sendRedirect("dashboard?success=delivery_added");
            } catch (NumberFormatException e) {
                // Handle invalid order ID
                response.sendRedirect("dashboard?error=invalid_order");
            }
        } else {
            // Handle missing order ID
            response.sendRedirect("dashboard?error=missing_order");
        }
    }
}
