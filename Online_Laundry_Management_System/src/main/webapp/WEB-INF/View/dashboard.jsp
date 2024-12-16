<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delivery Manager Dashboard</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
    <style>
        .alert-dismissible .btn-close {
            margin-top: 0.5rem;
        }
        .responsive-table {
            overflow-x: auto;
        }
    </style>
</head>
<body>
   <div class="container my-4">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h1>Delivery Manager Dashboard</h1>

            <div>
                <!-- Username Button -->
                <a href="updateUser" class="btn btn-info">
    <i class="bi bi-person-circle"></i> 
    <c:out value="${sessionScope.user.username}" /> <!-- Display logged-in username -->
</a>

                <!-- Logout Button -->
                <form action="logout" method="post" class="logout-button d-inline">
                    <button type="submit" class="btn btn-danger" aria-label="Logout">Logout</button>
                </form>
            </div>
        </div>

        <!-- Success/Error Messages -->
        <c:if test="${param.success == 'deliveries_added'}">
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                Deliveries (pickup and drop-off) successfully added.
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        </c:if>
        <c:if test="${param.error == 'database_error'}">
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                Database error. Please try again later.
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        </c:if>

        <!-- Orders Table -->
        <div class="responsive-table">
            <h2>Orders</h2>
            <table class="table table-bordered table-responsive">
                <thead>
                    <tr>
                        <th>Order ID</th>
                        <th>Customer Name</th>
                        <th>Order Address</th>
                        <th>Status</th>
                        <th>Date</th>
                        <th>Manage Deliveries</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="order" items="${orders}">
                        <tr>
                            <td>${order.id}</td>
                            <td>${order.customerName}</td>
                            <td>${order.orderAddress}</td>
                            <td>${order.status}</td>
                            <td>${order.orderDate}</td>
                            <td>
                                <!-- Add Deliveries Button -->
                                <a href="manageDeliveries?orderId=${order.id}" class="btn btn-primary">Manage Deliveries</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Bootstrap JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
