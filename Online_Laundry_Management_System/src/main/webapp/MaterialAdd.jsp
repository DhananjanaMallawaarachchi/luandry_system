<html>
<head>
    <title>Add Material</title>
    <link rel="stylesheet" type="text/css" href="css/MaterialAdd.css">
</head>
<body>

    <div class="container">
        <div class="form">
            <h1 class="title">Add Material</h1>
            <form action="MaterialAddServlet" method="post">
                <div class="input-container">
                    <label for="name">Name:</label>
                    <input type="text" id="name" name="name" required>
                </div>
                <div class="input-container">
                    <label for="quantity">Quantity:</label>
                    <input type="number" id="quantity" name="quantity" required>
                </div>
                <div class="input-container">
                    <label for="unit">Unit:</label>
                    <input type="text" id="unit" name="unit">
                </div>
                <div class="input-container">
                    <label for="description">Description:</label>
                    <input type="text" id="description" name="description">
                </div>
                <div class="input-container">
                    <label for="expiryDate">Expiry-Date:</label>
                    <input type="date" id="expiryDate" name="expiryDate">
                </div>
                <div class="input-container">
                    <label for="supplier">Supplier:</label>
                    <input type="text" id="supplier" name="supplier">
                </div>
                <input type="submit" name="save" value="Save">
                <a href="MaterialList.jsp"><button type="button">Cancel</button></a>
            </form>
        </div>
    </div>

</body>
</html>

