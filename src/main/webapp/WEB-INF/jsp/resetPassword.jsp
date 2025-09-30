<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pitaara Admin - Login</title>
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
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .auth-card {
            max-width: 450px;
            width: 100%;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
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
            <div class="auth-header">
                <span class="logo">Pitaara</span>
                <h4>Admin Login</h4>
                <p class="mb-0">Sign in to manage your artist directory</p>
            </div>
            <div class="auth-body">
                <form action="resetPassword" method="post"class="needs-validation" novalidate>
                    <div class="mb-4">
                        <label for="username" class="form-label">New Password</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="bi bi-person"></i></span>
                            <input type="text" class="form-control" id="username" name="password" placeholder="Enter your username" required>
                            <div class="invalid-feedback">
                                Username is required
                            </div>
                        </div>
                    </div>
                    <div class="mb-4">
                        <label for="password" class="form-label">Confirm Password</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="bi bi-lock"></i></span>
                            <input type="password" class="form-control" id="password" name="confirmPassword" placeholder="Enter your password" required>
                            <span class="input-group-text password-toggle" style="cursor: pointer;">
                                <i class="bi bi-eye-slash"></i>
                            </span>
                            <div class="invalid-feedback">
                                Password is required
                            </div>
                        </div>
                    </div>
                    <div class="mb-4 form-check">
                        <input type="checkbox" class="form-check-input" id="rememberMe">
                        <label class="form-check-label" for="rememberMe">Remember me</label>
                    </div>
                    <div class="d-grid gap-2">
                        <button type="submit" class="btn btn-purple">Reset Password</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Bootstrap 5 JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Custom Script -->
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Password toggle functionality
            document.querySelector('.password-toggle').addEventListener('click', function() {
                const passwordInput = document.getElementById('password');
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
            
            // Form validation
            const loginForm = document.getElementById('loginForm');
            
            loginForm.addEventListener('submit', function(event) {
                event.preventDefault();
                
                // Reset validation
                this.classList.remove('was-validated');
                
                // Get form values
                const username = document.getElementById('username').value.trim();
                const password = document.getElementById('password').value.trim();
                
                // Username validation
                if (username === '') {
                    document.getElementById('username').classList.add('is-invalid');
                    document.getElementById('username').nextElementSibling.style.display = 'block';
                    return false;
                } else {
                    document.getElementById('username').classList.remove('is-invalid');
                    document.getElementById('username').nextElementSibling.style.display = 'none';
                }
                
                // Password validation
                if (password === '') {
                    document.getElementById('password').classList.add('is-invalid');
                    document.getElementById('password').nextElementSibling.nextElementSibling.style.display = 'block';
                    return false;
                } else {
                    document.getElementById('password').classList.remove('is-invalid');
                    document.getElementById('password').nextElementSibling.nextElementSibling.style.display = 'none';
                }
                
                // If all validations pass
                this.classList.add('was-validated');
                
                // For demo purposes, redirect to admin dashboard
                alert('Login successful! Redirecting to dashboard...');
                window.location.href = 'index.html';
            });
        });
    </script>
</body>
</html>