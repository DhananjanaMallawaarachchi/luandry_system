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
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/addDeliveries")
public class AddDeliveriesServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private DeliveryDAO deliveryDAO = new DeliveryDAO();
    private OrderDAO orderDAO = new OrderDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String orderIdStr = request.getParameter("orderId");
        try {
            int orderId = Integer.parseInt(orderIdStr);
            // Fetch the order details
            Order order = orderDAO.getOrderById(orderId);

            // Create Pickup Delivery
            Delivery pickupDelivery = new Delivery();
            pickupDelivery.setCustomerName(order.getCustomerName());
            pickupDelivery.setDeliveryAddress(order.getOrderAddress());
            pickupDelivery.setDeliveryStatus("Pending");
            deliveryDAO.saveDelivery(pickupDelivery);

            // Create Drop-off Delivery
            Delivery dropoffDelivery = new Delivery();
            dropoffDelivery.setCustomerName(order.getCustomerName());
            dropoffDelivery.setDeliveryAddress(order.getOrderAddress());
            dropoffDelivery.setDeliveryStatus("Pending");
            deliveryDAO.saveDelivery(dropoffDelivery);

            // Redirect with success message
            response.sendRedirect("delivery-dashboard?success=deliveries_added");
        } catch (SQLException | NumberFormatException e) {
            // Handle errors
            e.printStackTrace();
            response.sendRedirect("delivery-dashboard?error=database_error");
        }
    }
}
