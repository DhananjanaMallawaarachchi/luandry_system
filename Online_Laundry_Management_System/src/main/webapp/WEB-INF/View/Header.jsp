
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <!--   <link rel="icon" type="image/x-icon" href="https://img.icons8.com/?size=100&id=BIxuiAUWN2GM&format=png&color=000000"> -->
    <title>Header</title>
    
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: Arial, sans-serif;
        }
        
        header {
            background-color: #f8f8f8;
            padding: 50px 5px;
        }
        
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 20px;
        }
        
        .logo {
            font-size: 24px;
            font-weight: bold;
            display: flex;
            align-items: center;
        }
        
        .big-red {
            color: red;
            font-size: 30px;
        }
        
        .nav-links {
            list-style-type: none;
            display: flex;
            justify-content: center;
            flex-grow: 1;
        }
        
        .nav-links li {
            margin-right: 40px; /* Increased spacing */
        }
        
        .nav-links li:last-child {
            margin-right: 0; /* Remove margin for the last item */
        }
        
        .nav-links li a {
            text-decoration: none;
            color: black;
            font-size: 16px;
            font-weight: bold;
            transition: color 0.3s;
        }
        
        .nav-links li a.active {
            color: blue;
        }
        
        .nav-links li a:hover {
            color: blue;
        }

        .cart {
            display: flex;
            align-items: center;
            margin-left: auto; /* Pushes the cart links to the right */
        }

        .cart a {
            text-decoration: none;
            font-size: 16px;
            color: black;
            font-weight: bold;
            margin-left: 10px; /* Space between Register and Login */
        }
        
        .cart span {
            margin: 0 10px; /* Space around the separator */
            font-weight: bold;
        }

        .cart a:hover {
            color: blue;
        }
        
    </style>
</head>
<body>
    <header>
        <nav class="navbar">
            <div class="logo">
                <span class="big-red">U</span>rbanWash
            </div>
            <ul class="nav-links">
                <li><a href="#" class="active">Home</a></li>
                <li><a href="aboutusjsp">About</a></li>
                <li><a href="ServicePage.jsp">Services</a></li>
                <li><a href="Checkout.jsp">Checkout Order</a></li>
                <li><a href="contactus.jsp">Contact</a></li>
                <li><a href="helpandsupport.jsp">Help and Support</a></li>
            </ul>
            <div class="cart">
                <% 
                    // Check if a user is logged in by looking for a session attribute
                    String username = (String) session.getAttribute("username");
                    if (username != null) {
                        // If the user is logged in, display the username and a logout link
                %>
                        <a href="UserDashboard.jsp">Welcome, <%= username %>!</a>
                        <span>|</span>
                        <a href="Logout">Logout</a>
                <% 
                    } else { 
                        // If the user is not logged in, show Register and Login links
                %>
                        <a href="Login.jsp">Register</a>
                        <span>|</span>
                        <a href="Login.jsp">Login</a>
                <% 
                    } 
                %>
            </div>
        </nav>
    </header>

</body>
</html>
