<%--
  Created by IntelliJ IDEA.
  User: vladd
  Date: 27.04.2019
  Time: 19:44
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <title>Personal Cabinet</title>
    <style>
        body {
            font-family: Consolas;
        }

        button.w3-btn {
            color: black;
            size: legal;
            font-size: xx-large;
            background-color: #A9A9A9;
        }
    </style>
</head>

<body class="w3-light-grey">

<jsp:include page="menuBarOld.jsp"></jsp:include>


<div class="w3-container w3-center w3-hover-opacity-off">
    <h1>Personal Cabinet</h1>
    <div class="w3-bar w3-padding-large w3-padding-24">
        <button class="w3-btn w3-opacity-min w3-round-large" onclick="location.href='/cabinet/profile?id=${sessionScope.loggedInUser.id}'">Profile</button>
        <button class="w3-btn w3-opacity-min w3-round-large" onclick="location.href='/cabinet/settings?id=${sessionScope.loggedInUser.id}'">Settings</button>
        <button class="w3-btn w3-opacity-min w3-round-large" onclick="location.href='/cabinet/usercards?login=${sessionScope.loggedInUser.login}'">My cards</button>
    </div>
</div>




    <%--<jsp:include page="cabinetMenu.jsp"></jsp:include>--%>


    <%--<div class="w3-container w3-padding">--%>
        <%--<div class="w3-card-4">--%>
            <%--<div class="w3-container w3-center w3-green">--%>
            <%--</div>--%>
            <%--<form method="post" class="w3-selection w3-light-grey w3-padding" action="cabinet">--%>
                <%--&lt;%&ndash;<jsp:useBean id="user" scope="session" type="com.epam.app.model.User"/>&ndash;%&gt;--%>
                <%--<input  value="${sessionScope.loggedInUser.id}" type="hidden" name="id" class="w3-input w3-animate-input w3-border w3-round-large"><br/>--%>
                <%--<label>Name:--%>
                    <%--<input value="${sessionScope.loggedInUser.name}" type="text" name="name" class="w3-input w3-animate-input w3-border w3-round-large"><br/>--%>
                <%--</label>--%>
                <%--<c:set var="userRole" value="${sessionScope.loggedInUser.role}"/>--%>
                <%--<label>Role:--%>
                    <%--<select name="role" ${(userRole ne 'ADMINISTRATOR') ? 'disabled' : ''}>--%>
                        <%--<option value="READER" ${userRole eq 'READER' ? 'selected' : ''}>Reader</option>--%>
                        <%--<option value="LIBRARIAN" ${userRole eq 'LIBRARIAN' ? 'selected' : ''}>Librarian</option>--%>
                        <%--<option value="ADMINISTRATOR" ${userRole eq 'ADMINISTRATOR' ? 'selected' : ''}>Administrator</option>--%>
                    <%--</select>--%>
                <%--</label>--%>
                <%--<label>Email:--%>
                    <%--<input value="${sessionScope.loggedInUser.login}" type="text" name="login" disabled class="w3-input w3-animate-input w3-border w3-round-large"><br/>--%>
                <%--</label>--%>
                <%--<button type="submit" class="w3-btn w3-green w3-round-large w3-margin-bottom">Save</button>--%>
            <%--</form>--%>
        <%--</div>--%>
    <%--</div>--%>
</body>
</html>
