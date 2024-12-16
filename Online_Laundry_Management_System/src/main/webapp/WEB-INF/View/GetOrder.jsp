<%@page import="com.model.Order"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Laundry Service Booking</title>
    <link rel="icon" type="image/x-icon" href="https://img.icons8.com/?size=100&id=BIxuiAUWN2GM&format=png&color=000000">
    <link rel="stylesheet" href="styles.css">
     <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
        }

        h1 {
            text-align: center;
            color: #0039a6;
            margin-bottom: 20px;
            font-size: 2em;
        }

        form {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }

        .fieldset-container {
            display: flex;
            flex-direction: column;
            width: 48%;
        }

        fieldset {
            border: 1px solid #1da1f2;
            border-radius: 8px;
            padding: 15px;
            background: #e6f7ff;
        }

        legend {
            font-weight: bold;
            color: #0039a6;
            font-size: 1.2em;
        }

        label {
            display: block;
            margin-bottom: 10px;
        }

        input[type="checkbox"],
        input[type="radio"] {
            margin-right: 10px;
        }

        input[type="datetime-local"],
        textarea {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #1da1f2;
            border-radius: 4px;
        }

        button {
            background-color: #1da1f2;
            color: #fff;
            border: none;
            padding: 12px 25px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
            width: 100%;
        }

        button:hover {
            background-color: #0039a6;
        }

        .error {
            color: red;
            font-size: 0.9em;
            margin-top: 5px;
        }
    </style>
</head>
<body>
	<%Order order = (Order) request.getAttribute("order");%>
	
    <div class="container">
        <h1>Laundry Service Booking</h1>
        <form id="laundryForm" method="POST" action="UpdateOrder" >
            <fieldset>
                <legend>Select Services</legend>
                <label>
                    <input type="checkbox" name="service" value="wash" <%= (order != null && order.getServices().equals("wash")) ? "checked" : "" %>>
                    Washing
                </label>
                <label>
                    <input type="checkbox" name="service" value="drycleaning"<%= (order != null && order.getServices().equals("drycleaning")) ? "checked" : "" %>>
                    Dry Cleaning
                </label>
                <label>
                    <input type="checkbox" name="service" value="ironing"<%= (order != null && order.getServices().equals("ironing")) ? "checked" : "" %>>
                    Ironing
                </label>
            </fieldset>

            <fieldset>
                <legend>Stain Removal (Optional)</legend>
                <label>
                    <input type="checkbox" name="stain_removal" value="yes"<%= (order != null && order.getStainRemoval().equals("yes")) ? "checked" : "" %>>
                    Yes
                </label>
            </fieldset>

            <fieldset>
                <legend>Clothes Collection</legend>
                <label>
                    <input type="radio" name="collection" value="pickup" required <%= (order != null && order.getClothesCollection().equals("pickup")) ? "checked" : "" %>>
                    Pick Up
                </label>
                <label>
                    <input type="radio" name="collection" value="dropoff" <%= (order != null && order.getClothesCollection().equals("dropoff")) ? "checked" : "" %>>
                    Drop Off
                </label>
            </fieldset>

            <fieldset>
                <legend>Collection/Drop-Off Time</legend>
                <label for="collection_time">Select Time:</label>
                <input type="datetime-local" id="collection_time" name="collection_time"  value="<%=order.getCollectionDropOffTime()%>" required>
                <span class="error" id="collection_time_error"></span>
            </fieldset>

            <fieldset>
                <legend>Delivery Method</legend>
                <label>
                    <input type="radio" name="delivery" value="delivery" required <%= (order != null && order.getDeliveryMethod().equals("delivery")) ? "checked" : "" %>>
                    Delivery to House
                </label>
                <label>
                    <input type="radio" name="delivery" value="pickup" <%= (order != null && order.getDeliveryMethod().equals("pickup")) ? "checked" : "" %>>
                    Pick Up from Laundry
                </label>
            </fieldset>

            <fieldset>
                <legend>Delivery Time</legend>
                <label for="delivery_time">Select Time:</label>
                <input type="number" id="delivery_time" name="delivery_time" required value="<%= order.getDeliveryDuration()%>" >
                <span class="error" id="delivery_time_error"></span>
            </fieldset>

            <fieldset>
                <legend>Pick or Delivery Address</legend>
                <label for="address">Address:</label>
                <textarea id="address" name="address" required ><%=order.getDeliveryAddress()%></textarea>
                <span class="error" id="address_error"></span>
            </fieldset>

            <fieldset>
                <legend>Payment Options</legend>
                <label>
                    <input type="radio" name="payment" value="pay_at_counter" required <%= (order != null && order.getPaymentMethod().equals("pay_at_counter")) ? "checked" : "" %>>
                    Pay at Counter
                </label>
                <label>
                    <input type="radio" name="payment" value="cash_on_delivery" <%= (order != null && order.getPaymentMethod().equals("cash_on_delivery")) ? "checked" : "" %>>
                    Cash on Delivery
                </label>
                <label>
                    <input type="radio" name="payment" value="card_payment" <%= (order != null && order.getPaymentMethod().equals("card_payment")) ? "checked" : "" %>>
                    Card Payment
                </label>
            </fieldset>
            
            <fieldset>
                <legend>Additional Requierments</legend>
                <label for="requierments">Requierments:</label>
                <textarea id="requierments" name="requierments"><%=order.getAdditionalRequirements()%></textarea>
            </fieldset>
            <input type="hidden" name="orderId" value="<%= order != null ? order.getOrderId() : "" %>" />

			<button type="submit" class="update-button">Update Order</button>
        </form>
        
    </div>

    <script>
        document.getElementById('laundryForm').addEventListener('submit', function(event) {
            let valid = true;
            const collectionTime = document.getElementById('collection_time').value;
            const deliveryTime = document.getElementById('delivery_time').value;

            document.getElementById('collection_time_error').textContent = '';
            document.getElementById('delivery_time_error').textContent = '';

            if (!collectionTime) {
                document.getElementById('collection_time_error').textContent = 'Please select a collection/drop-off time.';
                valid = false;
            }

            if (!deliveryTime) {
                document.getElementById('deliv ery_time_error').textContent = 'Please select a delivery time.';
                valid = false;
            }

            if (!valid) {
                event.preventDefault();
            }
        });
    </script>
</body>
</html>
