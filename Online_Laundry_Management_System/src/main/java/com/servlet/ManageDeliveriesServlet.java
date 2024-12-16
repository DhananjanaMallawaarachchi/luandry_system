package com.servlet;

import com.dao.DeliveryDAO;
import com.dao.DriverDAO;
import com.model.Delivery;
import com.model.Driver;
import com.laundryservice.model.Order;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/manageDeliveries")
public class ManageDeliveriesServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private DeliveryDAO deliveryDAO = new DeliveryDAO();  // DAO for delivery operations
    private DriverDAO driverDAO = new DriverDAO();        // DAO for driver operations

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String orderIdParam = request.getParameter("orderId");
            System.out.println("Received orderId parameter: " + orderIdParam);
            int orderId = Integer.parseInt(orderIdParam);

            // Fetch order details and deliveries
            Order order = deliveryDAO.getOrderById(orderId);
            List<Delivery> deliveries = deliveryDAO.getDeliveriesByOrderId(orderId);
            List<Driver> drivers = driverDAO.getAllDrivers();

            // Log fetched data
            System.out.println("Fetched order: " + (order != null ? order.getId() : "null"));
            System.out.println("Number of deliveries fetched: " + deliveries.size());

            request.setAttribute("order", order);
            request.setAttribute("deliveries", deliveries);
            request.setAttribute("drivers", drivers);
            request.getRequestDispatcher("/WEB-INF/views/manageDeliveries.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Order ID");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while processing the request");
        }
    }
    
}
