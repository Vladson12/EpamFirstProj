<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Library : Home</title>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <style>
        body {
            font-family: Consolas;
            background-image: url("https://s2.best-wallpaper.net/wallpaper/1920x1080/1611/Library-interior-photography_1920x1080.jpg");
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

    <jsp:include page="menuBar.jsp"></jsp:include>
    <c:set var="userRole" value="${sessionScope.loggedInUser.role}"/>

    <div class="w3-container w3-center w3-hover-opacity-off">
        <div class="w3-bar w3-padding-large w3-padding-24">
            <c:choose>
                <c:when test="${userRole eq 'READER'}">
                    <button class="w3-btn w3-opacity-min w3-round-large" onclick="location.href='/bookList?login=${loggedInUser.login}'">Book list</button>
                    <button class="w3-btn w3-opacity-min w3-round-large" onclick="location.href='/cabinet/usercards?login=${loggedInUser.login}'">My cards</button>
                    <button class="w3-btn w3-opacity-min w3-round-large" onclick="location.href='/cabinet?id=${loggedInUser.id}'">Cabinet</button>

                </c:when>
                <c:otherwise>
                    <button class="w3-btn w3-opacity-min w3-round-large" onclick="location.href='/users'">User list</button>
                    <button class="w3-btn w3-opacity-min w3-round-large" onclick="location.href='/addUser'">Add user</button>
                    <button class="w3-btn w3-opacity-min w3-round-large" onclick="location.href='/bookList?login=${loggedInUser.login}'">Book list</button>
                    <button class="w3-btn w3-opacity-min w3-round-large" onclick="location.href='/findUserCards'">User cards</button>
                    <button class="w3-btn w3-opacity-min w3-round-large" onclick="location.href='/cabinet?id=${loggedInUser.id}'">Cabinet</button>
                </c:otherwise>
            </c:choose>
        </div>
    </div>

</body>
</html>
