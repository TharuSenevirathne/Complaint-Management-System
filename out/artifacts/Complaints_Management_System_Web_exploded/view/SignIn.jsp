<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 6/16/2025
  Time: 3:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="author" content="Tharu Senevirathne">
  <meta name="keywords" content="html, css,bootstrap, javascript,java,javaee,servlet,jsp,dbcp,tomcat,intelijIDEA, pos web, complain management system, web development, software engineering, computer science">
  <meta name="description" content="This website is a Complain Management system Web Application designed to manage complains efficiently.">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>SignIn-Complaint Management System</title>
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
      min-height: 100vh;
      display: flex;
      align-items: center;
      padding: 10px;
      max-width: 1000px;
      margin: 0 auto;
    }

    .login-wrapper {
      display: grid;
      grid-template-columns: 1.2fr 1fr;
      max-width: 900px;
      width: 100%;
      margin: 0 auto;
      background: var(--primary);
      border-radius: 20px;
      overflow: hidden;
      box-shadow: 0 25px 50px rgba(0, 0, 0, 0.3);
      backdrop-filter: blur(10px);
      border: 1px solid rgba(255, 255, 255, 0.1);
    }

    .left-panel {
      background: linear-gradient(135deg, var(--primary) 0%, var(--primary-dark) 100%);
      padding: 60px 40px;
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
      width: 120px;
      height: 120px;
      background: rgba(255, 255, 255, 0.2);
      border-radius: 30px;
      display: flex;
      align-items: center;
      justify-content: center;
      margin-bottom: 30px;
      border: 2px solid rgba(255, 255, 255, 0.3);
      backdrop-filter: blur(10px);
    }

    .brand-logo i {
      font-size: 48px;
      color: var(--light);
    }

    .brand-title {
      font-size: 2.5rem;
      font-weight: 700;
      margin-bottom: 15px;
      color: var(--light);
    }

    .brand-subtitle {
      font-size: 1.1rem;
      color: rgba(255, 255, 255, 0.8);
      margin-bottom: 40px;
    }

    .features-list {
      list-style: none;
      text-align: left;
    }

    .features-list li {
      padding: 10px 0;
      color: rgba(255, 255, 255, 0.9);
      display: flex;
      align-items: center;
    }

    .features-list i {
      margin-right: 15px;
      color: rgba(255, 255, 255, 0.7);
    }

    .right-panel {
      padding: 60px 50px;
      background: var(--light);
      color: var(--dark);
      display: flex;
      flex-direction: column;
      justify-content: center;
    }

    .login-header {
      text-align: center;
      margin-bottom: 40px;
    }

    .login-title {
      font-size: 2rem;
      font-weight: 600;
      color: var(--dark);
      margin-bottom: 10px;
    }

    .login-subtitle {
      color: var(--gray);
      font-size: 1rem;
    }

    .theme-switcher {
      position: absolute;
      top: 20px;
      right: 20px;
      display: flex;
      gap: 8px;
      background: rgba(255, 255, 255, 0.1);
      padding: 8px;
      border-radius: 12px;
      backdrop-filter: blur(10px);
    }

    .theme-btn {
      width: 24px;
      height: 24px;
      border-radius: 50%;
      border: none;
      cursor: pointer;
      transition: transform 0.2s;
    }

    .theme-btn:hover {
      transform: scale(1.2);
    }

    .theme-btn.active {
      transform: scale(1.3);
      box-shadow: 0 0 0 2px rgba(255, 255, 255, 0.5);
    }

    .role-tabs {
      display: flex;
      margin-bottom: 30px;
      background: var(--secondary);
      border-radius: 12px;
      padding: 6px;
    }

    .role-tab {
      flex: 1;
      background: transparent;
      border: none;
      padding: 12px 20px;
      border-radius: 8px;
      font-weight: 500;
      color: var(--gray);
      cursor: pointer;
      transition: all 0.3s ease;
      display: flex;
      align-items: center;
      justify-content: center;
      gap: 8px;
    }

    .role-tab.active {
      background: var(--primary);
      color: var(--light);
      box-shadow: 0 2px 8px rgba(99, 102, 241, 0.3);
    }

    .input-group {
      margin-bottom: 25px;
      position: relative;
    }

    .input-label {
      display: block;
      margin-bottom: 8px;
      font-weight: 500;
      color: var(--dark);
      font-size: 0.9rem;
    }

    .input-wrapper {
      position: relative;
    }

    .input-field {
      width: 100%;
      padding: 15px 20px 15px 50px;
      border: 2px solid #e2e8f0;
      border-radius: 12px;
      font-size: 1rem;
      transition: all 0.3s ease;
      background: var(--light);
    }

    .input-field:focus {
      outline: none;
      border-color: var(--primary);
      box-shadow: 0 0 0 3px rgba(99, 102, 241, 0.1);
    }

    .input-icon {
      position: absolute;
      left: 18px;
      top: 50%;
      transform: translateY(-50%);
      color: var(--gray);
      font-size: 16px;
    }

    .login-btn {
      width: 100%;
      background: var(--primary);
      color: var(--light);
      border: none;
      padding: 16px;
      border-radius: 12px;
      font-size: 1rem;
      font-weight: 600;
      cursor: pointer;
      transition: all 0.3s ease;
      position: relative;
      overflow: hidden;
      margin-bottom: 15px;
    }

    .login-btn:hover {
      background: crimson;
      transform: translateY(-2px);
      box-shadow: 0 8px 25px rgba(99, 102, 241, 0.4);
    }

    .login-btn:active {
      transform: translateY(0);
    }

    .signup-btn {
      width: 100%;
      background: transparent;
      color: var(--primary);
      border: 2px solid var(--primary);
      padding: 16px;
      border-radius: 12px;
      font-size: 1rem;
      font-weight: 600;
      cursor: pointer;
      transition: all 0.3s ease;
      position: relative;
      overflow: hidden;
    }

    .signup-btn:hover {
      background: var(--primary);
      color: var(--light);
      transform: translateY(-2px);
      box-shadow: 0 8px 25px rgba(244, 72, 72, 0.4);
    }

    .signup-btn:active {
      transform: translateY(0);
    }

    .error-alert {
      background: #fef2f2;
      border: 1px solid #fecaca;
      color: var(--danger);
      padding: 12px 16px;
      border-radius: 8px;
      margin-bottom: 20px;
      display: none;
      font-size: 0.9rem;
    }

    .footer-info {
      text-align: center;
      margin-top: 30px;
      padding-top: 20px;
      border-top: 1px solid #e2e8f0;
      color: var(--gray);
      font-size: 0.85rem;
    }

    /* Mobile responsive */
    @media (max-width: 768px) {
      .login-wrapper {
        grid-template-columns: 1fr;
        margin: 10px;
      }

      .left-panel {
        padding: 40px 30px;
      }

      .right-panel {
        padding: 40px 30px;
      }

      .brand-title {
        font-size: 2rem;
      }

      .theme-switcher {
        position: relative;
        top: auto;
        right: auto;
        margin-bottom: 20px;
        justify-content: center;
      }
    }

    /* Loading animation */
    .loading {
      display: inline-block;
      width: 20px;
      height: 20px;
      border: 2px solid rgba(255, 255, 255, 0.3);
      border-radius: 50%;
      border-top-color: var(--light);
      animation: spin 1s ease-in-out infinite;
    }

    @keyframes spin {
      to { transform: rotate(360deg); }
    }
  </style>

  <script>
    // Form validation and submission
    function validateLoginForm() {
      const username = document.forms["loginForm"]["username"].value.trim();
      const password = document.forms["loginForm"]["password"].value.trim();

      if (username === "" || password === "") {
        showError("Please enter both username and password.");
        return false;
      }

      return true;
    }
  </script>

</head>
<body>

<div class="container-fluid">
  <div class="login-wrapper">
    <div class="left-panel">
      <div class="brand-logo">
        <i class="fas fa-clipboard-list"></i>
      </div>
      <h1 class="brand-title">CMS Portal</h1>
      <p class="brand-subtitle">Complaint Management System</p>

      <ul class="features-list">
        <li><i class="fas fa-check-circle"></i> Efficient complaint tracking</li>
        <li><i class="fas fa-check-circle"></i> Real-time status updates</li>
        <li><i class="fas fa-check-circle"></i> Secure data management</li>
        <li><i class="fas fa-check-circle"></i> 24/7 system availability</li>
      </ul>
    </div>

    <div class="right-panel">
      <div class="login-header">
        <h2 class="login-title">Welcome Back</h2>
        <p class="login-subtitle">Please sign in to your account</p>
      </div>

      <div class="error-alert" id="errorMessage">
        Invalid credentials. Please try again.
      </div>

      <form name="loginForm" action="<%= request.getContextPath() %>/login" method="post" onsubmit="return validateLoginForm()">

        <div class="input-group">
          <label class="input-label" for="username">Username</label>
          <div class="input-wrapper">
            <i class="fas fa-user input-icon"></i>
            <input type="text" class="input-field" id="username" name="username" placeholder="Enter your username" required>
          </div>
        </div>

        <div class="input-group">
          <label class="input-label" for="password">Password</label>
          <div class="input-wrapper">
            <i class="fas fa-lock input-icon"></i>
            <input type="password" class="input-field" id="password" name="password" placeholder="Enter your password" required>
          </div>
        </div>

        <button type="submit" class="login-btn" value="Login">
          <i class="fas fa-sign-in-alt"></i>
          <span>Sign In</span>
        </button>
      </form>

      <button type="button" class="signup-btn" href="<%= request.getContextPath() %>/signup">
        <i class="fas fa-user-plus"></i>
        <span>Create New Account</span>
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

  function changeTheme(primary, primaryDark) {
    document.documentElement.style.setProperty('--primary', primary);
    document.documentElement.style.setProperty('--primary-dark', primaryDark);

    // Update active theme button
    document.querySelectorAll('.theme-btn').forEach(btn => {
      btn.classList.remove('active');
    });
    event.currentTarget.classList.add('active');
  }

  function showError(message) {
    const errorDiv = document.getElementById('errorMessage');
    errorDiv.textContent = message;
    errorDiv.style.display = 'block';

    setTimeout(() => {
      errorDiv.style.display = 'none';
    }, 5000);
  }

  // Check for login errors on page load
  window.onload = function() {
    const urlParams = new URLSearchParams(window.location.search);
    if (urlParams.get('error') === 'invalid') {
      showError('Invalid username or password. Please try again.');
    }
  };
</script>
</body>
</html>
