<%@ page import="java.util.List" %>
<%@ page import="com.model.Payment" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html>
<head>
 <meta charset="utf-8">
    <title>Payment List | CleanLaundry</title>

    <link href="file:///D:\SLIIT\Year 2 Sem 1\OOP\Final Assignment\Online Laundry Management System\src\css\Style.css" rel="stylesheet">
    <!--<link type="text/css" rel="stylesheet" id="jssDefault" href="file:///D:/SLIIT/Year%202%20Sem%201/OOP/Final%20Assignment/HTML/css/custom/theme-2.css">-->
    <link rel="icon" href="images/favicon.png" type="image/x-icon">
</head>


<body class="boxed_wrapper">
    

    <jsp:include page="/WEB-INF/View/Header.jsp"></jsp:include>
    <div class="content_body">

        <div class="secondhead">
            <div class="userdp"><img src="./Payments_files/Avatar.png" width="150px"></div>
            <br><br><br>
            <ul>
                <li class="username"> Hello Micheal Aspinwall</li><br>
                <li class="usernav"><a class="an" href="file:///D:/SLIIT/Year%202%20Sem%201/OOP/Final%20Assignment/HTML/Property%20manager.html">Dashboard </a></li>
                <li class="usernav"><a class="an" href="file:///D:/SLIIT/Year%202%20Sem%201/OOP/Final%20Assignment/HTML/index1.html#">Order Info </a></li>
                <li class="usernav"><a class="an" href="file:///D:/SLIIT/Year%202%20Sem%201/OOP/Final%20Assignment/HTML/Payments.html">Payments </a></li>
                <li class="usernav"><a class="an" href="file:///D:/SLIIT/Year%202%20Sem%201/OOP/Final%20Assignment/HTML/Messages.html">Messages </a></li>
                <li class="usernav"><a class="an" href="file:///D:/SLIIT/Year%202%20Sem%201/OOP/Final%20Assignment/HTML/Listing.html">Delivery Info </a></li>
                <hr>
                
        </ul></div>

        <div class="container1">
            <div class="navbtn2">
                <h1>Payments Details</h1><br>
                <button style="width: 120px; height: 30px;"><a class="am" href="PaymentADD.jsp">Add New </a></button>
                <button style="width: 120px; height: 30px;"><a class="am" href="PaymentADD.jsp">Report </a></button>
            </div>
            <br>
            <div class="listingtable">                
                    <table>
                    <thead>
                        <tr>
                            <th>Order ID</th>
                            <th>First Name</th>
                            <th>Service Category</th>
                            <th>Amount</th>
                            <th>Number</th>
                            <th>Pay Method</th>
                            <th>Pending Amount</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                        	List<Payment> payments = (List<Payment>) request.getAttribute("Payments");
                        	for (Payment payment : payments){
                        %>
                              
                        <tr>
                            <td><%=payment.getPaymentID() %></td>
                            <td><%=payment.getFname() %></td>
                            <td><%=payment.getServiceCategory() %></td>
                            <td><%=payment.getAmount() %></td>
                            <td><%=payment.getNumber() %></td>
                            <td><%=payment.getPaymentMethod() %></td>
                            <td><%=payment.getPendingamount() %></td>
                            
                            
                        <td class="crud_bttn">
                            <a href = "PaymentUpdate.jsp? id= <%=payment.getPaymentID() %>">Update</a>
                        </td>
                        <td class="crud_bttn">
                            <a href = "PaymentDelete?id=<%=payment.getPaymentID() %>" onclick = "return confirm ('Do you want to Delete the Record ?');">Delete</a>
       
                        </td>
                        </tr>
                        <% } %>
                    </tbody>
                    </table>
                    </div>

        </div>


    </div>
         
    <jsp:include page="/WEB-INF/View/Footer.jsp"></jsp:include>



</body></html>