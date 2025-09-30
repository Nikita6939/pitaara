<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pitaara Admin - Register</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    <!-- Google Fonts - Montserrat -->
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <!-- Custom Styles -->
    <link rel="stylesheet" href="styles.css">
    <!-- Auth Pages Specific Styles -->
    <style>
        body {
            background: linear-gradient(to right, #FDE1D3, #E5DEFF);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px 0;
        }
        .auth-card {
            max-width: 550px;
            width: 100%;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            margin: 30px auto;
        }
        .auth-header {
            background-color: #3f2b97;
            padding: 30px 20px;
            text-align: center;
            color: white;
        }
        .auth-body {
            padding: 30px;
            background-color: white;
        }
        .auth-footer {
            text-align: center;
            padding: 15px;
            background-color: #f8f9fa;
            border-top: 1px solid #eee;
        }
        .logo {
            font-size: 2rem;
            font-weight: 700;
            margin-bottom: 10px;
            display: block;
        }
        .input-group-text {
            background-color: transparent;
        }
        .form-control:focus {
            border-color: #9B87F5;
            box-shadow: 0 0 0 0.25rem rgba(155, 135, 245, 0.25);
        }
        .is-invalid {
            border-color: #dc3545 !important;
        }
        .invalid-feedback {
            display: none;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="auth-card mx-auto">
        <%String register=(String)session.getAttribute("register-success");
        
        if(register!=null){
        %>
        
        <div class="alert alert-success" role="alert">
  <%=register %>
</div>
<%}session.removeAttribute("register-success"); %>
<%String emailexist=(String)session.getAttribute("email-exist");
        
        if(emailexist!=null){
        %>
        
        <div class="alert alert-danger" role="alert">
  <%=emailexist %>
</div>
<%}session.removeAttribute("email-exist"); %>

<%String passwordmatch=(String)session.getAttribute("password-match");
        
        if(passwordmatch!=null){
        %>
        
        <div class="alert alert-danger" role="alert">
  <%=passwordmatch %>
</div>
<%}session.removeAttribute("password-match"); %>
            <div class="auth-header">
                <span class="logo">Pitaara</span>
                <h4>Admin Registration</h4>
                <p class="mb-0">Create a new admin account</p>
            </div>
            <div class="auth-body">
                <form id="register" method="post" class="needs-validation" novalidate>
                    <div class="row">
                        <div class="col-md-6 mb-4">
                            <label for="firstname" class="form-label">First Name</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="bi bi-person"></i></span>
                                <input type="text" class="form-control" id="firstname" name="firstName" placeholder="Enter first name" required>
                                <div class="invalid-feedback">
                                    First name is required
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 mb-4">
                            <label for="lastname" class="form-label">Last Name</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="bi bi-person"></i></span>
                                <input type="text" class="form-control" id="lastname" name="lastName" placeholder="Enter last name" required>
                                <div class="invalid-feedback">
                                    Last name is required
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="mb-4">
                        <label for="username" class="form-label">Username</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="bi bi-at"></i></span>
                            <input type="text" class="form-control" id="username" name="userName" placeholder="Choose a username" required>
                            <div class="invalid-feedback">
                                Username is required (alphanumeric, 3-20 characters)
                            </div>
                        </div>
                    </div>
                    
                    <div class="mb-4">
                        <label for="mobile" class="form-label">Mobile Number</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="bi bi-phone"></i></span>
                            <input type="tel" class="form-control" id="mobile" name="mobileNo" placeholder="Enter mobile number" required>
                            <div class="invalid-feedback">
                                Enter a valid mobile number (10 digits)
                            </div>
                        </div>
                    </div>
                    
                    <div class="mb-4">
                        <label for="email" class="form-label">Email Address</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="bi bi-envelope"></i></span>
                            <input type="email" class="form-control" id="email" name="email" placeholder="Enter email address" required>
                            <div class="invalid-feedback">
                                Enter a valid email address
                            </div>
                        </div>
                    </div>
                    
                    <div class="mb-4">
                        <label for="password" class="form-label">Password</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="bi bi-lock"></i></span>
                            <input type="password" class="form-control" id="password" name="password" placeholder="Create a password" required>
                            <span class="input-group-text password-toggle" style="cursor: pointer;">
                                <i class="bi bi-eye-slash"></i>
                            </span>
                            <div class="invalid-feedback">
                                Password must be at least 8 characters with a number and special character
                            </div>
                        </div>
                    </div>
                    
                    <div class="mb-4">
                        <label for="confirmPassword" class="form-label">Confirm Password</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="bi bi-lock"></i></span>
                            <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" placeholder="Confirm your password" required>
                            <div class="invalid-feedback">
                                Passwords do not match
                            </div>
                        </div>
                    </div>
                    
                    <div class="mb-4 form-check">
                        <input type="checkbox" class="form-check-input" id="termsCheck" required>
                        <label class="form-check-label" for="termsCheck">I agree to the <a href="#" class="text-purple" style="color:#3f2b97">Terms of Service</a> and <a href="#" class="text-purple" style="color:#3f2b97">Privacy Policy</a></label>
                        <div class="invalid-feedback">
                            You must agree to the terms to proceed
                        </div>
                    </div>
                    
                    <div class="d-grid gap-2">
                        <button type="submit" class="btn btn-purple">Register</button>
                    </div>
                </form>
            </div>
            <div class="auth-footer">
                <p class="mb-0">Already have an account? <a href="login" class="text-purple" style="color:#3f2b97">Login</a></p>
            </div>
        </div>
    </div>

    <!-- Bootstrap 5 JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Custom Script -->
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Password toggle functionality
            const passwordToggles = document.querySelectorAll('.password-toggle');
            
            passwordToggles.forEach(toggle => {
                toggle.addEventListener('click', function() {
                    const passwordInput = this.previousElementSibling;
                    const icon = this.querySelector('i');
                    
                    if (passwordInput.type === 'password') {
                        passwordInput.type = 'text';
                        icon.classList.remove('bi-eye-slash');
                        icon.classList.add('bi-eye');
                    } else {
                        passwordInput.type = 'password';
                        icon.classList.remove('bi-eye');
                        icon.classList.add('bi-eye-slash');
                    }
                });
            });
            
            // Form validation
            const registrationForm = document.getElementById('registrationForm');
            
            registrationForm.addEventListener('submit', function(event) {
                event.preventDefault();
                
                let isValid = true;
                
                // Reset validation
                this.classList.remove('was-validated');
                
                // Validate First Name
                const firstName = document.getElementById('firstname').value.trim();
                if (firstName === '') {
                    document.getElementById('firstname').classList.add('is-invalid');
                    document.getElementById('firstname').nextElementSibling.style.display = 'block';
                    isValid = false;
                } else {
                    document.getElementById('firstname').classList.remove('is-invalid');
                    document.getElementById('firstname').nextElementSibling.style.display = 'none';
                }
                
                // Validate Last Name
                const lastName = document.getElementById('lastname').value.trim();
                if (lastName === '') {
                    document.getElementById('lastname').classList.add('is-invalid');
                    document.getElementById('lastname').nextElementSibling.style.display = 'block';
                    isValid = false;
                } else {
                    document.getElementById('lastname').classList.remove('is-invalid');
                    document.getElementById('lastname').nextElementSibling.style.display = 'none';
                }
                
                // Validate Username
                const username = document.getElementById('username').value.trim();
                const usernameRegex = /^[a-zA-Z0-9]{3,20}$/;
                if (!usernameRegex.test(username)) {
                    document.getElementById('username').classList.add('is-invalid');
                    document.getElementById('username').nextElementSibling.style.display = 'block';
                    isValid = false;
                } else {
                    document.getElementById('username').classList.remove('is-invalid');
                    document.getElementById('username').nextElementSibling.style.display = 'none';
                }
                
                // Validate Mobile
                const mobile = document.getElementById('mobile').value.trim();
                const mobileRegex = /^[0-9]{10}$/;
                if (!mobileRegex.test(mobile)) {
                    document.getElementById('mobile').classList.add('is-invalid');
                    document.getElementById('mobile').nextElementSibling.style.display = 'block';
                    isValid = false;
                } else {
                    document.getElementById('mobile').classList.remove('is-invalid');
                    document.getElementById('mobile').nextElementSibling.style.display = 'none';
                }
                
                // Validate Email
                const email = document.getElementById('email').value.trim();
                const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                if (!emailRegex.test(email)) {
                    document.getElementById('email').classList.add('is-invalid');
                    document.getElementById('email').nextElementSibling.style.display = 'block';
                    isValid = false;
                } else {
                    document.getElementById('email').classList.remove('is-invalid');
                    document.getElementById('email').nextElementSibling.style.display = 'none';
                }
                
                // Validate Password
                const password = document.getElementById('password').value.trim();
                const passwordRegex = /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,}$/;
                if (!passwordRegex.test(password)) {
                    document.getElementById('password').classList.add('is-invalid');
                    document.getElementById('password').nextElementSibling.nextElementSibling.style.display = 'block';
                    isValid = false;
                } else {
                    document.getElementById('password').classList.remove('is-invalid');
                    document.getElementById('password').nextElementSibling.nextElementSibling.style.display = 'none';
                }
                
                // Validate Confirm Password
                const confirmPassword = document.getElementById('confirmPassword').value.trim();
                if (confirmPassword !== password) {
                    document.getElementById('confirmPassword').classList.add('is-invalid');
                    document.getElementById('confirmPassword').nextElementSibling.style.display = 'block';
                    isValid = false;
                } else {
                    document.getElementById('confirmPassword').classList.remove('is-invalid');
                    document.getElementById('confirmPassword').nextElementSibling.style.display = 'none';
                }
                
                // Validate Terms Check
                if (!document.getElementById('termsCheck').checked) {
                    document.getElementById('termsCheck').classList.add('is-invalid');
                    document.getElementById('termsCheck').nextElementSibling.nextElementSibling.style.display = 'block';
                    isValid = false;
                } else {
                    document.getElementById('termsCheck').classList.remove('is-invalid');
                    document.getElementById('termsCheck').nextElementSibling.nextElementSibling.style.display = 'none';
                }
                
                // If all validations pass
                if (isValid) {
                    this.classList.add('was-validated');
                    
                    // For demo purposes, redirect to login page
                    alert('Registration successful! Redirecting to login page...');
                    window.location.href = 'login.html';
                }
            });
        });
    </script>
</body>
</html>
