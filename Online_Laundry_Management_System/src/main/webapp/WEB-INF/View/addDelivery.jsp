<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Delivery</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h1 class="my-4">Add New Delivery</h1>

        <!-- Display success message if form is submitted successfully -->
        <c:if test="${param.success == 'true'}">
            <div class="alert alert-success" role="alert">
                Delivery added successfully!
            </div>
        </c:if>

        <!-- Display error message if any -->
        <c:if test="${not empty errorMessage}">
            <div class="alert alert-danger" role="alert">
                ${errorMessage}
            </div>
        </c:if>

        <!-- Add Delivery Form -->
        <form action="addDelivery" method="post">
            <div class="mb-3">
                <label for="customerName" class="form-label">Customer Name</label>
                <input type="text" class="form-control" id="customerName" name="customerName" required>
            </div>
            <div class="mb-3">
                <label for="deliveryAddress" class="form-label">Delivery Address</label>
                <input type="text" class="form-control" id="deliveryAddress" name="deliveryAddress" required>
            </div>
            <div class="mb-3">
                <label for="deliveryStatus" class="form-label">Status</label>
                <input type="text" class="form-control" id="deliveryStatus" name="deliveryStatus" required>
            </div>
            <div class="mb-3">
                <label for="deliveryDate" class="form-label">Delivery Date</label>
                <input type="date" class="form-control" id="deliveryDate" name="deliveryDate" required>
            </div>
            <button type="submit" class="btn btn-primary">Add Delivery</button>
        </form>

        <!-- Back Button -->
        <div class="mt-4">
            <a href="dashboard" class="btn btn-secondary">Back to Dashboard</a>
        </div>
    </div>

    <!-- Bootstrap JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
