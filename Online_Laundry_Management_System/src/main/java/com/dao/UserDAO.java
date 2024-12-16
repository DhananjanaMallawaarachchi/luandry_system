package com.dao;

import com.laundryservice.model.User;
import com.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {

    // Method to retrieve a User object by username
    public User getUserByUsername(String username) {
        String sql = "SELECT * FROM users WHERE username = ?";
        User user = null;

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, username);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                // Create a new User object based on the result from the database
                user = new User();
                user.setId(rs.getInt("id"));
                user.setUsername(rs.getString("username"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setRole(rs.getString("role"));
                user.setProfilePicture(rs.getString("profile_picture"));  // Profile picture field if applicable
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return user;
    }

    // Method to update the user details
    public boolean update(User user) {
        String sql = "UPDATE users SET username = ?, email = ?, password = ? WHERE id = ?";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, user.getUsername());
            stmt.setString(2, user.getEmail());
            stmt.setString(3, user.getPassword());  // Optionally hash the password here
            stmt.setInt(4, user.getId());

            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;  // Return true if update is successful

        } catch (SQLException e) {
            e.printStackTrace();
            return false;  // Return false if an error occurs
        }
    }
}
