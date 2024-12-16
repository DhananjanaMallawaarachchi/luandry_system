<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.model.Order"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Payment | Urban Laundry</title>
	<link href="css\PaymentAddCustomer.css" rel="stylesheet">
</head>
<body>
		<%Order order = (Order) request.getAttribute("order");%>
	<div class ="container1">
            <div class = "Tenant_form" >

                <form method="POST" action="PaymentAddServlet" id="contact_agent">
                  <fieldset>

                    <legend><b>Payment Details</legend><br>

                    <label for="Tenant ID">Order ID :</label>
                    <textarea id="requierments" name="requierments"><%=order.getOrderId()%></textarea><br>
                    <label for="first_name">First name :</label>
                    <input
                      type="text"
                      name="first_name"
                      id="first_name"
                      placeholder="Frist Name"
                      required
                    />
                    <br>       
                    <b> Service Category : </b>
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
                	</label>
          
                    <label for="number">Amount :</label>
                    <input type="tel" name="number" required />
                    <br>

                    <label for="number">Mobile Number :</label>
                    <input type="tel" name="number" placeholder="0123456789" required />
                    <br>
                    
                    <b> Payment Method : </b>
          
                    <input class = "Cash" type="radio" value="COD" name="PaymentMethod" id="Cash"  />
                    <label for="COD">Cash on delivery</label>
          
                    <input class = "Cash" type="radio" value="Card" name="PaymentMethod" id="Cash" />
                    <label for="Card">Card</label>
                    
                    <input class = "Cash" type="radio" value="Paypal" name="PaymentMethod" id="Cash" />
                    <label for="Paypal">PayPal</label><b>

                    <label for="PendingAmount">Pending Amount :</label>
                    <input
                      type="text"
                      name="NIC"
                      id="NIC"
                      required
                    />
                    <br /><br />
                    <input class="pay" style="width: 80px; height: 30px;" type="submit" value="Submit" name="submit"/>
                  </fieldset>
                </form>
            
        </div>

    </div>
</body>
</html>