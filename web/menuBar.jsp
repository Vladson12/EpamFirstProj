<%@ page import="java.nio.file.FileSystems" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        body {
            font-family: Consolas;
        }

        a.w3-bar-item {
            text-decoration: none;
        }
    </style>
</head>

<body>
    <div class="w3-container w3-black w3-opacity-min w3-text-white w3-right-align">
        <h1>Library</h1>
    </div>

    <div class="w3-bar w3-dark-gray w3-large w3-opacity-min w3-left-align" >
        <c:set var="loggedIn" value="${not empty loggedInUser}"/>

        <c:choose>
            <c:when test="${loggedIn}">
                <a href="${pageContext.request.contextPath}/home" class="w3-bar-item w3-left w3-hover-blue">Home</a>
                <a href="${pageContext.request.contextPath}/logout" class="w3-bar-item w3-left w3-hover-blue">Sign out</a>
                <a href="${pageContext.request.contextPath}/cabinet" class="w3-bar-item w3-right w3-hover-blue">${loggedInUser.name}: ${loggedInUser.role}</a>
            </c:when>
            <c:otherwise>
                <a href="${pageContext.request.contextPath}/" class="w3-bar-item w3-hover-blue">Home</a>
                <a href="${pageContext.request.contextPath}/login" class="w3-bar-item w3-hover-blue">Sign in</a>
                <a href="${pageContext.request.contextPath}/registration" class="w3-bar-item w3-hover-blue">Sign up</a>
            </c:otherwise>
        </c:choose>
    </div>
</body>
</html>

