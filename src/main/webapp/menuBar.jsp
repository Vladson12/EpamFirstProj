<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="${language}"/>
<fmt:setBundle basename="internationalization.messages"/>

<html lang="${language}">
    <head>
        <meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
        <link rel="stylesheet" type="text/css" href="assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="assets/fonts/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="assets/fonts/googleapis.com.roboto.css">
        <link rel="stylesheet" type="text/css" href="assets/css/Bold-BS4-Footer-Big-Logo.css">
        <link rel="stylesheet" type="text/css" href="assets/css/Bootstrap-Theme-Switchers.css">
        <link rel="stylesheet" type="text/css" href="assets/css/aos-2.1.1.css">
        <link rel="stylesheet" type="text/css" href="assets/css/sticky-dark-top-nav-with-dropdown.css">
        <link rel="stylesheet" type="text/css" href="assets/css/styles.css">
        <link rel="stylesheet" type="text/css" href="assets/css/Toggle-Switch-1-1.css">
        <link rel="stylesheet" type="text/css" href="assets/css/Toggle-Switch-1.css">
        <link rel="stylesheet" type="text/css" href="assets/css/Toggle-Switch.css">
    </head>

    <body>
        <c:set var="loggedIn" value="${not empty loggedInUser}"/>
        <c:set var="userRole" value="${sessionScope.loggedInUser.role}"/>
        <div style="color: rgb(0,0,0);filter: contrast(100%); height: 80px;font-size: 0.9rem">
            <nav class="navbar navbar-light navbar-expand-xl text-white navbar-fixed-top navigation-clean-button" data-aos="zoom-out" data-aos-duration="1000" data-aos-delay="400" style="background-color: rgb(60,61,65);filter: contrast(156%);">
                <div class="container">
                    <div>
                        <a class="navbar-brand" href="/">
                            <span style="font-size: 1rem">
                                <img class="border rounded" src="assets/img/LibLogo.jpg" style="width: 50px; height: 50px;" alt="logo"><fmt:message key="menu_bar.title"/>
                            </span>
                        </a>
                        <button data-toggle="collapse" class="navbar-toggler" data-target="#navcol-1">
                            <span class="sr-only">Toggle navigation</span>
                            <span style="filter: invert(100%)" class="navbar-toggler-icon"></span>
                        </button>
                    </div>
                    <div class="collapse navbar-collapse text-white" id="navcol-1" style="font-size: 0.85rem;">
                        <ul class="nav navbar-nav text-white nav-right">
                            <c:if test="${not empty loggedInUser}">
                            <c:choose>
                                <c:when test="${userRole eq 'READER'}">
                                    <li class="nav-item" role="presentation">
                                        <a class="nav-link text-white" href="/bookList?login=${loggedInUser.login}&update=true'"><fmt:message key="home_page.booklist_bn"/></a>
                                    </li>
                                </c:when>
                                <c:otherwise>
                                    <li class="nav-item" role="presentation">
                                        <a class="nav-link text-white" href="/bookList?login=${loggedInUser.login}&update=true'"><fmt:message key="home_page.booklist_bn"/></a>
                                    </li>
                                    <li class="nav-item" role="presentation">
                                        <a class="nav-link text-white" href="/users?updatePage=true"><fmt:message key="home_page.userlist_bn"/></a>
                                    </li>
                                    <li class="nav-item" role="presentation">
                                        <a class="nav-link text-white" href="/addUser"><fmt:message key="home_page.adduser_bn"/></a>
                                    </li>
                                </c:otherwise>
                            </c:choose>
                            </c:if>
                        </ul>
                        <p class="ml-auto navbar-text actions">
                            <c:choose>
                            <c:when test="${loggedIn}">
                                <a class="btn btn-light text-white action-button"  style="font-size: 0.85rem;border-radius: 5px;" role="button" href="${pageContext.request.contextPath}/cabinet">
                                        ${loggedInUser.name}:
                                    <c:if test="${loggedInUser.role eq 'ADMINISTRATOR'}">
                                        <fmt:message key="role.admin"/>
                                    </c:if>
                                    <c:if test="${loggedInUser.role eq 'LIBRARIAN'}">
                                        <fmt:message key="role.librarian"/>
                                    </c:if>
                                    <c:if test="${loggedInUser.role eq 'READER'}">
                                        <fmt:message key="role.reader"/>
                                    </c:if>
                                </a>
                                <a class="btn btn-light text-white action-button"  style="font-size: 0.85rem;border-radius: 5px;" role="button" href="${pageContext.request.contextPath}/logout"><fmt:message key="menu_bar.signout"/></a>
                            </c:when>
                            <c:otherwise>
                                <a class="btn btn-light text-white action-button"  style="font-size: 0.85rem; border-radius: 5px;" role="button" href="${pageContext.request.contextPath}/login"><fmt:message key="menu_bar.signin"/></a>
                                <a class="btn btn-light text-white action-button"  style="font-size: 0.85rem; border-radius: 5px;" role="button" href="${pageContext.request.contextPath}/registration"><fmt:message key="menu_bar.signup"/></a>
                            </c:otherwise>
                            </c:choose>
                        </p>
                    </div>
                </div>
            </nav>
        </div>
        <script type="text/javascript" src="assets/js/jquery.min.js"></script>
        <script type="text/javascript" src="assets/bootstrap/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="assets/js/-Bootswatch-Theme-Switcher-BS4-.js"></script>
        <script type="text/javascript" src="assets/js/bs-animation.js"></script>
        <script type="text/javascript" src="assets/js/aos-2.1.1.js"></script>
    </body>
</html>