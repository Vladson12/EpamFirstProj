<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Konstantin
  Date: 2019-04-16
  Time: 01:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>

<a href="${pageContext.request.contextPath}/home">
    Home Page
</a>
||
<a href="${pageContext.request.contextPath}/registration">
    Registration
</a>
||
<c:if test="${empty loggedInUser}">
    <a href="${pageContext.request.contextPath}/login">
        Login
    </a>
</c:if>
<c:if test="${not empty loggedInUser}">
    <a href="${pageContext.request.contextPath}/logout">
        Logout
    </a>
</c:if>

&nbsp;
<span style="color:red">[ ${loggedInUser.name} ]</span>

&nbsp;
<span style="color:red">[ ${loggedInUser.role} ]</span>

</body>
</html>
