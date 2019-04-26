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
<%--<a href=“${pageContext.request.contextPath}/login”>--%>
<%--    Login--%>
<%--</a>--%>
<%--||--%>
<%--<a href=“${pageContext.request.contextPath}/logout”>--%>
<%--    Logout--%>
<%--</a>--%>
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