<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="${language}"/>
<fmt:setBundle basename="internationalization.messages"/>

<html lang="${language}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>LibrarySite</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="assets/fonts/googleapis.com.roboto.css">
    <link rel="stylesheet" href="assets/css/Bold-BS4-Footer-Big-Logo.css">
    <link rel="stylesheet" href="assets/css/Bootstrap-Theme-Switchers.css">
    <link rel="stylesheet" href="assets/css/aos-2.1.1.css">
    <link rel="stylesheet" href="assets/css/sticky-dark-top-nav-with-dropdown.css">
    <link rel="stylesheet" href="assets/css/styles.css">
    <link rel="stylesheet" href="assets/css/Toggle-Switch-1-1.css">
    <link rel="stylesheet" href="assets/css/Toggle-Switch-1.css">
    <link rel="stylesheet" href="assets/css/Toggle-Switch.css">
</head>

<body>
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
                    <form>
                        <c:forEach items="${param}" var="parameter">
                            <c:if test="${parameter.key ne 'language'}">
                                <input type="hidden" name="${parameter.key}" value="${parameter.value}">
                            </c:if>
                        </c:forEach>
                        <select id="language" name="language"  onchange="submit()">
                            <option value="en" ${language == 'en' ? 'selected' : ''}><fmt:message key="menu_bar.lang_en"/></option>
                            <option value="ru" ${language == 'ru' ? 'selected' : ''}><fmt:message key="menu_bar.lang_ru"/></option>
                        </select>
                    </form>
                </div>
            </div>
        </div>
    </footer>
</div>
<script src="assets/js/jquery.min.js"></script>
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
<script src="assets/js/-Bootswatch-Theme-Switcher-BS4-.js"></script>
<script src="assets/js/bs-animation.js"></script>
<script src="assets/js/aos-2.1.1.js"></script>
</body>

</html>