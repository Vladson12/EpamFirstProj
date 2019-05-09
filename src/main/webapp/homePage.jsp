<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html style="background-color: #000000;">
    <head>
        <meta charset="UTF-8">
        <title>Library : Home</title>
    </head>

    <body style="background-color: rgba(255,255,255,0);">
        <div><jsp:include page="menuBar.jsp"></jsp:include></div>
        <div style="background-image: url(&quot;assets/img/1348229547604-e1432042866949.jpg&quot;);height: 650px;background-repeat: round;background-size: cover;">
            <c:set var="userRole" value="${sessionScope.loggedInUser.role}"/>
                    <c:choose>
                        <c:when test="${userRole eq 'READER'}">
                            <button onclick="location.href='/bookList?login=${loggedInUser.login}'">Book list</button>
                        </c:when>
                        <c:otherwise>
                            <button onclick="location.href='/users'">User list</button>
                            <button onclick="location.href='/addUser'">Add user</button>
                            <button onclick="location.href='/bookList?login=${loggedInUser.login}'">Book list</button>
                        </c:otherwise>
                    </c:choose>
        </div>
        <div><jsp:include page="footer.jsp"></jsp:include></div>
    </body>
</html>