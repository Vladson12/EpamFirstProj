<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html style="background-color: #000000;">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>LibrarySite</title>
    <link rel="stylesheet" type="text/css" href="../assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="../assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto+Slab:300,400|Roboto:300,400,700">
    <link rel="stylesheet" type="text/css" href="../assets/css/Bold-BS4-Footer-Big-Logo.css">
    <link rel="stylesheet" type="text/css" href="../assets/css/Bootstrap-Theme-Switchers.css">
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.1.1/aos.css">
    <link rel="stylesheet" type="text/css" href="../assets/css/sticky-dark-top-nav-with-dropdown.css">
    <link rel="stylesheet" type="text/css" href="../assets/css/styles.css">
    <link rel="stylesheet" type="text/css" href="../assets/css/Toggle-Switch-1-1.css">
    <link rel="stylesheet" type="text/css" href="../assets/css/Toggle-Switch-1.css">
    <link rel="stylesheet" type="text/css" href="../assets/css/Toggle-Switch.css">
</head>

<body style="background-color: rgba(255,255,255,0);">
    <div style="color: rgb(0,0,0);filter: contrast(100%);height: 80px;">
        <nav class="navbar navbar-light navbar-expand-md text-white navbar-fixed-top navigation-clean-button" data-aos="zoom-out" data-aos-duration="1000" data-aos-delay="400" style="background-color: rgb(60,61,65);filter: contrast(156%);">
            <div class="container">
                <div><a class="navbar-brand" href="#"><span><img class="border rounded" src="assets/img/LibLogo.jpg" style="width: 50px;" width="149px" alt="logo">Library</span> </a><button data-toggle="collapse" class="navbar-toggler" data-target="#navcol-1"><span class="sr-only">Toggle navigation</span><span class="navbar-toggler-icon"></span></button></div>
                <div
                    class="collapse navbar-collapse text-white" id="navcol-1">
                    <ul class="nav navbar-nav text-white nav-right">
                        <li class="nav-item" role="presentation"></li>
                        <li class="nav-item dropdown"><a class="dropdown-toggle nav-link text-white" data-toggle="dropdown" aria-expanded="false" href="#">Services </a>
                            <div class="dropdown-menu text-white" role="menu"><a class="dropdown-item" role="presentation" href="services.html">Price Packages</a><a class="dropdown-item" role="presentation" href="#">Order Services</a><a class="dropdown-item" role="presentation" href="#">Custom Request</a></div>
                        </li>
                        <li class="nav-item" role="presentation"><a class="nav-link text-white" href="about.html">about </a></li>
                        <li class="nav-item" role="presentation"><a class="nav-link text-white" href="faq.html">faq </a></li>
                        <li class="nav-item" role="presentation"><a class="nav-link text-white" href="contact.html">contact </a></li>
                    </ul>
                    <p class="ml-auto navbar-text actions"><a class="text-truncate text-break login" href="${pageContext.request.contextPath}/login">Log In</a> <a class="btn btn-light text-white action-button" role="button" href="${pageContext.request.contextPath}/registration">Sign Up</a></p>
            </div>
    </div>
    </nav>
    </div>
    <div style="background-image: url(&quot;assets/img/1348229547604-e1432042866949.jpg&quot;);height: 650px;background-repeat: round;background-size: cover;"></div>
    <div>
        <footer data-aos="zoom-out" data-aos-duration="1000" data-aos-delay="400" id="myFooter" style="filter: contrast(156%);padding-top: 0px;">
            <div class="container">
                <div class="row text-center" style="margin-bottom: 0px;">
                    <div class="col-12 col-sm-6 col-md-3 col-xl-4">
                        <div data-aos="fade-right" data-aos-duration="3000" data-aos-delay="1500" style="background-position: center;margin-top: 15px;width: 300px;"><img class="rounded-circle img-fluid d-lg-flex justify-content-lg-end align-items-lg-end" style="width: 350px;" src="assets/img/Обои%20на%20рабочий%20стол%201920x1080.jpg"></div>
                    </div>
                    <div class="col-12 col-sm-6 col-md-2">
                        <h5>Get started</h5>
                        <ul>
                            <li><a href="#">Home</a></li>
                            <li><a href="#">Downloads<br></a></li>
                            <li><a href="#">Sign Up</a></li>
                            <li></li>
                        </ul>
                    </div>
                    <div class="col-12 col-sm-6 col-md-2">
                        <h5>Our Company</h5>
                        <ul>
                            <li><a href="#">About Us</a></li>
                            <li></li>
                            <li><a href="#">Reviews</a></li>
                            <li><a href="#">Contacts</a></li>
                        </ul>
                    </div>
                    <div class="col-sm-6 col-md-2">
                        <h5>Support</h5>
                        <ul>
                            <li><a href="#">FAQ</a></li>
                            <li><a href="#">Forums</a></li>
                            <li><a href="#">External Links</a></li>
                        </ul>
                    </div>
                    <div class="col-md-3 col-xl-2 social-networks">
                        <div></div><a class="facebook" href="#"><i class="fa fa-facebook"></i></a><a class="twitter" href="#"><i class="fa fa-twitter"></i></a><a class="google" href="#"><i class="fa fa-google-plus"></i></a><a class="linkedin" href="#"><i class="fa fa-linkedin"></i></a>
                        <select
                            class="border rounded custom-select custom-select-sm" required="">
                            <option value="English">English</option>
                            <option value="Russian" selected="">Russian</option>
                            </select>
                    </div>
                </div>
            </div>
        </footer>
    </div>
    <script type="text/javascript" src="../assets/js/jquery.min.js"></script>
    <script type="text/javascript" src="../assets/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../assets/js/-Bootswatch-Theme-Switcher-BS4-.js"></script>
    <script type="text/javascript" src="../assets/js/bs-animation.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.1.1/aos.js"></script>
</body>

</html>