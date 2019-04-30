<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Edit user</title>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>

<body class="w3-light-grey">
<div class="w3-container w3-blue-grey w3-opacity w3-right-align">
    <h1>Library</h1>
</div>
<div class="w3-container w3-padding">
    <div class="w3-card-4">
        <div class="w3-container w3-center w3-blue-grey">
            <h2>Edit user</h2>
        </div>
        <form action="/users" class="w3-selection w3-light-grey w3-padding">
            <jsp:useBean id="user" scope="session" type="com.epam.app.model.User"/>
            <input value="" type="hidden" name="update" ><br />
            <label>Name:
                <input value="${user.name}" type="text" name="name" class="w3-input w3-animate-input w3-border w3-round-large" ><br />
            </label>
            <label>Login:
                <input value="${user.login}" type="text" name="login" class="w3-input w3-animate-input w3-border w3-round-large" ><br />
            </label>
            <c:if test="${(sessionScope.loggedInUser.role eq 'ADMINISTRATOR') && (sessionScope.loggedInUser.role ne user.role)}">
                <label>Genre: ${user.role}
                    <select name = "role">
                        <option value = "READER" selected>READER</option>
                        <option value = "LIBRARIAN">LIBRARIAN</option>
                        <option value = "ADMINISTRATOR">ADMINISTRATOR</option>
                    </select>
                </label>
            </c:if>
            <button type="submit" class="w3-btn w3-blue-grey w3-round-large w3-margin-bottom">Edit</button>
        </form>
    </div>
</div>

<div class="w3-container w3-grey w3-opacity w3-right-align w3-padding">
    <button class="w3-btn w3-round-large" onclick="location.href='/users'">Back</button>
</div>
</body>
</html>
