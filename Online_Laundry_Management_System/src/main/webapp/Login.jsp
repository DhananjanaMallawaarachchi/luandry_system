<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login/Registration Form</title>
    <link rel="icon" type="image/x-icon" href="https://img.icons8.com/?size=100&id=BIxuiAUWN2GM&format=png&color=000000">
    <link href="css/Login.css" rel="stylesheet">
</head>
<body>
	
    <div class="container" id="container">
        <div class="form-container sign-up-container">
            <form action="CreateAccountServlet" method="POST" onsubmit="return validateSignUpForm()">
                <h1>Create Account</h1>
               
                <span>or use your email for registration</span>
                <input type="text" name="name" placeholder="Name" id="signUpName" />
                <input type="email" name="email" placeholder="Email" id="signUpEmail" />
                <input type="tel" name="phoneNumber" placeholder="Phone Number" id="signUpNumber" />
                <input type="text" name="address" placeholder="Address" id="signUpAddress" />
                <input type="password" name="password" placeholder="Password" id="signUpPassword" />
                <input type="password" placeholder="Confirm Password" id="signUpConfirmPassword" />
                
                <button>Sign Up</button>
            </form>
        </div>
        <div class="form-container sign-in-container">
            <form action="LoginServlet" method="POST" onsubmit="return validateSignInForm()">
                <h1>Sign in</h1>
            
                <span>or use your account</span>
                <input type="text" name="username" placeholder="Username" id="signInUserName"/>
                <input type="password" name="password" placeholder="Password" id="signInPassword" />
                <a href="#">Forgot your password?</a>
                <button>Sign In</button>
            </form>
        </div>
        <div class="overlay-container">
            <div class="overlay">
                <div class="overlay-panel overlay-left">
                    <h1>Welcome Back!</h1>
                    <p>To keep connected with us please login with your personal info</p>
                    <button class="ghost" id="signIn">Sign In</button>
                </div>
                <div class="overlay-panel overlay-right">
                    <h1>Hello, Friend!</h1>
                    <p>Enter your personal details and start journey with us</p>
                    <button class="ghost" id="signUp">Sign Up</button>
                </div>
            </div>
        </div>
    </div>

<script>
		document.addEventListener('DOMContentLoaded', function() {
		    const signUpButton = document.getElementById('signUp');
		    const signInButton = document.getElementById('signIn');
		    const container = document.getElementById('container');
		
		    signUpButton.addEventListener('click', () => {
		        console.log("Sign up button clicked");
		        container.classList.add("right-panel-active");
		    });
		
		    signInButton.addEventListener('click', () => {
		        console.log("Sign in button clicked");
		        container.classList.remove("right-panel-active");
		    });
		});
		document.getElementById('container').classList.add('right-panel-active');

        function validateSignUpForm() {
            const name = document.getElementById('signUpName').value;
            const email = document.getElementById('signUpEmail').value;
            const phoneNumber = document.getElementById('signUpNumber').value;
            const address = document.getElementById('signUpAddress').value;
            const password = document.getElementById('signUpPassword').value;
            const confirmPassword = document.getElementById('signUpConfirmPassword').value;
            
            if (name === "") {
                alert("Name must be filled out");
                return false;
            }

            if (email === "") {
                alert("Email must be filled out");
                return false;
            }
            
            if (address === "") {
                alert("Address must be filled out");
                return false;
            }
            
            if (password.length < 6) {
                alert("Password must be at least 6 characters long");
                return false;
            }

            if (password !== confirmPassword) {
                alert("Passwords do not match");
                return false;
            }

            return true;
        }

        function validateSignInForm() {
            const username = document.getElementById('signInUserName').value;
            const password = document.getElementById('signInPassword').value;

            if (username === "") {
                alert("Email must be filled out");
                return false;
            }

            if (password === "") {
                alert("Password must be filled out");
                return false;
            }

            return true;
        }
</script> 
</body>
</html>
