<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 6/16/2025
  Time: 3:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="author" content="Tharu Senevirathne">
    <meta name="keywords" content="html, css,bootstrap, javascript,java,javaee,servlet,jsp,dbcp,tomcat,intelijIDEA, pos web, complain management system, web development, software engineering, computer science">
    <meta name="description" content="This website is a Complain Management system Web Application designed to manage complains efficiently.">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SignUp - Complaint Management System</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

    <style>
        :root {
            --primary: #f44848;
            --primary-dark: #ea1212;
            --secondary: #f1f5f9;
            --dark: #01060f;
            --light: #ffffff;
            --gray: #64748b;
            --success: #10b981;
            --danger: #ef4444;
            --warning: #f59e0b;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: #ffffff;
            color: var(--light);
            overflow-x: hidden;
            min-height: 100vh;
        }

        .container-fluid {
            height: auto;
            min-height: 70vh;
            max-width: 1000px;
            padding: 20px 10px;
            display: flex;
            align-items: center;
            margin: 0 auto;
        }

        .signup-wrapper {
            display: grid;
            grid-template-columns: 1fr 1.4fr;
            max-width: 1000px;
            width: 100%;
            margin: 0 auto;
            background: var(--primary);
            border-radius: 16px;
            overflow: hidden;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.1);
        }

        .left-panel {
            background: linear-gradient(135deg, var(--primary) 0%, var(--primary-dark) 100%);
            padding: 40px 30px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            position: relative;
            overflow: hidden;
        }

        .left-panel::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><circle cx="50" cy="50" r="2" fill="rgba(255,255,255,0.1)"/></svg>') repeat;
            background-size: 30px 30px;
            animation: backgroundMove 20s linear infinite;
        }

        @keyframes backgroundMove {
            0% { transform: translate(0, 0); }
            100% { transform: translate(30px, 30px); }
        }

        .brand-logo {
            width: 100px;
            height: 100px;
            background: rgba(255, 255, 255, 0.2);
            border-radius: 24px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 20px;
            border: 2px solid rgba(255, 255, 255, 0.3);
            backdrop-filter: blur(10px);
            z-index: 1;
        }

        .brand-logo i {
            font-size: 40px;
            color: var(--light);
        }

        .brand-title {
            font-size: 2.2rem;
            font-weight: 700;
            margin-bottom: 10px;
            color: var(--light);
            z-index: 1;
        }

        .brand-subtitle {
            font-size: 1rem;
            color: rgba(255, 255, 255, 0.8);
            margin-bottom: 30px;
            z-index: 1;
        }

        .features-list {
            list-style: none;
            text-align: left;
            z-index: 1;
        }

        .features-list li {
            padding: 8px 0;
            color: rgba(255, 255, 255, 0.9);
            display: flex;
            align-items: center;
            font-size: 0.95rem;
        }

        .features-list i {
            margin-right: 12px;
            color: rgba(255, 255, 255, 0.7);
        }

        .right-panel {
            padding: 30px 35px;
            background: var(--light);
            color: var(--dark);
            display: flex;
            flex-direction: column;
            justify-content: flex-start;
            max-height: 100vh;
            overflow-y: auto;
        }

        .signup-header {
            text-align: center;
            margin-bottom: 20px;
        }

        .signup-title {
            font-size: 1.8rem;
            font-weight: 600;
            color: var(--dark);
            margin-bottom: 8px;
        }

        .signup-subtitle {
            color: var(--gray);
            font-size: 0.95rem;
        }

        .profile-upload {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-bottom: 20px;
        }

        .profile-preview {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            border: 3px solid var(--primary);
            display: flex;
            align-items: center;
            justify-content: center;
            background: var(--secondary);
            margin-bottom: 10px;
            overflow: hidden;
            cursor: pointer;
            transition: all 0.3s ease;
            position: relative;
        }

        .profile-preview:hover {
            transform: scale(1.05);
            border-color: var(--primary-dark);
        }

        .profile-preview img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            border-radius: 50%;
        }

        .profile-preview i {
            font-size: 30px;
            color: var(--gray);
        }

        .profile-upload-btn {
            background: transparent;
            color: var(--primary);
            border: 2px solid var(--primary);
            padding: 6px 16px;
            border-radius: 20px;
            font-size: 0.8rem;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .profile-upload-btn:hover {
            background: var(--primary);
            color: var(--light);
        }

        .file-input {
            display: none;
        }

        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 15px;
            margin-bottom: 15px;
        }

        .input-group {
            margin-bottom: 15px;
            position: relative;
            width: 100%;
        }

        .input-label {
            display: block;
            margin-bottom: 5px;
            font-weight: 500;
            color: var(--dark);
            font-size: 0.85rem;
        }

        .input-wrapper {
            position: relative;
            width: 100%;
        }

        .input-field, .select-field {
            width: 100%;
            padding: 12px 15px 12px 45px;
            border: 2px solid #e2e8f0;
            border-radius: 10px;
            font-size: 0.9rem;
            transition: all 0.3s ease;
            background: var(--light);
            box-sizing: border-box;
            height: 48px;
            display: block;
        }

        .input-field:focus, .select-field:focus {
            outline: none;
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(244, 72, 72, 0.1);
        }

        .input-icon {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: var(--gray);
            font-size: 14px;
            z-index: 2;
        }

        .select-field {
            cursor: pointer;
            appearance: none;
            background-image: url('data:image/svg+xml;charset=US-ASCII,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 4 5"><path fill="%23666" d="M2 0L0 2h4L2 0zM2 5L0 3h4L2 5z"/></svg>');
            background-repeat: no-repeat;
            background-position: right 15px center;
            background-size: 12px;
        }

        .role-tabs {
            display: flex;
            margin-bottom: 15px;
            background: var(--secondary);
            border-radius: 10px;
            padding: 4px;
        }

        .role-tab {
            flex: 1;
            background: transparent;
            border: none;
            padding: 8px 15px;
            border-radius: 7px;
            font-weight: 500;
            color: var(--gray);
            cursor: pointer;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 5px;
            font-size: 0.85rem;
        }

        .role-tab.active {
            background: var(--primary);
            color: var(--light);
            box-shadow: 0 2px 8px rgba(244, 72, 72, 0.3);
        }

        .password-strength {
            margin-top: 8px;
            font-size: 0.8rem;
        }

        .strength-indicator {
            height: 3px;
            background: #e2e8f0;
            border-radius: 2px;
            margin: 5px 0;
            overflow: hidden;
        }

        .strength-bar {
            height: 100%;
            width: 0%;
            transition: all 0.3s ease;
            border-radius: 2px;
        }

        .strength-weak { background: var(--danger); width: 25%; }
        .strength-fair { background: var(--warning); width: 50%; }
        .strength-good { background: var(--success); width: 75%; }
        .strength-strong { background: var(--success); width: 100%; }

        .signup-btn {
            width: 100%;
            background: var(--primary);
            color: var(--light);
            border: none;
            padding: 12px;
            border-radius: 10px;
            font-size: 0.95rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
            margin-bottom: 10px;
        }

        .signup-btn:hover {
            background: var(--primary-dark);
            transform: translateY(-1px);
            box-shadow: 0 6px 20px rgba(244, 72, 72, 0.4);
        }

        .signup-btn:active {
            transform: translateY(0);
        }

        .login-btn {
            width: 100%;
            background: transparent;
            color: var(--primary);
            border: 2px solid var(--primary);
            padding: 12px;
            border-radius: 10px;
            font-size: 0.95rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            position: relative;
        }

        .login-btn:hover {
            background: var(--primary);
            color: var(--light);
            transform: translateY(-1px);
            box-shadow: 0 6px 20px rgba(244, 72, 72, 0.4);
        }

        .login-btn:active {
            transform: translateY(0);
        }

        .error-alert {
            background: #fef2f2;
            border: 1px solid #fecaca;
            color: var(--danger);
            padding: 10px 14px;
            border-radius: 8px;
            margin-bottom: 15px;
            display: none;
            font-size: 0.85rem;
        }

        .success-alert {
            background: #f0fdf4;
            border: 1px solid #bbf7d0;
            color: var(--success);
            padding: 10px 14px;
            border-radius: 8px;
            margin-bottom: 15px;
            display: none;
            font-size: 0.85rem;
        }

        .footer-info {
            text-align: center;
            margin-top: 15px;
            padding-top: 12px;
            border-top: 1px solid #e2e8f0;
            color: var(--gray);
            font-size: 0.8rem;
        }

        .terms-checkbox {
            display: flex;
            align-items: flex-start;
            margin-bottom: 15px;
            font-size: 0.85rem;
            gap: 8px;
        }

        .terms-checkbox input {
            margin-top: 2px;
            transform: scale(1.1);
        }

        .terms-checkbox label {
            line-height: 1.4;
        }

        .terms-checkbox a {
            color: var(--primary);
            text-decoration: none;
        }

        .terms-checkbox a:hover {
            text-decoration: underline;
        }

        /* Mobile responsive */
        @media (max-width: 768px) {
            .container-fluid {
                min-height: 100vh;
                padding: 10px;
            }

            .signup-wrapper {
                grid-template-columns: 1fr;
                margin: 0;
                max-width: 100%;
            }

            .left-panel {
                padding: 25px 20px;
            }

            .right-panel {
                padding: 25px 20px;
                max-height: none;
            }

            .brand-title {
                font-size: 1.8rem;
            }

            .brand-logo {
                width: 70px;
                height: 70px;
                margin-bottom: 15px;
            }

            .brand-logo i {
                font-size: 28px;
            }

            .profile-preview i {
                font-size: 25px;
            }
        }

        @media (max-width: 480px) {
            .container-fluid {
                padding: 5px;
            }

            .signup-wrapper {
                border-radius: 12px;
            }

            .left-panel {
                padding: 20px 15px;
            }

            .right-panel {
                padding: 20px 15px;
            }

            .brand-title {
                font-size: 1.6rem;
            }

            .signup-title {
                font-size: 1.5rem;
            }
        }

        @keyframes spin {
            to { transform: rotate(360deg); }
        }
    </style>

</head>
<body>

<div class="container-fluid">
    <div class="signup-wrapper">
        <div class="left-panel">
            <div class="brand-logo">
                <i class="fas fa-clipboard-list"></i>
            </div>
            <h1 class="brand-title">CMS Portal</h1>
            <p class="brand-subtitle">Complaint Management System</p>

            <ul class="features-list">
                <li><i class="fas fa-user-plus"></i> Easy account creation</li>
                <li><i class="fas fa-shield-alt"></i> Secure registration</li>
                <li><i class="fas fa-clock"></i> Quick verification</li>
                <li><i class="fas fa-check-circle"></i> 24/7 support</li>
            </ul>
        </div>

        <div class="right-panel">
            <div class="signup-header">
                <h2 class="signup-title">Create Account</h2>
                <p class="signup-subtitle">Join our complaint management system</p>
            </div>

            <div class="error-alert" id="errorMessage">
                Please fix the errors below.
            </div>

            <div class="success-alert" id="successMessage">
                Account created successfully!
            </div>

            <form id="signupForm" action="<%= request.getContextPath() %>/signup" method="post">

                <!-- Username -->
                <div class="input-group">
                    <label class="input-label" for="username">Username</label>
                    <div class="input-wrapper">
                        <i class="fas fa-at input-icon"></i>
                        <input type="text" class="input-field" id="username" name="username" placeholder="Choose a username" required>
                    </div>
                </div>



                <!-- Password -->
                <div class="input-group">
                    <label class="input-label" for="password">Password</label>
                    <div class="input-wrapper">
                        <i class="fas fa-lock input-icon"></i>
                        <input type="password" class="input-field" id="password" name="password" placeholder="Create a strong password" required>
                    </div>
                    <div class="password-strength">
                        <div class="strength-indicator">
                            <div class="strength-bar" id="strengthBar"></div>
                        </div>
                        <span id="strengthText">Password strength</span>
                    </div>
                </div>

                <!-- Confirm Password -->
                <div class="input-group">
                    <label class="input-label" for="confirmPassword">Confirm Password</label>
                    <div class="input-wrapper">
                        <i class="fas fa-lock input-icon"></i>
                        <input type="password" class="input-field" id="confirmPassword" name="confirmPassword" placeholder="Confirm your password" required>
                    </div>
                </div>

                <!-- select role-->
                <div class="input-group">
                    <label class="input-label" for="selectRole"> Select Role</label>
                    <div class="input-wrapper">
                        <select class="form-select" id="role" name="role" required>
                            <option value="">Select Role</option>
                            <option value="ADMIN">Admin</option>
                            <option value="EMPLOYEE">Employee</option>
                        </select><br>
                    </div>
                </div>

                <!-- Terms and Conditions -->
                <div class="terms-checkbox">
                    <input type="checkbox" id="terms" name="terms" required>
                    <label for="terms">I agree to the <a href="#" target="_blank">Terms & Conditions</a> and <a href="#" target="_blank">Privacy Policy</a></label>
                </div>

                <button type="submit" class="signup-btn" value="Sign Up">
                    <i class="fas fa-user-plus"></i>
                    <span>Create Account</span>
                </button>
            </form>

            <button type="button" class="login-btn" href="<%= request.getContextPath() %>/login">
                <i class="fas fa-sign-in-alt"></i>
                <span>Already have an account? Sign In</span>
            </button>

            <div class="footer-info">
                <p>Municipal IT Division &copy; 2025</p>
                <p>Secure • Reliable • Efficient</p>
            </div>
        </div>
    </div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
<script>


    // Password strength checker
    document.getElementById('password').addEventListener('input', function() {
        const password = this.value;
        const strengthBar = document.getElementById('strengthBar');
        const strengthText = document.getElementById('strengthText');

        let strength = 0;
        let strengthClass = '';
        let strengthLabel = '';

        // Check password criteria
        if (password.length >= 8) strength++;
        if (password.match(/[a-z]/)) strength++;
        if (password.match(/[A-Z]/)) strength++;
        if (password.match(/[0-9]/)) strength++;
        if (password.match(/[^a-zA-Z0-9]/)) strength++;

        // Set strength level
        switch (strength) {
            case 0:
            case 1:
                strengthClass = 'strength-weak';
                strengthLabel = 'Weak';
                break;
            case 2:
            case 3:
                strengthClass = 'strength-fair';
                strengthLabel = 'Fair';
                break;
            case 4:
            case 5:
                strengthClass = 'strength-good';
                strengthLabel = 'Good';
                break;
            case 6:
                strengthClass = 'strength-strong';
                strengthLabel = 'Strong';
                break;
        }

        strengthBar.className = 'strength-bar ' + strengthClass;
        strengthText.textContent = 'Password strength: ' + strengthLabel;
    });

    // Helper functions for alerts
    function showError(message) {
        const errorAlert = document.getElementById('errorMessage');
        errorAlert.textContent = message;
        errorAlert.style.display = 'block';
        document.getElementById('successMessage').style.display = 'none';
    }

    function showSuccess(message) {
        const successAlert = document.getElementById('successMessage');
        successAlert.textContent = message;
        successAlert.style.display = 'block';
        document.getElementById('errorMessage').style.display = 'none';
    }

    function hideAlerts() {
        document.getElementById('errorMessage').style.display = 'none';
        document.getElementById('successMessage').style.display = 'none';
    }

    function validateForm() {
        const username = document.getElementById("username").value.trim();
        const password = document.getElementById("password").value;
        const confirmPassword = document.getElementById("confirmPassword").value;
        const role = document.getElementById("role").value;

        if (!username || !password || !confirmPassword || !role) {
            alert("All fields are required.");
            return false;
        }

        if (password.length < 4) {
            alert("Password must be at least 4 characters.");
            return false;
        }

        if (password !== confirmPassword) {
            alert("Passwords do not match.");
            return false;
        }

        return true;
    }
    document.getElementById("signupForm").onsubmit = validateForm;
</script>
</body>
</html>

