<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Konstantin
  Date: 2019-04-16
  Time: 01:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <title>Welcome Page</title>
</head>
<body class="w3-light-grey">

<jsp:include page="menuBar.jsp"></jsp:include>

<div class="w3-container w3-blue-grey w3-opacity w3-right-align">
    <h1>Library</h1>
</div>

<h3>Welcome Page</h3>

<c:if test="${empty loggedInUser}">
    <p>You're not logged in!</p>
</c:if>

</body>
</html>
