<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        .form-container {
            max-width: 400px;
            margin: 50px auto;
            padding: 2rem;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2 class="text-center">Login</h2>
        
        <!-- Display error messages if present -->
        <%
        String error = (String) request.getAttribute("errorMessage");
        String message = (String) request.getAttribute("message");

        if (error != null) {
        %>
        <div class="alert alert-danger" role="alert">
            <%= error %>
        </div>
        <%
        } else if (message != null) {
        %>
        <div class="alert alert-success" role="alert">
            <%= message %>
        </div>
        <%
        }
        %>

        <form action="login" method="post">
            <div class="mb-3">
                <label for="username" class="form-label">Username</label>
                <input type="text" id="username" name="username" class="form-control" required>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" id="password" name="password" class="form-control" required>
            </div>
            <button type="submit" class="btn btn-primary w-100">Login</button>
        </form>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
