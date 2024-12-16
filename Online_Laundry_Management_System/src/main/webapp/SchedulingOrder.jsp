<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	Object userName = session.getAttribute("username");
	if(userName == null){
		response.sendRedirect("Login.jsp");
	}	
	System.out.print("debug point");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Laundry Service Booking</title>
    <link rel="icon" type="image/x-icon" href="https://img.icons8.com/?size=100&id=BIxuiAUWN2GM&format=png&color=000000">
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
	<jsp:include page="/WEB-INF/View/Header.jsp"></jsp:include>
    <div class="container">
        <h1>Laundry Service Booking</h1>
        <form id="laundryForm" action="AddOrder" method="POST">
            <div class="fieldset-container">
                <fieldset>
                    <legend>Select Services</legend>
                    <label><input type="checkbox" name="service" value="wash"> Washing</label>
                    <label><input type="checkbox" name="service" value="drycleaning"> Dry Cleaning</label>
                    <label><input type="checkbox" name="service" value="ironing"> Ironing</label>
                </fieldset>

                <fieldset>
                    <legend>Stain Removal (Optional)</legend>
                    <label><input type="checkbox" name="stain_removal" value="yes"> Yes</label>
                </fieldset>

                <fieldset>
                    <legend>Clothes Collection</legend>
                    <label><input type="radio" name="collection" value="pickup" required> Pick Up</label>
                    <label><input type="radio" name="collection" value="dropoff"> Drop Off</label>
                </fieldset>

                <fieldset>
                    <legend>Collection/Drop-Off Time</legend>
                    <label for="collection_time">Select Time:</label>
                    <input type="datetime-local" id="collection_time" name="collection_time" required>
                    <span class="error" id="collection_time_error"></span>
                </fieldset>
            </div>

            <div class="fieldset-container">
                <fieldset>
                    <legend>Delivery Method</legend>
                    <label><input type="radio" name="delivery" value="delivery" required> Delivery to House</label>
                    <label><input type="radio" name="delivery" value="pickup"> Pick Up from Laundry</label>
                </fieldset>

                <fieldset>
                    <legend>Delivery Time</legend>
                    <label for="delivery_time">Select Time:</label>
                    <input type="number" id="delivery_time" name="delivery_time" required>
                    <span class="error" id="delivery_time_error"></span>
                </fieldset>

                <fieldset>
                    <legend>Pick or Delivery Address</legend>
                    <label for="address">Address:</label>
                    <textarea id="address" name="address" required></textarea>
                    <span class="error" id="address_error"></span>
                </fieldset>

                <fieldset>
                    <legend>Payment Options</legend>
                    <label><input type="radio" name="payment" value="pay_at_counter" required> Pay at Counter</label>
                    <label><input type="radio" name="payment" value="cash_on_delivery"> Cash on Delivery</label>
                    <label><input type="radio" name="payment" value="card_payment"> Card Payment</label>
                </fieldset>
            </div>

            <fieldset style="width: 100%;">
                <legend>Additional Requirements</legend>
                <label for="requirements">Requirements:</label>
                <textarea id="requirements" name="requirements"></textarea>
            </fieldset>
            
            <button type="submit">Submit Order</button>
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
                document.getElementById('delivery_time_error').textContent = 'Please select a delivery time.';
                valid = false;
            }

            if (!valid) {
                event.preventDefault(); // Prevent form submission
            }
        });
    </script>
    	<jsp:include page="/WEB-INF/View/Footer.jsp"></jsp:include>
</body>
</html>
