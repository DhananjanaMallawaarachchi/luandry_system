<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.Order"%>
<%@page import="com.service.OrderInterface"%>
<%@page import="com.service.OrderImplementation"%>
<% 
	Object userName = session.getAttribute("username");
	if(userName == null){
		response.sendRedirect("Login.jsp");
	}	
	System.out.print("debug point");
%>

<!DOCTYPE html>
<!--=== Coding by CodingLab | www.codinglabweb.com === -->
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!----======== CSS ======== -->
    <link rel="stylesheet" href="css/userDash.css">
    <link rel="icon" type="image/x-icon" href="https://img.icons8.com/?size=100&id=BIxuiAUWN2GM&format=png&color=000000"> 
    <!----===== Iconscout CSS ===== -->
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
    <style>
			/* General body styles */
body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background-color: #f4f7fc;
    margin: 0;
    padding: 0;
    display: flex;
    flex-direction: column; /* Added this to structure body */
    min-height: 100vh; /* Ensures body height covers the full viewport */
}

/* Fixed header */
header {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    z-index: 1000;
    background-color: white; /* Ensure header has a background */
    height: 120px; /* Adjust header height */
}

/* Footer adjustment */
footer {
    position: fixed;
    bottom: 0;
    left: 0;
    width: 100%;
    z-index: 1000;
    background-color: white; /* Ensure footer has a background */
    height: 100px; /* Adjust footer height */
    padding: 10px 20px;
    box-shadow: 0 -2px 10px rgba(0, 0, 0, 0.1); /* Optional: Add shadow for depth */
}

/* Adjust dashboard container to avoid overlap */
.dashboard-container {
    margin-top: 140px; /* Adjust to be slightly more than the header height */
    margin-bottom: 120px; /* Adjust for footer height */
    padding: 20px;
    background-color: #f0f0f0;
    flex-grow: 1; /* Allows the dashboard to grow and fill available space */
}

/* Sidebar */
nav1 {
    width: 240px;
    height: 100vh;
    background-color: #1da1f2;
    position: fixed;
    top: 120px; /* Start below the header */
    left: 0;
    z-index: 1000;
    transition: width 0.3s ease;
}

/* Sidebar links */
nav1 .menu-items {
    padding: 20px 0;
}

nav1 .nav1-links li {
    list-style: none;
    margin-bottom: 30px;
}

nav1 .nav1-links li a {
    display: flex;
    align-items: center;
    padding: 10px 20px;
    color: white;
    text-decoration: none;
    font-size: 18px;
    transition: background-color 0.3s ease;
}

nav1 .nav1-links li a:hover {
    background-color: #005bb5;
    border-radius: 10px;
}

/* Sidebar toggle */
.sidebar-toggle {
    position: absolute;
    left: 270px;
    top: 20px;
    cursor: pointer;
    font-size: 22px;
    color: #1da1f2;
}

/* Dashboard section */
.dashboard {
    margin-left: 240px;
    width: calc(100% - 240px);
    padding: 40px;
    transition: margin-left 0.3s ease;
}

.dashboard .top {
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.search-box {
    display: flex;
    align-items: center;
    background-color: #fff;
    padding: 5px 15px;
    border-radius: 20px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.search-box input {
    border: none;
    outline: none;
    margin-left: 10px;
}

/* Floating dashboard boxes */
.boxes {
    display: flex;
    justify-content: space-between;
    margin-top: 40px;
}

.box {
    flex: 1;
    margin: 0 15px;
    background-color: white;
    padding: 30px;
    border-radius: 12px;
    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.05);
    text-align: center;
    transition: transform 0.2s ease;
}

.box:hover {
    transform: translateY(-10px);
}

.box .number {
    font-size: 42px;
    font-weight: bold;
    color: #1da1f2;
}

.box .text {
    font-size: 20px;
    margin-top: 10px;
    color: #555;
}

/* Activity section */
.activity {
    margin-top: 40px;
}

.activity .title {
    font-size: 24px;
    margin-bottom: 20px;
}

.container {
    background-color: white;
    padding: 20px;
    border-radius: 12px;
    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.05);
}

/* Modern table */
table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}

table th, table td {
    padding: 16px;
    text-align: left;
    border-bottom: 1px solid #ddd;
}

table th {
    background-color: #1da1f2;
    color: white;
    font-weight: bold;
    text-transform: uppercase;
}

table td {
    background-color: #f9f9f9;
    color: #333;
}

/* Hover effect on table rows */
table tr:hover td {
    background-color: #e6f0fa;
    transition: background-color 0.3s ease;
}

/* Responsive design */
@media screen and (max-width: 768px) {
    nav1 {
        width: 60px;
    }

    .sidebar-toggle {
        left: 80px;
    }

    .dashboard {
        margin-left: 60px;
        width: calc(100% - 60px);
    }

    nav1 .nav1-links li a span {
        display: none;
    }

    .boxes {
        flex-direction: column;
        margin-top: 20px;
    }

    .box {
        margin: 10px 0;
    }
}

    </style>
    <title>User Dashboard</title> 
</head>
<body>
	<jsp:include page="WEB-INF/View/Header.jsp"></jsp:include>
    <nav1>
        <div class="menu-items">
            <ul class="nav1-links">
                <li><a href="#">
                    <i class="uil uil-estate"></i>
                    <span class="link-name">Dahsboard</span>
                </a></li>
                <li><a href="#">
                    <i class="uil uil-files-landscapes"></i>
                    <span class="link-name">Profile</span>
                </a></li>
                <li><a href="#">
                    <i class="fa-solid fa-money-check-dollar"></i>
                    <span class="link-name">Payment</span>
                </a></li>
                <li><a href="#">
                    <i class="uil uil-comments"></i>
                    <span class="link-name">Comment</span>
                </a></li>
                
            </ul>
            
            <ul class="logout-mode">
                <li><a href="Logout">
                    <i class="uil uil-signout"></i>
                    <span class="link-name">Logout</span>
                </a></li>
            
            </ul>
        </div>
    </nav1>

    <section class="dashboard">
        <div class="top">
            <i class="uil uil-bars sidebar-toggle"></i>

            <div class="search-box">
                <i class="uil uil-search"></i>
                <input type="text" placeholder="Search here...">
            </div>
        </div>

        <div class="dash-content">
            <div class="overview">
                <div class="title">
                    <i class="uil uil-tachometer-fast-alt"></i>
                    <span class="text">Dashboard</span>
                </div>

                <div class="boxes">
                    <div class="box box1">
                        <i class=""></i>
                        <a href="WEB-INF/View/OrderList.jsp">
                        <span class="text">Total Orders</span>
                        <span class="number">3</span></a>
                    </div>
                    <div class="box box2">
                        <i class=""></i>
                        <span class="text">Payments</span>
                        <span class="number">2</span>
                    </div>
                    <div class="box box3">
                        <i class=""></i>
                        <span class="text">Reviews</span>
                        <span class="number">10,120</span>
                    </div>
                </div>
            </div>

            <div class="activity">
                <div class="title">
                    <i class="uil uil-clock-three"></i>
                    <span class="text">Recent Activity</span>
                </div>
                <div class="container">
                    <table>
                        <thead>
                            <tr>
                                <th>OrderId</th>
                                <th>Clothes Collection</th>
                                <th>Collection Drop Off Time</th>
                                <th>Delivery Method</th>
                                <th>Delivery Duration</th>
                                <th>Payment</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                             <%OrderInterface orderInterface = new OrderImplementation();
                             ArrayList<Order> arrayList = orderInterface.getOrders();
                            for(Order order : arrayList){
                            %>
                         <tr>
                        <td> <%=order.getOrderId() %> </td>
                        <td> <%=order.getClothesCollection() %> </td>
                        <td> <%=order.getCollectionDropOffTime() %> </td>
                        <td> <%=order.getDeliveryMethod() %> </td>
                        <td> <%=order.getDeliveryDuration() %> </td>
                        
                        <td> <%=order.getStatus() %> </td>	
                        </tr>
                        <%	
			   				}
            			%>  
            	</table> 
            	</div>
            	</div>
           </div>
	</section>
	<jsp:include page="WEB-INF/View/Footer.jsp"></jsp:include>
    <script src="js/userDash.js"></script>
    
</body>
</html>