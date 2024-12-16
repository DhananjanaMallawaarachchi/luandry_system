<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.model.Material" %>
<%@ page import="com.util.ConnectionDBUtilMaterial" %>
<%@ page import="com.util.DBConnectMaterial" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GetUpdate</title>
</head>
<%
    
    // Variable to hold the material ID
    String materialId = request.getParameter("materialId");

    Material m1 = null;

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        // Establish database connection
        Class.forName("com.mysql.jdbc.Driver");
        conn = DBConnectMaterial.getConnection();

        // Query to get the material based on the materialId
        String query = "SELECT * FROM materials WHERE material_id = ?";
        pstmt = conn.prepareStatement(query);
        pstmt.setString(1, materialId);
        rs = pstmt.executeQuery();

        // Check if a result was returned and create a Material object
        if (rs.next()) {
            m1 = new Material();
            m1.setMaterialId(rs.getInt("material_id"));
            m1.setName(rs.getString("name"));
            m1.setQuantity(rs.getInt("quantity"));
            m1.setUnit(rs.getString("unit"));
            m1.setDescription(rs.getString("description"));
            m1.setExpiryDate(rs.getString("expiry_date"));
            m1.setSupplier(rs.getString("supplier"));
        } else {
            // Handle case where no material was found (optional)
            out.println("No material found with ID: " + materialId);
        }
    } catch (SQLException | ClassNotFoundException e) {
        e.printStackTrace();
    } finally {
        // Close resources
        if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
    }
%>

<body>
    <div class="container">
        <div class="form">
            <h1 class="title">Update Material</h1>
            <form action="UpdateMaterialServlet" method="post">
                <div class="input-container">
                    <label for="name">Name:</label>
                    <input type="text" id="name" name="name" value="<%= m1.getName() %>" required>
                </div>
                <div class="input-container">
                    <label for="quantity">Quantity:</label>
                    <input type="number" id="quantity" name="quantity" value="<%= m1.getQuantity() %>" required>
                </div>
                <div class="input-container">
                    <label for="unit">Unit:</label>
                    <input type="text" id="unit" name="unit" value="<%= m1.getUnit() %>">
                </div>
                <div class="input-container">
                    <label for="description">Description:</label>
                    <input type="text" id="description" name="description" value="<%= m1.getDescription() %>">
                </div>
                <div class="input-container">
                    <label for="expiryDate">Expiry Date:</label>
                    <input type="date" id="expiryDate" name="expiryDate" value="<%= m1.getExpiryDate() %>">
                </div>
                <div class="input-container">
                    <label for="supplier">Supplier:</label>
                    <input type="text" id="supplier" name="supplier" value="<%= m1.getSupplier() %>">
                </div>
                <input type="submit" name="submit" value="Update">
                <a href="MaterialList.jsp"><button type="button">Cancel</button></a>
            </form>
        </div>
    </div>


</body>
</html>