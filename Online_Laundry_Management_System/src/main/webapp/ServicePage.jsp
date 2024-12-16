<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Client Trust Page</title>
    <link rel="icon" type="image/x-icon" href="https://img.icons8.com/?size=100&id=BIxuiAUWN2GM&format=png&color=000000">
    <style>
        body {
            background-color: lightcyan;
            font-family: Arial, sans-serif;
        }
        
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            text-align: center;
        }
        
        .hd {
            font-size: 2rem;
            font-weight: 600;
            margin-bottom: 10px;
        }
        
        .subtext {
            color: #777;
            font-size: 0.875rem;
        }

        .card-container {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
            gap: 20px;
            margin-top: 40px;
        }

        .card {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            width: 30%;
            max-width: 320px;
            padding: 20px;
            text-align: center;
        }
        
        .card img {
            width: 80px;
            height: auto;
            margin-bottom: 20px;
        }

        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.2);
        }

        .card-title {
            font-size: 1.2rem;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .card-subtitle {
            color: #555;
            font-size: 0.875rem;
        }

        .ft {
            margin-top: 40px;
        }

        .btn {
            display: inline-block;
            padding: 10px 20px;
            background-color: #1da1f2;
            color: white;
            border-radius: 25px;
            text-decoration: none;
            font-size: 1rem;
            transition: background-color 0.3s ease;
        }

        .btn:hover {
            background-color: #0d8ade;
        }
    </style>
</head>
<body>
	<jsp:include page="/WEB-INF/View/Header.jsp"></jsp:include>
    <div class="container">
        <div class="hd">Why Clients Trust Our Services</div>
        <p class="subtext">We're committed to exceeding your expectations, no matter the task at hand.</p>
        <div class="card-container">
            <div class="card">
                <img src="https://img.icons8.com/?size=100&id=30213&format=png&color=000000" alt="Washing Service">
                <div class="card-title">We're Washing</div>
                <div class="card-subtitle">We've invested countless hours developing an algorithm to simplify your tasks. We only charge professionals a small fee once they've met your needs.</div>
            </div>
            <div class="card">
                <img src="https://img.icons8.com/?size=100&id=ARSwH3YBtPvX&format=png&color=000000" alt="Drycleaning Service">
                <div class="card-title">We're Dry-cleaning</div>
                <div class="card-subtitle">We don't entertain advertisements from any source. Instead, we rely on accurate data to connect you with the most suitable candidate for the job.</div>
            </div>
            <div class="card">
                <img src="https://img.icons8.com/?size=100&id=lDXTj6Oce3h1&format=png&color=000000" alt="Ironing Service">
                <div class="card-title">We're Ironing </div>
                <div class="card-subtitle">Navigating the home buying or selling process can be daunting. Our team is here to provide expert guidance, ensuring you achieve your desired outcome with confidence.</div>
            </div>
        </div>
        <div class="ft">
            <p><small class="text-muted">Get Our Brilliant Services...!</small></p>
            <a href="SchedulingOrder.jsp" class="btn">Schedule Your Order</a>
        </div>
    </div>
    	<jsp:include page="/WEB-INF/View/Footer.jsp"></jsp:include>
</body>
</html>
