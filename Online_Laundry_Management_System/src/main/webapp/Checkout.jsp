<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@page import="com.model.Order"%>  
<%@page import="com.service.OrderImplementation"%>
<%@page import="com.service.OrderInterface"%>
<%@ page import="com.util.PayDBConnect" %>
<%@ page import="java.sql.SQLException" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Laundry Checkout | Urban Laundry</title>
    <link href="css/style.css" rel="stylesheet">
</head>
<body>
    <%
    // Getting orderId from request parameters
    String orderId = request.getParameter("orderId");
    Order order = null;

    // Check if orderId is provided
    if (orderId != null && !orderId.isEmpty()) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            // Establish the connection
            Class.forName("com.mysql.jdbc.Driver");
            conn = PayDBConnect.getConnection();
            
            // Prepare and execute the SQL query
            String sql = "SELECT * FROM Service_booking WHERE Service_booking.id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, orderId);
            rs = pstmt.executeQuery();

            // If an order is found, create an Order object
            if (rs.next()) {
                order = new Order();
                order.setOrderId(rs.getString("orderId"));
                order.setServices(rs.getString("services"));
                // Set other order properties as needed
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Close resources
            try { if (rs != null) rs.close(); } catch (SQLException e) { e.printStackTrace(); }
            try { if (pstmt != null) pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            try { if (conn != null) conn.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    }
%>
    <header>
        <h1>Urban Laundry Service</h1>
    </header>
    
    <div class="order-summary">
        <h2>Order Summary</h2>
        <% if (order != null) { %>
            <p><strong>Order ID:</strong> <input type="text" name="orderId" value="<%= order.getOrderId() %>" readonly /></p>
            <p><strong>Service Type:</strong> <input type="text" name="service" value="<%= order.getServices() %>" readonly /></p>
        <% } else { %>
            <p>No order found for the provided Order ID.</p>
        <% } %>

        <table class="order-table">
            <thead>
                <tr>
                    <th>Item</th>
                    <th>Quantity</th>
                    <th>Price</th>
                    <th>Subtotal</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Shirts (Wash & Iron)</td>
                    <td>2</td>
                    <td>LKR 1200.00</td>
                    <td>LKR 2400.00</td>
                </tr>
                <tr>
                    <td>Pants (Wash & Fold)</td>
                    <td>3</td>
                    <td>LKR 850.00</td>
                    <td>LKR 2550.00</td>
                </tr>
                <tr>
                    <td>Jackets (Dry Clean)</td>
                    <td>1</td>
                    <td>LKR 1650.00</td>
                    <td>LKR 1650.00</td>
                </tr>
            </tbody>
        </table>

        <div class="total">
            <p><strong>Total:</strong> LKR 6600.00</p>
        </div>
    </div>

    <div class="buttons">
        <a href="Index.jsp">
            <button class="btn continue">Continue Shopping</button>
        </a> 
        <a href="PaymentAddCustomer.jsp">
            <button class="btn pay">Pay Now</button>
        </a>
    </div>
</body>
</html>
