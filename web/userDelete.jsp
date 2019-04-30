<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Delete user</title>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>

<body class="w3-light-grey">
<div class="w3-container w3-blue-grey w3-opacity w3-right-align">
    <h1>Library</h1>
</div>
<div class="w3-container w3-padding">
    <div class="w3-card-4">
        <form action="/users">
            <jsp:useBean id="user" scope="session" type="com.epam.app.model.User"/>
            <input value="" type="hidden" name="delete" ><br />
            <div class="w3-container w3-center w3-green">
                    <h2>Do you really want delete user ${user.login} ?</h2>
            </div>
            <div class="w3-display-middle">
                <button type="submit" class="w3-btn w3-green  w3-round-large w3-margin-bottom">Delete</button>
                <button type="button" class="w3-btn w3-green  w3-round-large w3-margin-bottom"
                onclick="location.href='/users'">Back</button>
            </div>
        </form>
<%--        <div class="w3-display-middle">--%>
<%--            <button type="button" class="w3-btn w3-green  w3-round-large w3-margin-bottom"--%>
<%--                    onclick="location.href='/users'">Back</button>--%>
<%--        </div>--%>
    </div>
</div>
</body>
</html>
