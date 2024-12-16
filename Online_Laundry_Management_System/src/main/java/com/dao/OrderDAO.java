package com.dao;

import com.laundryservice.model.Order;
import com.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class OrderDAO {
    public Order getOrderById(int orderId) throws SQLException {
        try (Connection conn = DBUtil.getConnection()) {
            String sql = "SELECT * FROM orders WHERE id = ?";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setInt(1, orderId);
                try (ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) {
                        Order order = new Order();
                        order.setId(rs.getInt("id"));
                        order.setCustomerName(rs.getString("customer_name"));
                        order.setOrderAddress(rs.getString("order_address"));
                        order.setStatus(rs.getString("status"));
                        order.setOrderDate(rs.getDate("order_date"));
                        return order;
                    }
                }
            }
        }
        return null;
    }
    
    public List<Order> getAllOrders() {
        List<Order> orders = new ArrayList<>();
        String sql = "SELECT * FROM orders";  // Query to fetch all orders
        
        try (Connection conn = DBUtil.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Order order = new Order();
                order.setId(rs.getInt("id"));
                order.setCustomerName(rs.getString("customer_name"));
                order.setOrderAddress(rs.getString("order_address"));
                order.setStatus(rs.getString("status"));
                order.setOrderDate(rs.getDate("order_date"));
                orders.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();  // Log the error for debugging
        }
        return orders;
    }
    
 // Method to get customer name and delivery date by orderId
   

}
