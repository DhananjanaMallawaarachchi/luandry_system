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
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f4f4f4;
        }

        h1 {
            color: #333;
            text-align: center;
            margin-bottom: 20px;
        }

        a {
            text-decoration: none;
            color: white;
            background-color: #4CAF50;
            padding: 10px 15px;
            border-radius: 5px;
            margin: 10px;
            display: inline-block;
        }

        a:hover {
            background-color: #45a049;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 12px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
            color: #333;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .actions a {
            margin-right: 5px;
            padding: 5px 10px;
            background-color: #007BFF;
            color: white;
            border-radius: 5px;
        }

        .actions a:hover {
            background-color: #0056b3;
        }

        .actions a.delete {
            background-color: #FF4136;
        }

        .actions a.delete:hover {
            background-color: #c32f27;
        }
    </style>
</head>
<body>
    <h1>Material List</h1>
    <a href="MaterialAdd.jsp">Add Material</a>

    <%
    // Database connection and query execution
    Connection con = null;
    Statement stmt = null;
    ResultSet rs = null;
    List<Material> materials = new ArrayList<>();
    
    try {
        con = DBConnectMaterial.getConnection();
        stmt = con.createStatement();
        String sql = "SELECT * FROM Material";
        rs = stmt.executeQuery(sql);
        
        while (rs.next()) {
            int material_id = rs.getInt(1);
            String name = rs.getString(2);
            double quantity = rs.getDouble(3);
            String unit = rs.getString(4);
            String description = rs.getString(5);
            String expiryDate = rs.getString(6);
            String supplier = rs.getString(7);
            
            Material material = new Material(material_id, name, quantity, unit, description, expiryDate, supplier);
            materials.add(material);
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) 
        	try { rs.close(); 
       		 } catch (Exception e) { 
       			 e.printStackTrace(); 
       		 }
        if (stmt != null) 
        	try { stmt.close();
        	} catch (Exception e) { 
        		e.printStackTrace(); 
        	}
        if (con != null) 
        	try { con.close(); 
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
                    <form action="MaterialUpdateServlet" method="POST" style="display:inline;">
			        <input type="hidden" name="material_id" value="<%= material.getMaterialId() %>">
			        <button type="submit">Update</button>
			    </form>
			    <td>
			    <form action="MaterialDeleteServlet" method="POST" style="display:inline;">
			        <input type="hidden" name="material_id" value="<%= material.getMaterialId() %>">
			        <button type="submit" onclick="return confirm('Are you sure?');">Delete</button>
			    </form>
				</td>

               
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
