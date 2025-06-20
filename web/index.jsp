<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 6/16/2025
  Time: 3:50 PM
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
  <title>Get Started - Complaint Management System</title>
  <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    :root {
      --primary-red: #ec4258;
      --secondary-red: #ef4444;
      --light-red: #fee2e2;
      --dark-red: #991b1b;
      --pure-white: #ffffff;
      --light-gray: #f8fafc;
      --dark-gray: #1f2937;
    }

    body {
      font-family: 'Bell MT', Tahoma, Geneva, Verdana, sans-serif;
      line-height: 1.6;
      overflow-x: hidden;
    }

    .animated-bg {
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      z-index: -1;
      background: linear-gradient(135deg, var(--pure-white) 0%, var(--light-red) 100%);
    }


    .navbar {
      background: rgba(255, 255, 255, 0.95);
      backdrop-filter: blur(10px);
      border-bottom: 1px solid rgba(220, 38, 38, 0.1);
      transition: all 0.3s ease;
    }

    .navbar-brand {
      font-weight: 700;
      color: var(--primary-red) !important;
      font-size: 1.5rem;
    }

    .navbar-nav .nav-link {
      color: var(--dark-gray) !important;
      font-weight: 500;
      margin: 0 10px;
      transition: color 0.3s ease;
    }

    .navbar-nav .nav-link:hover {
      color: var(--primary-red) !important;
    }

    .hero-section {
      min-height: 100vh;
      display: flex;
      align-items: center;
      padding: 100px 0;
    }

    .hero-content {
      animation: slideInLeft 1s ease-out;
    }

    .hero-title {
      font-size: 3.5rem;
      font-weight: 800;
      color: var(--dark-gray);
      margin-bottom: 20px;
      line-height: 1.2;
    }

    .hero-subtitle {
      font-size: 1.3rem;
      color: #6b7280;
      margin-bottom: 40px;
      max-width: 500px;
    }

    .cta-buttons {
      display: flex;
      gap: 20px;
      flex-wrap: wrap;
    }

    .btn-primary-custom {
      background: linear-gradient(135deg, var(--primary-red), var(--secondary-red));
      border: none;
      padding: 15px 30px;
      font-size: 1.1rem;
      font-weight: 600;
      border-radius: 50px;
      color: white;
      text-decoration: none;
      transition: all 0.3s ease;
      box-shadow: 0 8px 25px rgba(220, 38, 38, 0.3);
      position: relative;
      overflow: hidden;
    }

    .btn-primary-custom:hover {
      transform: translateY(-3px);
      box-shadow: 0 12px 35px rgba(220, 38, 38, 0.4);
      color: white;
    }

    .btn-secondary-custom {
      background: transparent;
      border: 2px solid var(--primary-red);
      padding: 13px 30px;
      font-size: 1.1rem;
      font-weight: 600;
      border-radius: 50px;
      color: var(--primary-red);
      text-decoration: none;
      transition: all 0.3s ease;
    }

    .btn-secondary-custom:hover {
      background: var(--primary-red);
      color: white;
      transform: translateY(-3px);
    }

    .hero-image {
      animation: slideInRight 1s ease-out;
      position: relative;
    }

    .dashboard-preview {
      background: white;
      border-radius: 20px;
      box-shadow: 0 20px 60px rgba(0, 0, 0, 0.1);
      padding: 30px;
      transition: transform 0.3s ease;
    }

    .preview-header {
      display: flex;
      align-items: center;
      gap: 10px;
      margin-bottom: 20px;
      padding-bottom: 15px;
      border-bottom: 2px solid var(--light-red);
    }

    .preview-dots {
      display: flex;
      gap: 5px;
    }

    .dot {
      width: 12px;
      height: 12px;
      border-radius: 50%;
      background: var(--secondary-red);
    }

    .preview-content {
      display: flex;
      flex-direction: column;
      gap: 15px;
    }

    .preview-item {
      display: flex;
      align-items: center;
      gap: 15px;
      padding: 15px;
      background: var(--light-red);
      border-radius: 10px;
      transition: transform 0.2s ease;
    }

    .preview-item:hover {
      transform: translateX(5px);
    }

    .preview-icon {
      width: 40px;
      height: 40px;
      background: var(--primary-red);
      border-radius: 50%;
      display: flex;
      align-items: center;
      justify-content: center;
      color: white;
    }

    .features-section {
      padding: 100px 0;
      background: var(--pure-white);
    }

    .feature-card {
      background: white;
      border-radius: 20px;
      padding: 40px 30px;
      text-align: center;
      box-shadow: 0 10px 40px rgba(0, 0, 0, 0.05);
      transition: all 0.3s ease;
      border: 1px solid rgba(220, 38, 38, 0.1);
      height: 100%;
    }

    .feature-card:hover {
      transform: translateY(-10px);
      box-shadow: 0 20px 60px rgba(220, 38, 38, 0.15);
    }

    .feature-icon {
      width: 80px;
      height: 80px;
      background: linear-gradient(135deg, var(--primary-red), var(--secondary-red));
      border-radius: 50%;
      display: flex;
      align-items: center;
      justify-content: center;
      margin: 0 auto 25px;
      color: white;
      font-size: 2rem;
    }

    .feature-title {
      font-size: 1.5rem;
      font-weight: 700;
      color: var(--dark-gray);
      margin-bottom: 15px;
    }

    .feature-description {
      color: #6b7280;
      line-height: 1.7;
    }

    @keyframes slideInLeft {
      from {
        opacity: 0;
        transform: translateX(-50px);
      }
      to {
        opacity: 1;
        transform: translateX(0);
      }
    }

    @keyframes slideInRight {
      from {
        opacity: 0;
        transform: translateX(50px);
      }
      to {
        opacity: 1;
        transform: translateX(0);
      }
    }

    .fade-in {
      opacity: 0;
      transform: translateY(30px);
      transition: all 0.6s ease;
    }

    .fade-in.visible {
      opacity: 1;
      transform: translateY(0);
    }

    @media (max-width: 768px) {
      .hero-title {
        font-size: 2.5rem;
      }

      .hero-subtitle {
        font-size: 1.1rem;
      }

      .cta-buttons {
        justify-content: center;
      }

      .dashboard-preview {
        transform: none;
        margin-top: 50px;
      }
    }
  </style>
</head>
<body>

<!-- Navigation -->
<nav class="navbar navbar-expand-lg fixed-top">
  <div class="container">
    <a class="navbar-brand" href="#">
      <i class="fas fa-headset me-2"></i>
      ComplaintHub
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ms-auto">
        <li class="nav-item">
          <a class="nav-link" href="#"></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#features">Features</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#about">About</a>
        </li>
      </ul>
    </div>
  </div>
</nav>

<!-- Hero Section -->
<section class="hero-section">
  <div class="container">
    <div class="row align-items-center">
      <div class="col-lg-6">
        <div class="hero-content">
          <h1 class="hero-title">
            Transform Your
            <span style="color: var(--primary-red);">Complaint</span>
            Management
          </h1>
          <p class="hero-subtitle">
            Streamline your complaint handling process with our modern, efficient, and user-friendly management system. Get started in minutes.
          </p>
          <div class="cta-buttons">
            <a href="<%= request.getContextPath() %>/login" class="btn-primary-custom" id="loginBtn" >
              <i class="fas fa-sign-in-alt me-2"></i>
              Login Now
            </a>
            <a href="<%= request.getContextPath() %>/signup" class="btn-secondary-custom" id="registerBtn">
              <i class="fas fa-user-plus me-2"></i>
              Register
            </a>
          </div>
        </div>
      </div>
      <div class="col-lg-6">
        <div class="hero-image">
          <div class="dashboard-preview">
            <div class="preview-header">
              <div class="preview-dots">
                <div class="dot"></div>
                <div class="dot" style="background: #fbbf24;"></div>
                <div class="dot" style="background: #10b981;"></div>
              </div>
              <span style="margin-left: auto; color: var(--primary-red); font-weight: 600;">Dashboard</span>
            </div>
            <div class="preview-content">
              <div class="preview-item">
                <div class="preview-icon">
                  <i class="fas fa-plus"></i>
                </div>
                <div>
                  <strong>Submit Complaint</strong>
                  <br><small>Quick and easy submission</small>
                </div>
              </div>
              <div class="preview-item">
                <div class="preview-icon">
                  <i class="fas fa-search"></i>
                </div>
                <div>
                  <strong>Track Status</strong>
                  <br><small>Real-time updates</small>
                </div>
              </div>
              <div class="preview-item">
                <div class="preview-icon">
                  <i class="fas fa-chart-bar"></i>
                </div>
                <div>
                  <strong>Analytics</strong>
                  <br><small>Detailed reports</small>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- Features Section -->
<section class="features-section" id="features">
  <div class="container">
    <div class="row text-center mb-5">
      <div class="col-12">
        <h2 class="hero-title" style="font-size: 2.5rem; margin-bottom: 20px;">
          Why Choose <span style="color: var(--primary-red);">ComplaintHub</span>?
        </h2>
        <p class="hero-subtitle" style="max-width: 600px; margin: 0 auto;">
          Experience the next generation of complaint management with powerful features designed for efficiency.
        </p>
      </div>
    </div>
    <div class="row">
      <div class="col-lg-4 col-md-6 mb-4">
        <div class="feature-card fade-in">
          <div class="feature-icon">
            <i class="fas fa-rocket"></i>
          </div>
          <h3 class="feature-title">Quick Setup</h3>
          <p class="feature-description">
            Get your complaint management system up and running in minutes with our intuitive setup process.
          </p>
        </div>
      </div>
      <div class="col-lg-4 col-md-6 mb-4">
        <div class="feature-card fade-in">
          <div class="feature-icon">
            <i class="fas fa-shield-alt"></i>
          </div>
          <h3 class="feature-title">Secure & Reliable</h3>
          <p class="feature-description">
            Your data is protected with enterprise-grade security and 99.9% uptime guarantee.
          </p>
        </div>
      </div>
      <div class="col-lg-4 col-md-6 mb-4">
        <div class="feature-card fade-in">
          <div class="feature-icon">
            <i class="fas fa-mobile-alt"></i>
          </div>
          <h3 class="feature-title">Mobile Friendly</h3>
          <p class="feature-description">
            Access your dashboard anywhere, anytime with our responsive mobile-first design.
          </p>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- About section -->
<section class="about-section" id="about">
  <div class="container">
    <div class="row">
      <div class="col-lg-6">
        <div class="about-image">
          <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTANCKj9kc55zpymLKvfhP2Md_tMbNxIKvEcA&s" alt="About Us" width="450px">
        </div>
      </div>
      <div class="col-lg-6">
        <div class="about-content">
          <h2 class="hero-title" style="font-size: 2.5rem; margin-bottom: 20px;">
            About <span style="color: var(--primary-red);">ComplaintHub</span>
          </h2>
          <p class="hero-subtitle" style="max-width: 600px; margin: 0 auto;">
            The Complaint Management System is a web based application designed to streamline the process of recording,
            managing, and resolving complaints within an organization. It provides a centralized platform for users to
            submit their concerns while enabling administrators and employees to track, address, and resolve issues
            efficiently. With features like complaint categorization, status tracking, response management, and user
            role based access, the system enhances transparency, accountability, and service quality. This solution
            aims to improve user satisfaction by ensuring timely and organized handling of complaints while reducing
            manual effort and communication gaps.
          </p>
          <br><br><br>
        </div>
      </div>
    </div>
  </div>
</section>


<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
<script>
  // Smooth scrolling for navigation links
  document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
      e.preventDefault();
      const target = document.querySelector(this.getAttribute('href'));
      if (target) {
        target.scrollIntoView({
          behavior: 'smooth',
          block: 'start'
        });
      }
    });
  });

  // Fade in animation on scroll
  const observerOptions = {
    threshold: 0.1,
    rootMargin: '0px 0px -50px 0px'
  };

  const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        entry.target.classList.add('visible');
      }
    });
  }, observerOptions);

  document.querySelectorAll('.fade-in').forEach(el => {
    observer.observe(el);
  });

  // Navbar background change on scroll
  window.addEventListener('scroll', () => {
    const navbar = document.querySelector('.navbar');
    if (window.scrollY > 50) {
      navbar.style.background = 'rgba(255, 255, 255, 0.95)';
      navbar.style.boxShadow = '0 2px 20px rgba(0, 0, 0, 0.1)';
    } else {
      navbar.style.background = 'rgba(255, 255, 255, 0.95)';
      navbar.style.boxShadow = 'none';
    }
  });



  // Interactive dashboard preview
  const previewItems = document.querySelectorAll('.preview-item');
  previewItems.forEach((item, index) => {
    item.addEventListener('mouseenter', () => {
      item.style.background = 'linear-gradient(135deg, var(--light-red), var(--pure-white))';
    });

    item.addEventListener('mouseleave', () => {
      item.style.background = 'var(--light-red)';
    });
  });

  // Typing effect for hero title (optional enhancement)
  function typeWriter(element, text, speed = 100) {
    let i = 0;
    element.innerHTML = '';
    function type() {
      if (i < text.length) {
        element.innerHTML += text.charAt(i);
        i++;
        setTimeout(type, speed);
      }
    }
    type();
  }

  // Add some interactivity to floating shapes
  const shapes = document.querySelectorAll('.shape');
  shapes.forEach(shape => {
    shape.addEventListener('mouseenter', () => {
      shape.style.opacity = '0.3';
      shape.style.transform = 'scale(1.2)';
    });

    shape.addEventListener('mouseleave', () => {
      shape.style.opacity = '0.1';
      shape.style.transform = 'scale(1)';
    });
  });
</script>
</body>
</html>
