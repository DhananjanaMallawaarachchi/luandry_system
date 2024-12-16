<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="com.model.Order"%>
<%@page import="com.model.Payment"%> 

<!DOCTYPE html>
<html>
<head>
 <title> PaymentUpdate | CleanLaundry</title>

    <link href="file:///D:\SLIIT\Year 2 Sem 1\OOP\Final Assignment\Online Laundry Management System\src\css\Style.css" rel="stylesheet">
    <link type="text/css" rel="stylesheet" id="jssDefault" href="file:///D:/SLIIT/Year%202%20Sem%201/OOP/Final%20Assignment/HTML/css/custom/theme-2.css">
    <link rel="icon" href="images/favicon.png" type="image/x-icon">
</head>
<body class="boxed_wrapper">
    
    
    <jsp:include page="/WEB-INF/View/Header.jsp"></jsp:include>
    <%Order order = (Order) request.getAttribute("order");%>
    <%Payment payment = (Payment) request.getAttribute("payment");%>
    
    <form action = "PaymentUpdate" method = "post">
    
    	<label for = "Fname"> FName :</label>
    	<input type ="text" id = "name" name = "name" required <%=payment.getFname()%> ><br>
    
    	<label>
                    <input type="checkbox" name="service" value="wash" <%= (order != null && order.getServices().equals("wash")) ? "checked" : "" %>>
                   	Washing
                	</label>
                    <label>
                    <input type="checkbox" name="service" value="drycleaning" <%= (order != null && order.getServices().equals("drycleaning")) ? "checked" : "" %>>
                    Dry Cleaning
                	</label>
                    <label>
                    <input type="checkbox" name="service" value="ironing" <%= (order != null && order.getServices().equals("ironing")) ? "checked" : "" %>>
                    Ironing
        </label><br><br>
		
		<label for = "Amount"> Amount :</label>
    	<input type ="number" id = "Amount" name = "Amount" required <%=payment.getAmount()%> ><br>
    
    	<label for = "Number"> Contact Number :</label>
    	<input type ="number" id = "Number" name = "Number" <%=payment.getNumber()%>><br>
    	
    	<b> Payment Method : </b>
          
                    <input class = "Cash" type="radio" value="COD" name="PaymentMethod" id="Cash"  />
                    <label for="COD">Cash on delivery <%= (payment != null && payment.getPaymentMethod().equals("Cash on delivery")) ? "checked" : "" %> </label>
          
                    <input class = "Cash" type="radio" value="Card" name="PaymentMethod" id="Cash" />
                    <label for="Card">Card  <%= (payment != null && payment.getPaymentMethod().equals("Cash")) ? "checked" : "" %> </label>
                    
                    <input class = "Cash" type="radio" value="Paypal" name="PaymentMethod" id="Cash" />
                    <label for="Paypal">PayPal  <%= (payment != null && payment.getPaymentMethod().equals("Paypal")) ? "checked" : "" %></label><br>
    
      	<label for = "Pendingamount"> Pending Amount :</label>
    	<input type ="text" id = "Pendingamount" name = "Pendingamount"  <%=payment.getPendingamount()%> ><br>
    	
    	<input type="submit" name="submit" value="Update">
        <a href="PaymentList.jsp"><button>Update</button></a>
    
    </form>
   <jsp:include page="/WEB-INF/View/Footer.jsp"></jsp:include>



</body>
</html>