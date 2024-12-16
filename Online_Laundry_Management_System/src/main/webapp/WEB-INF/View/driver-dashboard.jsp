<%@ page import="com.model.Delivery" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Driver Dashboard</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-4">
        <h1 class="text-center mb-4">My Deliveries</h1>

        <!-- Display Deliveries in a Table -->
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Customer Name</th>
                    <th>Delivery Address</th>
                    <th>Status</th>
                    <th>Date</th>
                </tr>
            </thead>
            <tbody>
                <%
                // Fetch deliveries from request scope
                List<Delivery> deliveries = (List<Delivery>) request.getAttribute("deliveries");
                
                if (deliveries != null && !deliveries.isEmpty()) {
                    // Loop through each delivery and display its details
                    for (Delivery delivery : deliveries) {
                %>
                <tr>
                    <td><%= delivery.getId() %></td>
                    <td><%= delivery.getCustomerName() %></td>
                    <td>
                        <!-- Make address clickable to open Google Maps -->
                        <a href="https://www.google.com/maps/search/?api=1&query=<%= delivery.getDeliveryAddress().replace(" ", "+") %>" target="_blank">
                            <%= delivery.getDeliveryAddress() %>
                        </a>
                    </td>
                    <td>
                        <!-- Form to update the delivery status -->
                        <form action="driver-dashboard" method="post" class="d-inline">
                            <!-- Hidden field for delivery ID -->
                            <input type="hidden" name="deliveryId" value="<%= delivery.getId() %>">
                            
                            <!-- Delivery Status dropdown -->
                            <select name="deliveryStatus" class="form-select" onchange="this.form.submit()">
                                <option value="Pending" <%= "Pending".equals(delivery.getDeliveryStatus()) ? "selected" : "" %>>Pending</option>
                                <option value="Assigned" <%= "Assigned".equals(delivery.getDeliveryStatus()) ? "selected" : "" %>>Assigned</option>
                                <option value="In Progress" <%= "In Progress".equals(delivery.getDeliveryStatus()) ? "selected" : "" %>>In Progress</option>
                                <option value="Out for Delivery" <%= "Out for Delivery".equals(delivery.getDeliveryStatus()) ? "selected" : "" %>>Out for Delivery</option>
                                <option value="Delivered" <%= "Delivered".equals(delivery.getDeliveryStatus()) ? "selected" : "" %>>Delivered</option>
                                <option value="Delayed" <%= "Delayed".equals(delivery.getDeliveryStatus()) ? "selected" : "" %>>Delayed</option>
                                <option value="Completed" <%= "Completed".equals(delivery.getDeliveryStatus()) ? "selected" : "" %>>Completed</option>
                                <option value="Cancelled" <%= "Cancelled".equals(delivery.getDeliveryStatus()) ? "selected" : "" %>>Cancelled</option>
                                <option value="Returned" <%= "Returned".equals(delivery.getDeliveryStatus()) ? "selected" : "" %>>Returned</option>
                            </select>
                        </form>
                    </td>
                    <td><%= delivery.getDeliveryDate() %></td>
                </tr>
                <%
                    }
                } else {
                %>
                <tr>
                    <td colspan="5" class="text-center">No deliveries found for you.</td>
                </tr>
                <% } %>
            </tbody>
        </table>

        <!-- Logout Button -->
        <form action="logout" method="post" class="text-center">
            <button type="submit" class="btn btn-danger">Logout</button>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
