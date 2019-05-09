<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html style="background-color: #000000;">
    <head>
        <title>Personal Cabinet</title>
    </head>
    <body style="background-color: rgba(255,255,255,0);">
        <div><jsp:include page="menuBar.jsp"></jsp:include></div>
        <div style="background-image: url(&quot;assets/img/1348229547604-e1432042866949.jpg&quot;);height: 650px;background-repeat: round;background-size: cover;">
                <h1>Personal Cabinet</h1>
                    <button onclick="location.href='/cabinet/profile?id=${sessionScope.loggedInUser.id}'">Profile</button>
                    <button onclick="location.href='/cabinet/settings?id=${sessionScope.loggedInUser.id}'">Settings</button>
                    <button onclick="location.href='/cabinet/usercards?login=${sessionScope.loggedInUser.login}'">My cards</button>
        </div>
        <div><jsp:include page="footer.jsp"></jsp:include></div>
    </body>
</html>
