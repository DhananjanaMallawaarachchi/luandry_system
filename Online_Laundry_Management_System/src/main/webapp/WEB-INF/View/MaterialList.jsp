<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="com.model.Material" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="com.util.DBConnectMaterial" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Material List</title>
    <link rel="icon" type="image/x-icon" href="https://img.icons8.com/?size=100&id=BIxuiAUWN2GM&format=png&color=000000">
</head>
<body>
    <h1>Material List</h1>
    <a href="MaterialAdd.jsp">Add Material</a>
    
    <%
    
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        
    	
        List<Material> materials = new ArrayList<>();

        try {
            // Load the MySQL driver
            Class.forName("com.mysql.jdbc.Driver");

            // Create a connection
            con = DBConnectMaterial.getConnection();

            // Create a statement
            stmt = con.createStatement();

            // Execute the query
            String sql = "SELECT * FROM Material";
            rs = stmt.executeQuery(sql);

            // Iterate through the result set and create Material objects
            while (rs.next()) {
                int material_id = rs.getInt("material_id");
                String name = rs.getString("name");
                double quantity = rs.getDouble("quantity");
                String unit = rs.getString("unit");
                String expiryDate = rs.getString("expiryDate");
                String supplier = rs.getString("supplier");

                Material material = new Material();
                materials.add(material);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    %>

    <table border="1">
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Quantity</th>
                <th>Unit</th>
                <th>Expiry Date</th>
                <th>Supplier</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <%
                if (!materials.isEmpty()) {
                    for (Material material : materials) {
            %>
            <tr>
                <td><%= material.getMaterialId() %></td>
                <td><%= material.getName() %></td>
                <td><%= material.getQuantity() %></td>
                <td><%= material.getUnit() %></td>
                <td><%= material.getExpiryDate() %></td>
                <td><%= material.getSupplier() %></td>
                <td>
                    <a href="MaterialUpdate.jsp?id=<%= material.getMaterialId() %>">Update</a>
                    <a href="MaterialDelete?id=<%= material.getMaterialId() %>" onclick="return confirm('Are you sure?');">Delete</a>
                </td>
            </tr>
            <%
                    }
                } else {
            %>
            <tr>
                <td colspan="7">No materials available.</td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
</body>
</html>
