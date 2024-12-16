package com.dao;

import com.model.Delivery;
import com.laundryservice.model.Order;
import com.util.DBUtil;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class DeliveryDAO {
    
    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace(); // Handle error if driver is not found
        }
    }

    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection("jdbc:mysql://localhost:3306/laundry_service_db", "root", "Malmal@11");
    }

    // Get all deliveries from the database
    public List<Delivery> getAllDeliveries() {
        List<Delivery> deliveries = new ArrayList<>();
        String query = "SELECT * FROM deliveries";

        try (Connection connection = getConnection();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(query)) {

            while (resultSet.next()) {
                Delivery delivery = new Delivery();
                delivery.setId(resultSet.getLong("id"));
                delivery.setDeliveryAddress(resultSet.getString("delivery_address"));
                delivery.setDeliveryStatus(resultSet.getString("delivery_status"));
                deliveries.add(delivery);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return deliveries;
    }

    // Save a new delivery
    public void saveDelivery(Delivery delivery) {
        String query = "INSERT INTO deliveries (customer_name, delivery_address, delivery_status, delivery_date) VALUES (?, ?, ?, ?)";

        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setString(1, delivery.getCustomerName());
            statement.setString(2, delivery.getDeliveryAddress());
            statement.setString(3, delivery.getDeliveryStatus());
            statement.setDate(4, java.sql.Date.valueOf(delivery.getDeliveryDate()));
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }



    // New Method: Add a new delivery (either pickup or drop-off)
    public boolean addDelivery(Delivery delivery) {
        String sql = "INSERT INTO deliveries (order_id, type, status) VALUES (?, ?, ?)";

        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setFloat(1, delivery.getId());
            stmt.setString(2, delivery.getDeliveryType());
            stmt.setString(3, "Pending"); // Status is "Pending" initially

            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // New Method: Assign a driver to a delivery
    public boolean assignDriver(int orderId, String deliveryType, int driverId) {
        String sql = "UPDATE deliveries SET driver_id = ?, status = 'Assigned' WHERE order_id = ? AND type = ?";

        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, driverId);
            stmt.setInt(2, orderId);
            stmt.setString(3, deliveryType);

            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

 
    
    public boolean assignDriverToDelivery(int orderId, String deliveryType, int driverId, String deliveryAddress, String customerName, Date deliveryDate) {
        String query = "INSERT INTO deliveries (order_id, delivery_type, driver_id, delivery_status, delivery_address, customer_name, delivery_date ) " +
                       "VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection connection = DBUtil.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            preparedStatement.setInt(1, orderId);
            preparedStatement.setString(2, deliveryType);
            preparedStatement.setInt(3, driverId);
            preparedStatement.setString(4, "assigned");
            preparedStatement.setString(5, deliveryAddress);
            preparedStatement.setString(6, customerName);
            preparedStatement.setDate(7, (java.sql.Date) deliveryDate);



            int rowsAffected = preparedStatement.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public Order getOrderById(int orderId) {
        Order order = null;
        String sql = "SELECT * FROM orders WHERE id = ?";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, orderId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    order = new Order();
                    order.setId(rs.getInt("id"));
                    order.setCustomerName(rs.getString("customer_name"));
                    order.setOrderAddress(rs.getString("order_address"));
                    order.setStatus(rs.getString("status"));
                    order.setOrderDate(rs.getDate("order_date"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return order;
    }
    
    // Get deliveries by order ID
    public List<Delivery> getDeliveriesByOrderId(int orderId) {
        List<Delivery> deliveries = new ArrayList<>();
        String sql = "SELECT d.id, d.delivery_type, d.delivery_status, d.driver_id, o.customer_name, d.delivery_address " +
                "FROM deliveries d " +
                "JOIN orders o ON d.order_id = o.id " +
                "WHERE o.id = ?";
        
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, orderId);
            System.out.println("Executing query for order ID: " + orderId);

            try (ResultSet rs = stmt.executeQuery()) {
                if (!rs.isBeforeFirst()) {
                    System.out.println("No deliveries found for order ID: " + orderId);
                }
                while (rs.next()) {
                    Delivery delivery = new Delivery();
                    delivery.setId(rs.getLong("id"));
                    delivery.setOrderId(orderId);
                    delivery.setDeliveryType(rs.getString("delivery_type"));
                    delivery.setDeliveryStatus(rs.getString("delivery_status"));
                    delivery.setDriverId(rs.getInt("driver_id"));
                    delivery.setCustomerName(rs.getString("customer_name"));
                    delivery.setDeliveryAddress(rs.getString("delivery_address"));
                    //delivery.setDeliveryDate(rs.getDate("delivery_date").toLocalDate());
                                        
                    deliveries.add(delivery);
                    System.out.println("Delivery found: " + delivery.getId());
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return deliveries;
    }

    public boolean deleteDelivery(int deliveryId) {
        String sql = "DELETE FROM deliveries WHERE id = ?";

        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, deliveryId);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public List<Delivery> getDeliveriesForDriver(int driverId) {
        String sql = "SELECT * FROM deliveries WHERE driver_id = ?";
        List<Delivery> deliveries = new ArrayList<>();

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, driverId);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Delivery delivery = new Delivery();
                    delivery.setId(rs.getLong("id"));
                    delivery.setCustomerName(rs.getString("customer_name"));
                    delivery.setDeliveryAddress(rs.getString("delivery_address"));
                    delivery.setDeliveryStatus(rs.getString("delivery_status"));
                    Date sqlDate = rs.getDate("delivery_date");
                    if (sqlDate != null) {
                        LocalDate localDate = ((java.sql.Date) sqlDate).toLocalDate();
                        delivery.setDeliveryDate(localDate);
                    }
                    //delivery.setDriverUsername(rs.getString("driver_username"));

                    deliveries.add(delivery);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return deliveries;
    }

 // Update the delivery status by ID
    public boolean updateDeliveryStatus(int deliveryId, String status) {
        String sql = "UPDATE deliveries SET delivery_status = ? WHERE id = ?";

        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, status);
            stmt.setInt(2, deliveryId);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public boolean updateDriverStatus(long deliveryId, String newStatus) {
        String sql = "UPDATE deliveries SET delivery_status = ? WHERE id = ?";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, newStatus);
            stmt.setLong(2, deliveryId);

            int rowsUpdated = stmt.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    
}


    
 
