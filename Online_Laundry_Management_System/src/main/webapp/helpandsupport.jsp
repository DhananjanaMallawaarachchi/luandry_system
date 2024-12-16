<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<link rel = "stylesheet"
   type = "text/css"
   href = "#" />
   
	<meta charset="UTF-8">
	<title>Help and Support</title>
	
	<style>
			@charset "UTF-8";
		
		/* Reset some default margin/padding for consistent display */
		* {
		    margin: 0;
		    padding: 0;
		    box-sizing: border-box;
		}
		
		body {
		    font-family: Arial, sans-serif;
		    background-color: #f5f5f5;
		    color: #333;
		    margin: 0;
		    padding: 0;
		}
		
		.help-container {
		    background-color: #fff;
		    padding: 40px;
		    border-radius: 8px;
		    box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
		    max-width: 800px; /* Increased width */
		    width: 100%;
		    margin: 40px auto; /* Centering the container */
		    text-align: center;
		}
		
		h2 {
		    margin-bottom: 20px;
		    color: #007BFF;
		    font-size: 28px; /* Increased font size */
		}
		
		p {
		    font-size: 16px;
		    color: #555;
		}
		
		.topics {
		    display: flex;
		    justify-content: space-around; /* Horizontal alignment */
		    margin-top: 30px;
		}
		
		.topic {
		    background-color: #e9ecef;
		    padding: 20px;
		    border-radius: 8px;
		    box-shadow: 0 0 10px rgba(0, 0, 0, 0.05);
		    width: 30%; /* Set width for consistent column sizes */
		    text-align: left;
		}
		
		.topic h3 {
		    margin-bottom: 10px;
		    color: #007BFF;
		    font-size: 20px;
		}
		
		.topic p {
		    margin-bottom: 15px;
		    color: #333;
		}
		
		button {
		    background-color: #007BFF;
		    color: #fff;
		    border: none;
		    padding: 10px 15px;
		    border-radius: 5px;
		    cursor: pointer;
		    transition: background-color 0.3s;
		}
		
		button:hover {
		    background-color: #0056b3;
		}
	
	</style>

</head>

<body>
	<jsp:include page="WEB-INF/View/Header.jsp"></jsp:include>

    <div class="help-container">
        <h2>Help and Support</h2>
        <p>We're here to help! Select a topic below or contact us directly.</p>

        <div class="topics">
            <div class="topic">
                <h3>FAQs</h3>
                <p>Find answers to the most frequently asked questions.</p>
                <a href="#"><button>View FAQs</button></a>
            </div>
            <div class="topic">
                <h3>Contact Us</h3>
                <p>Need more help? Reach out to our support team.</p>
                <a href="contactus.jsp"><button>Contact Support</button></a>
            </div>
            <div class="topic">
                <h3>Troubleshooting</h3>
                <p>Get help with common issues and troubleshooting steps.</p>
                <a href="#"><button>Troubleshoot</button></a>
            </div>
        </div>
    </div>
    
    <jsp:include page="WEB-INF/View/Footer.jsp"></jsp:include>
    
</body>

</html>
