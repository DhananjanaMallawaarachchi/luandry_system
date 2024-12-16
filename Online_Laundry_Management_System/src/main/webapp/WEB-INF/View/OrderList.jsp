<%@page import="com.model.Order"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.service.OrderImplementation"%>
<%@page import="com.service.OrderInterface"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" type="image/x-icon" href="https://img.icons8.com/?size=100&id=BIxuiAUWN2GM&format=png&color=000000">
<style>
		/* General container styling */
.container {
    margin: 20px;
    padding: 20px;
    background-color: #f0f8ff; /* Light blue background for the container */
    border: 1px solid #0039a6; /* Dark blue border */
    border-radius: 10px;
}

/* Table styling */
table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 10px;
}

th, td {
    padding: 12px;
    border: 1px solid #0039a6; /* Dark blue border for table cells */
    text-align: left;
}

th {
    background-color: #0039a6; /* Dark blue background for headers */
    color: white; /* White text for better contrast */
}

td {
    background-color: #e6f7ff; /* Light blue background for table rows */
    color: #333; /* Darker text for readability */
}

tr:nth-child(even) td {
    background-color: #cceeff; /* Slightly darker blue for alternate rows */
}

/* Button styling */
input[type="submit"] {
    padding: 8px 12px;
    margin: 4px;
    border: none;
    color: white;
    border-radius: 5px;
    cursor: pointer;
}

.update {
    background-color: #1da1f2; /* Twitter blue */
}

/* Delete button styling */
.delete {
    background-color: #0039a6; /* Dark blue */
}

/* Add hover effect for buttons */
input[type="submit"]:hover {
    opacity: 0.9;
}

/* Responsive design for smaller screens */
@media screen and (max-width: 600px) {
    table, th, td {
        font-size: 14px;
    }
}

</style>
</head>
<body>
<jsp:include page="/WEB-INF/View/Header.jsp"></jsp:include>
	
		<div class="container">
			<table>
				<thead>
					<tr>
						<th>OrderId</th>
						<th>Service</th>
						<th>Stain Remove</th>
						<th>Clothes Collection</th>
						<th>Collection Drop Off Time</th>
						<th>Delivery Method</th>
						<th>Delivery Duration</th>
						<th>Delivery Address</th>
						<th>Payment Method</th>
						<th>Additional Requirements</th>
					</tr>
				</thead>
				 	<%OrderInterface orderInterface = new OrderImplementation();
				 	ArrayList<Order> arrayList = orderInterface.getOrders();
					for(Order order : arrayList){
					%>
				 <tr>
				<td> <%=order.getOrderId() %> </td>
				<td> <%=order.getServices() %> </td>
				<td> <%=order.getStainRemoval() %> </td>
				<td> <%=order.getClothesCollection() %> </td>
				<td> <%=order.getCollectionDropOffTime() %> </td>
				<td> <%=order.getDeliveryMethod() %> </td>
				<td> <%=order.getDeliveryDuration() %> </td>
				<td> <%=order.getDeliveryAddress() %> </td>
				<td> <%=order.getPaymentMethod() %> </td>
				<td> <%=order.getAdditionalRequirements() %> </td>	
				<td> 
				<form method="POST" action="GetOrder">
    				<input type="hidden" name="orderId" value="<%=order.getOrderId()%>"/>
    				<input type="hidden" name="actionType" value="update"/>
    				<input type="submit" value="Update" class="update"/>
				</form>

				<form method="POST" action="DeleteOrder">
    				<input type="hidden" name="orderId" value="<%=order.getOrderId()%>"/>
    				<input type="hidden" name="actionType" value="delete"/>
    				<input type="submit" value="Delete" class="delete"/>
				</form>

				 </td>	
				</tr>			
			<%	
			   }
            %>  
			</table>
		</div>
	<jsp:include page="/WEB-INF/View/Footer.jsp"></jsp:include>
</body>
</html>