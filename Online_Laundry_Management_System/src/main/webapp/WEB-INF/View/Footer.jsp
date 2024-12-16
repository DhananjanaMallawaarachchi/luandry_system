<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Footer</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css">

<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: Arial, sans-serif;
}

footer {
    background-color: #2f3e46;
    color: white;
    padding: 40px 0;
    font-size: 14px;
}

.newsletter {
    text-align: center;
    margin-bottom: 40px;
}

.newsletter h3 {
    font-size: 20px;
    margin-bottom: 20px;
}

.newsletter form input[type="text"],
.newsletter form input[type="email"] {
    padding: 10px;
    border-radius: 25px;
    border: none;
    margin-right: 10px;
    width: 200px;
    background-color: #E0E0E0; /* Ash white color */
    color: #333;
}

.newsletter form input[type="text"]::placeholder,
.newsletter form input[type="email"]::placeholder {
    color: #666; /* Placeholder text color */
}

.newsletter form button {
    padding: 10px 20px;
    background-color: #1ea7fd;
    color: white;
    border: none;
    border-radius: 25px;
    cursor: pointer;
    font-weight: bold;
}

.newsletter form button:hover {
    background-color: #0e7acc;
}

.footer-content {
    display: flex;
    justify-content: space-around;
    text-align: left;
    padding: 20px;
    border-top: 1px solid rgba(255, 255, 255, 0.1);
}

.column {
    max-width: 200px;
}

.column h4 {
    margin-bottom: 20px;
    font-size: 18px;
}

.column ul {
    list-style-type: none;
}

.column ul li {
    margin-bottom: 10px;
}

.column ul li a {
    color: white;
    text-decoration: none;
    transition: color 0.3s;
}

.column ul li a:hover {
    color: #1ea7fd;
}
---------------------
.social-media {
		    padding: 2rem 0 0 0;
		}
		
		.social-media p {
		    color: #333;
		}
		
		.social-icons {
		    display: flex;
		    margin-top: 0.5rem;
		}
		
		.social-icons a {
		    width: 35px;
		    height: 35px;
		    background: linear-gradient(45deg, #1a5bbc, #141c92);
		    border-radius: 5px;
		    color: #fff;
		    text-align: center;
		    line-height: 35px;
		    margin-right: 0.5rem;
		    transition: 0.3s;
		}
		
		.social-icons a:hover {
		    transform: scale(1.1);
		}
		------------------------------

.social-icons a {
    font-family: FontAwesome;
    font-size: 20px;
    color: white;
    text-decoration: none;
    margin-right: 10px;
    transition: color 0.3s;
}

.social-icons a:hover {
    color: #1ea7fd;
}

</style>
</head>

<body>

    <footer>
        <div class="newsletter">
            <h3>Subscribe Our Newsletter</h3>
            <form>
                <input type="text" placeholder="Your Name">
                <input type="email" placeholder="Your Email">
                <button type="submit">Subscribe</button>
            </form>
        </div>
        <div class="footer-content">
            <div class="column">
                <p>Lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore.</p>
                <div class="social-icons">
                    <a href="#"><i class="fab fa-facebook-f"></i></a>
                    <a href="#"><i class="fab fa-linkedin-in"></i></a>
                    <a href="#"><i class="fab fa-instagram"></i></a>
                    <a href="#"><i class="fab fa-twitter"></i></a>
                </div>
            </div>
            <div class="column">
                <h4>Services</h4>
                <ul>
                    
                    <li><a href="aboutus.jsp">About Us</a></li>
                    <li><a href="contactus.jsp">Contact Us</a></li>
                    <li><a href="ServicePage.jsp">Services</a></li>
                    <li><a href="#">Privacy Policy</a></li>
                </ul>
            </div>
            <div class="column">
                <h4>Quick Link</h4>
                <ul>
                    <li><a href="aboutus.jsp">About Us</a></li>
                    <li><a href="contactus.jsp">Contact Us</a></li>
                    <li><a href="ServicePage.jsp">Services</a></li>
                    <li><a href="#">Privacy Policy</a></li>
                </ul>
            </div>
            <div class="column">
                <h4>Contact</h4>
                <ul>
                    <li>Head Office - No 100, Galle Road, Dehiwala.</li>
                    <li>011 - 22 - 22 - 999</li>
                    <li>info@urbanwash.lk</li>
                </ul>
            </div>
        </div>
    </footer>

</body>
</html>