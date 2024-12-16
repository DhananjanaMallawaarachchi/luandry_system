<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Deliveries</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
    <style>
        .alert-dismissible .btn-close {
            margin-top: 0.5rem;
        }
    </style>
</head>
<body>
    <div class="container my-4">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h1>Manage Deliveries for Order ID ${order.id}</h1>
            <!-- Back to Dashboard Button -->
            <a href="dashboard" class="btn btn-secondary">Back to Dashboard</a>
        </div>

        <!-- Success/Error Messages -->
        <c:if test="${param.success == 'delivery_deleted'}">
    <div class="alert alert-success alert-dismissible fade show" role="alert">
        Delivery successfully deleted.
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
</c:if>
<c:if test="${param.error == 'delete_failed'}">
    <div class="alert alert-danger alert-dismissible fade show" role="alert">
        Failed to delete delivery. Please try again.
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
</c:if>
<c:if test="${param.success == 'status_updated'}">
    <div class="alert alert-success alert-dismissible fade show" role="alert">
        Delivery status updated successfully.
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
</c:if>
<c:if test="${param.error == 'update_failed'}">
    <div class="alert alert-danger alert-dismissible fade show" role="alert">
        Failed to update delivery status. Please try again.
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
</c:if>

        <!-- Existing Deliveries Table -->
        <div class="responsive-table mb-4">
            <h2>Existing Deliveries</h2>
            <table class="table table-bordered table-striped">
                <thead class="table-dark">
                    <tr>
                        <th>Delivery ID</th>
                        <th>Order ID</th>
                        <th>Delivery Type</th>
                        <th>Driver ID</th>
                        <th>Delivery Status</th>
                        <th>Actions</th> <!-- New Actions Column -->
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="delivery" items="${deliveries}">
                        <tr>
                            <td>${delivery.id}</td>
                            <td>${delivery.orderId}</td>
                            <td>${delivery.deliveryType}</td>
                            <td>${delivery.driverId}</td>
                            <td>
                                <!-- Status Update Form -->
<form action="updateDeliveryStatus" method="post">
    <!-- Hidden fields for delivery ID and order ID -->
    <input type="hidden" name="deliveryId" value="${delivery.id}">
    <input type="hidden" name="orderId" value="${order.id}">

    <!-- Delivery Status dropdown -->
    <select name="deliveryStatus" class="form-select" onchange="this.form.submit()">
        <option value="Pending" ${delivery.deliveryStatus == 'Pending' ? 'selected' : ''}>Pending</option>
        <option value="Assigned" ${delivery.deliveryStatus == 'Assigned' ? 'selected' : ''}>Assigned</option>
        <option value="In Progress" ${delivery.deliveryStatus == 'In Progress' ? 'selected' : ''}>In Progress</option>
        <option value="Out for Delivery" ${delivery.deliveryStatus == 'Out for Delivery' ? 'selected' : ''}>Out for Delivery</option>
        <option value="Delivered" ${delivery.deliveryStatus == 'Delivered' ? 'selected' : ''}>Delivered</option>
        <option value="Delayed" ${delivery.deliveryStatus == 'Delayed' ? 'selected' : ''}>Delayed</option>
        <option value="Completed" ${delivery.deliveryStatus == 'Completed' ? 'selected' : ''}>Completed</option>
        <option value="Cancelled" ${delivery.deliveryStatus == 'Cancelled' ? 'selected' : ''}>Cancelled</option>
        <option value="Returned" ${delivery.deliveryStatus == 'Returned' ? 'selected' : ''}>Returned</option>
    </select>
</form>

                            </td>
                            <td>
                                <!-- Delete Button Form -->
                                <form action="deleteDelivery" method="post" onsubmit="return confirm('Are you sure you want to delete this delivery?');">
                                    <input type="hidden" name="deliveryId" value="${delivery.id}">
                                    <input type="hidden" name="orderId" value="${order.id}">
                                    <button type="submit" class="btn btn-danger">Delete</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <!-- Assign Drivers Form -->
        <div class="row">
            <div class="col-md-6">
                <h3>Pickup Delivery</h3>
                <!-- Pickup Delivery Form -->
                <form action="assignDriver" method="post">
                    <input type="hidden" name="orderId" value="${order.id}">
                    <input type="hidden" name="deliveryId" value="${delivery.id}">
                    <input type="hidden" name="deliveryType" value="pickup">
                    <input type="hidden" name="deliveryAddress" value="${order.orderAddress}">
                    <div class="mb-3">
                        <label for="pickupDriver" class="form-label">Assign Driver</label>
                        <select id="pickupDriver" name="driverId" class="form-select" required>
                            <option value="">Select Driver</option>
                            <c:forEach var="driver" items="${drivers}">
                                <option value="${driver.id}">${driver.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary w-100">Assign Pickup Driver</button>
                </form>
            </div>
            <div class="col-md-6">
                <h3>Drop-off Delivery</h3>
                <!-- Dropoff Delivery Form -->
                <form action="assignDriver" method="post">
                    <input type="hidden" name="orderId" value="${order.id}">
                    <input type="hidden" name="deliveryId" value="${delivery.id}">
                    <input type="hidden" name="deliveryType" value="dropoff">
                    <input type="hidden" name="deliveryAddress" value="${order.orderAddress}">
                    <div class="mb-3">
                        <label for="dropoffDriver" class="form-label">Assign Driver</label>
                        <select id="dropoffDriver" name="driverId" class="form-select" required>
                            <option value="">Select Driver</option>
                            <c:forEach var="driver" items="${drivers}">
                                <option value="${driver.id}">${driver.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary w-100">Assign Drop-off Driver</button>
                </form>
            </div>
        </div>
    </div>

    <!-- Bootstrap JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
