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
<a href="${pageContext.request.contextPath}/login">
    Login
</a>
||
<a href="${pageContext.request.contextPath}/logout">
    Logout
</a>

&nbsp;
<span style="color:red">[ ${user.name} ]</span>

&nbsp;
<span style="color:red">[ ${user.role} ]</span>

</body>
</html>
