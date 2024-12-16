<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>

<link rel = "stylesheet"
   type = "text/css"
   href = "css/contactus.css" />
   
<meta charset="UTF-8">
<title>Contact Us</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css">

</head>

<body>
	<jsp:include page="WEB-INF/View/Header.jsp"></jsp:include> <!-- To insert header-->

    <div class="container">
    
        <!--  <span class="big-circle"></span> -->  <!-- Need to modify background after implementation -->
        <!--  <span class="right-circle"></span> -->
        
        <div class="form">
            <div class="contact-info">
                <h3 class="title">Get in Contact<br>We’re Just a Click Away!</h3>
                    
                <p class="text">
                    Have a query or need assistance? <br>Reach out to us directly or request a callback by filling out the form below.<br>
                    We always strive to improve, so if you liked our services, please leave us a review and share your thoughts!
                </p>

                <div class="info">
                    <div class="information">
                        <i class="fas fa-map-marker-alt"></i> &emsp;
                        <p>Head Office <br>No 100, Galle Road, Dehiwala.</p>
                    </div>
                    <div class="information">
                        <i class="fas fa-envelope"></i> &emsp;
                        <p>info@urbanwash.lk</p>
                    </div>
                    <div class="information">
                        <i class="fas fa-phone"></i> &emsp;
                        <p>011-22-22-999</p>
                    </div>
                    <div class="information">
                        <i class="fa-solid fa-hourglass-half"></i> &emsp;
                        <p>Working Hours<br>Mon-Sun: 8:00 am - 7.30 pm</p>
                    </div>
                </div>

                <div class="social-media">
                    <p>Connect with us :</p>
                    <div class="social-icons">
                        <a href="#"><i class="fab fa-facebook-f"></i></a>
                        <a href="#"><i class="fab fa-linkedin-in"></i></a>
                        <a href="#"><i class="fab fa-instagram"></i></a>
                        <a href="#"><i class="fab fa-twitter"></i></a>
                    </div>
                </div>
            </div>

            <div class="contact-form">
                <span class="circle one"></span>
                <span class="circle two"></span>

                <form>
                    <h3 class="title">Contact us</h3>
                    <div class="input-conatiner">
                        <input type="text" name="name" class="input">
                        <label for="#">Name</label>
                        <span>Name</span>
                    </div>

                    <div class="input-conatiner">
                        <input type="email" name="email" class="input">
                        <label for="#">Email</label>
                        <span>Email</span>
                    </div>

                    <div class="input-conatiner">
                        <input type="tel" name="phone" class="input">
                        <label for="#">Phone</label>
                        <span>Phone</span>
                    </div>

                    <div class="input-conatiner textarea">
                        <textarea name="message" class="input"></textarea>
                        <label for="#">Message</label>
                        <span>Message</span>
                    </div>
                    <input type="submit" value="Send" class="btn">
                </form>
            </div>
        </div>

    </div>
    
    <script src="js/contactus.js"></script>
    <jsp:include page="WEB-INF/View/Footer.jsp"></jsp:include> <!-- To insert footer -->
    
</body>
</html>