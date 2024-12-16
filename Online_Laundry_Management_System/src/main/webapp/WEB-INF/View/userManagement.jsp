<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Management</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            margin-top: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            background: white;
            padding: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>User Management</h2>

        <!-- Success and Error Messages -->
        <c:if test="${param.success == 'profile_updated'}">
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                Profile updated successfully.
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        </c:if>
        <c:if test="${param.error == 'update_failed'}">
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                Profile update failed. Please try again.
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        </c:if>

        <!-- User Update Form -->
        <form action="updateUser" method="post" enctype="multipart/form-data">
            <div class="mb-3">
                <label for="username" class="form-label">Username</label>
                <input type="text" class="form-control" id="username" name="username" value="${sessionScope.user.username}" required>
            </div>
            <div class="mb-3">
                <label for="email" class="form-label">Email</label>
                <input type="email" class="form-control" id="email" name="email" value="${sessionScope.user.email}" required>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" class="form-control" id="password" name="password">
                <small class="form-text text-muted">Leave blank to keep the current password.</small>
            </div>
            <div class="mb-3">
                <button type="submit" class="btn btn-primary">Update Profile</button>
            </div>
        </form>
        <div class="mb-3">
                <a href="dashboard" class="btn btn-secondary">Back to Dashboard</a>
            </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
