<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
    <title>Add Payment | CleanLaundry</title>
    <!-- Stylesheets -->
    <link href="file:///D:\SLIIT\Year 2 Sem 1\OOP\Final Assignment\Online Laundry Management System\src\css\Style.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <link rel="icon" href="images/favicon.png" type="image/x-icon">
</head>
<body>

<body class="boxed_wrapper">
    
   
    <div class = content_body>

        <div class ="secondhead">
            <br><br><br>
            <ul>
                <li class = "usernav"><a class="an" href = "Property manager.html">Dashboard</a></li>
                <li class = "usernav"><a class="an" href = "Tenants.html">Order Info </a></li>
                <li class = "usernav"><a class="an" href = "Payments.html">Payments </a></li>
                <li class = "usernav"><a class="an" href = "Messages.html">Messages </a></li>
                <li class = "usernav"><a class="an" href = "Listing.html">Delivery Info </a></li>
                
                
            </ul>
        </div>

        <div class ="container1">
            <div class = "Tenant_form" >

                <form method="POST" action="server.php" id="contact_agent">
                  <fieldset>

                    <legend>Add New Payment</legend><br>

                    <label for="Tenant ID">Order ID :</label>
                    <textarea id="requierments" name="requierments"></textarea>
					<input id="requierments" name="requierments"  />
                    
                    <br>
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
          			<br>
                    <label>
                    <input type="checkbox" name="service" value="wash" >
                   	Washing
                	</label>
          
                    <label>
                    <input type="checkbox" name="service" value="drycleaning">
                    Dry Cleaning
                	</label>
                    
                    <label>
                    <input type="checkbox" name="service" value="ironing">
                    Ironing
                	</label>
          
                    <label for="number">Amount :</label>
                    <input type="tel" name="number" required />
                    <br /><br />

                    <label for="number">Mobile Number :</label>
                    <input type="tel" name="number" placeholder="0123456789" required />
                    <br /><br />
                    
                    <b> Payment Method : </b>
          
                    <input type="radio" value="male" name="PaymentMethod" id="Cash" />
                    <label for="male">Cash on Delivery</label>
          
                    <input type="radio" value="female" name="PaymentMethod" id="Card" />
                    <label for="female">Card</label>
                    
                    <input type="radio" value="female" name="PaymentMethod" id="Paypal" />
                    <label for="female">PayPal</label><br /><br />

                    <label for="PendingAmount">Pending Amount :</label>
                    <input
                      type="text"
                      name="NIC"
                      id="NIC"
                      required
                    />
                    <br /><br />
                    <input class = "crud_bttn" style="width: 80px; height: 30px;" type="submit" value="Submit" name="submit"/>
                  </fieldset>
                </form>
            
        </div>
    </div>
   </div>> 
  




</body>
</html>