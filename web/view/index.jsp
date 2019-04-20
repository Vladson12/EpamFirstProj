<%--
  Created by IntelliJ IDEA.
  User: Konstantin
  Date: 2019-04-13
  Time: 14:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <title>Library</title>
  <link rel="stylesheet" href="../styles/w3.css">
</head>
<body class="w3-light-grey">

<jsp:include page="_menu.jsp"></jsp:include>

<div class="w3-container w3-blue-grey w3-opacity w3-right-align">
  <h1>Library</h1>
</div>

<div class="w3-container w3-center">
  <div class="w3-bar w3-padding-large w3-padding-24">
    <button class="w3-btn w3-hover-light-blue w3-round-large" onclick="location.href='/GetUserList'">Users list</button>
    <button class="w3-btn w3-hover-green w3-round-large" onclick="location.href='/AddNewUser'">Add user</button>
    <button class="w3-btn w3-hover-indigo w3-round-large" onclick="location.href='/BookListView'">Books list</button>
    <button class="w3-btn w3-hover-indigo w3-round-large" onclick="location.href='enterOfUser.jsp'">FR</button>

    <button class="w3-btn w3-hover-aqua w3-round-large" onclick="location.href=''">Add book</button>
  </div>
</div>

</body>
</html>
