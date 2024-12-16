package com.dao;

import com.model.Driver;
import com.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DriverDAO {
    
    // Get all drivers
    public List<Driver> getAllDrivers() {
        List<Driver> drivers = new ArrayList<>();
        String sql = "SELECT * FROM drivers";
        
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            
            while (rs.next()) {
                Driver driver = new Driver();
                driver.setId(rs.getInt("id"));
                driver.setName(rs.getString("name"));
                driver.setEmail(rs.getString("email"));
                driver.setPhone(rs.getString("phone_number"));
                drivers.add(driver);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return drivers;
    }

    // Get a driver by ID
    public Driver getDriverById(int id) {
        Driver driver = null;
        String sql = "SELECT * FROM drivers WHERE id = ?";
        
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    driver = new Driver();
                    driver.setId(rs.getInt("id"));
                    driver.setName(rs.getString("name"));
                    driver.setEmail(rs.getString("email"));
                    driver.setPhone(rs.getString("phone_number"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return driver;
    }
    
    public Integer getDriverIdByUsername(String username) {
        String sql = "SELECT drivers.id AS driver_id FROM users JOIN drivers ON users.id = drivers.id WHERE users.username = ?";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, username);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("driver_id");  // Return the driver_id
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;  // Return null if no matching driver is found
    }

}
