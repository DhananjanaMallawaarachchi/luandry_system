<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Item Adding Failed</title>
<style>
    body {
        background: linear-gradient(to bottom right, #e74c3c, #ff6f61);
        font-family: Arial, Helvetica, sans-serif;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
    }

    .failure-container {
        background: #fff;
        border-radius: 10px;
        padding: 40px;
        text-align: center;
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        animation: popUp 0.5s ease;
    }

    h1 {
        color: #e74c3c;
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
        background: #e74c3c;
        color: #fff;
        padding: 12px 24px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 1em;
        transition: background 0.3s ease;
    }

    .button:hover {
        background: #c0392b;
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
    <div class="failure-container">
        <h1>Failure!</h1>
        <p>Item addition has failed. Please try again.</p>
        <div class="button-container">
            <a href="MaterialAdd.jsp"><button class="button">Try Again</button></a>
        </div>
    </div>
</body>
</html>
