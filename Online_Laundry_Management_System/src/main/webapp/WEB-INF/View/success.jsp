<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Item Added Successfully</title>
<style>
    body {
        background: linear-gradient(to bottom right, #76b852, #8DC26F);
        font-family: Arial, Helvetica, sans-serif;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
    }

    .success-container {
        background: #fff;
        border-radius: 10px;
        padding: 40px;
        text-align: center;
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        animation: popUp 0.5s ease;
    }

    h1 {
        color: #4CAF50;
        font-size: 2.5em;
        margin-bottom: 20px;
    }

    p {
        font-size: 1.2em;
        color: #555;
    }

    .button-container {
        margin-top: 30px;
    }

    a {
        text-decoration: none;
    }

    .button {
        background: #4CAF50;
        color: #fff;
        padding: 12px 24px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 1em;
        transition: background 0.3s ease;
    }

    .button:hover {
        background: #45a049;
    }

    @keyframes popUp {
        0% {
            transform: scale(0.8);
            opacity: 0;
        }
        100% {
            transform: scale(1);
            opacity: 1;
        }
    }
</style>
</head>
<body>
    <div class="success-container">
        <h1>Success!</h1>
        <p>The item has been added successfully.</p>
        <div class="button-container">
            <a href="MaterialList.jsp"><button class="button">View All Materials</button></a>
        </div>
    </div>
</body>
</html>
