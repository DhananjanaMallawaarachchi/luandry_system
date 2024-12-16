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

</head>
<body>
	
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
				<form method="POST" action="ApproveOrder">
    				<input type="hidden" name="orderId" value="<%=order.getOrderId()%>"/>
    				<input type="hidden" name="actionType" value="approve"/>
    				<input type="submit" value="Approve" class="approve"/>
				</form>

				<form method="POST" action="RejectOrder">
    				<input type="hidden" name="orderId" value="<%=order.getOrderId()%>"/>
    				<input type="hidden" name="actionType" value="reject"/>
    				<input type="submit" value="Reject" class="reject"/>
				</form>

				 </td>	
				</tr>			
			<%	
			   }
            %>  
			</table>
		</div>
	
</body>
</html>