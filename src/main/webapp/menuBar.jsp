<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>LibrarySite</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto+Slab:300,400|Roboto:300,400,700">
    <link rel="stylesheet" href="assets/css/Bold-BS4-Footer-Big-Logo.css">
    <link rel="stylesheet" href="assets/css/Bootstrap-Theme-Switchers.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.1.1/aos.css">
    <link rel="stylesheet" href="assets/css/sticky-dark-top-nav-with-dropdown.css">
    <link rel="stylesheet" href="assets/css/styles.css">
    <link rel="stylesheet" href="assets/css/Toggle-Switch-1-1.css">
    <link rel="stylesheet" href="assets/css/Toggle-Switch-1.css">
    <link rel="stylesheet" href="assets/css/Toggle-Switch.css">
</head>

<body>
<c:set var="loggedIn" value="${not empty loggedInUser}"/>

<div style="color: rgb(0,0,0);filter: contrast(100%);height: 80px;">
    <nav class="navbar navbar-light navbar-expand-md text-white navbar-fixed-top navigation-clean-button"
         data-aos="zoom-out" data-aos-duration="1000" data-aos-delay="400"
         style="background-color: rgb(60,61,65);filter: contrast(156%);">
        <div class="container">
            <div>
                <a class="navbar-brand" href="#">
                    <span>
                        <img class="border rounded" src="assets/img/LibLogo.jpg"
                             style="width: 50px;" width="149px" alt="logo">Library
                    </span>
                </a>
                <button data-toggle="collapse" class="navbar-toggler" data-target="#navcol-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="navbar-toggler-icon"></span>
                </button>
            </div>
            <div class="collapse navbar-collapse text-white" id="navcol-1">
                <ul class="nav navbar-nav text-white nav-right">
                    <li class="nav-item" role="presentation">
                        <a class="nav-link text-white" href="${pageContext.request.contextPath}/">Home</a>
                    </li>
                </ul>
                <p class="ml-auto navbar-text actions">
                    <c:choose>
                    <c:when test="${loggedIn}">
                    <a class="btn btn-light text-white action-button" role="button"
                       href="${pageContext.request.contextPath}/logout">LogOut</a>
                    <a class="btn btn-light text-white action-button" role="button"
                       href="${pageContext.request.contextPath}/cabinet">${loggedInUser.name}: ${loggedInUser.role}</a>
                </p>
                </c:when>
                <c:otherwise>
                    <a class="btn btn-light text-white action-button" role="button"
                       href="${pageContext.request.contextPath}/login">LogIn</a>
                    <a class="btn btn-light text-white action-button" role="button"
                       href="${pageContext.request.contextPath}/registration">Sign Up</a></p>
                </c:otherwise>
                </c:choose>
            </div>
        </div>
    </nav>
</div>

<script src="assets/js/jquery.min.js"></script>
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
<script src="assets/js/-Bootswatch-Theme-Switcher-BS4-.js"></script>
<script src="assets/js/bs-animation.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.1.1/aos.js"></script>
</body>
</html>