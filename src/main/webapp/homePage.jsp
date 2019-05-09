<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html style="background-color: #000000;">
    <head>
        <meta charset="UTF-8">
        <title>Library : Home</title>
    </head>

    <body style="background-color: rgba(255,255,255,0);">
        <div><jsp:include page="menuBar.jsp"></jsp:include></div>
        <div style="background-image: url(&quot;assets/img/1348229547604-e1432042866949.jpg&quot;);height: 650px;background-repeat: round;background-size: cover;">
            <c:set var="userRole" value="${sessionScope.loggedInUser.role}"/>
            <div class="w3-container w3-center w3-hover-opacity-off">
                <div class="w3-bar w3-padding-large w3-padding-24">
                    <c:choose>
                        <c:when test="${userRole eq 'READER'}">
                            <button class="w3-btn w3-opacity-min w3-round-large" onclick="location.href='/bookList?login=${loggedInUser.login}'">Book list</button>
                        </c:when>
                        <c:otherwise>
                            <button class="w3-btn w3-opacity-min w3-round-large" onclick="location.href='/users'">User list</button>
                            <button class="w3-btn w3-opacity-min w3-round-large" onclick="location.href='/addUser'">Add user</button>
                            <button class="w3-btn w3-opacity-min w3-round-large" onclick="location.href='/bookList?login=${loggedInUser.login}'">Book list</button>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
        <div><jsp:include page="footer.jsp"></jsp:include></div>
    </body>
</html>