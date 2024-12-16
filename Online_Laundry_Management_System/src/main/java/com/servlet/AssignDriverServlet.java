package com.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.DeliveryDAO;
import com.dao.OrderDAO;
import com.laundryservice.model.Order;

import java.io.IOException;

@WebServlet("/assignDriver")
public class AssignDriverServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
	private DeliveryDAO deliveryDAO;
    private OrderDAO orderDAO;

    @Override
    public void init() throws ServletException {
        deliveryDAO = new DeliveryDAO();  // Assuming DeliveryDAO is properly implemented and available
        orderDAO = new OrderDAO();        // Assuming OrderDAO is properly implemented and available
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Retrieve and validate parameters
            String orderIdStr = request.getParameter("orderId");
            if (orderIdStr == null || orderIdStr.isEmpty()) {
                throw new IllegalArgumentException("Order ID is missing or invalid.");
            }

            int orderId = Integer.parseInt(orderIdStr);
            String deliveryType = request.getParameter("deliveryType");
            String driverIdStr = request.getParameter("driverId");
            String deliveryAddress = request.getParameter("deliveryAddress");

            // Fetch the Order object from the orders table using orderId
            Order order = orderDAO.getOrderById(orderId);
            if (order == null) {
                response.sendRedirect("manageDeliveries?orderId=" + orderId + "&error=invalid_order");
                return;
            }

            String customerName = order.getCustomerName();
            java.util.Date deliveryDate = order.getOrderDate();  // Using the order date as the delivery date
            
            // Validate deliveryType
            if (deliveryType == null || (!deliveryType.equals("pickup") && !deliveryType.equals("dropoff"))) {
                response.sendRedirect("manageDeliveries?orderId=" + orderId + "&error=invalid_delivery_type");
                return;
            }

            // Validate driverId
            if (driverIdStr == null || driverIdStr.isEmpty()) {
                response.sendRedirect("manageDeliveries?orderId=" + orderId + "&error=invalid_driver_id");
                return;
            }
            int driverId = Integer.parseInt(driverIdStr);

            // Validate deliveryAddress
            if (deliveryAddress == null || deliveryAddress.isEmpty()) {
                response.sendRedirect("manageDeliveries?orderId=" + orderId + "&error=invalid_address");
                return;
            }

            // Assign driver to delivery, passing the customer name and delivery date
            boolean success = deliveryDAO.assignDriverToDelivery(orderId, deliveryType, driverId, deliveryAddress, customerName, deliveryDate);

            // Handle response
            if (success) {
                response.sendRedirect("manageDeliveries?orderId=" + orderId + "&success=driver_assigned");
            } else {
                response.sendRedirect("manageDeliveries?orderId=" + orderId + "&error=database_error");
            }
        } catch (NumberFormatException e) {
            response.sendRedirect("manageDeliveries?error=invalid_input");
        } catch (Exception e) {
            response.sendRedirect("manageDeliveries?error=unknown_error");
        }
    }
}
