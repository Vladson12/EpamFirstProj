<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html style="background-color: #000000;">
    <head>
        <title>Personal Cabinet</title>
    </head>
    <body style="background-color: rgba(255,255,255,0);">
        <div><jsp:include page="menuBar.jsp"></jsp:include></div>
        <div style="background-image: url(&quot;assets/img/1348229547604-e1432042866949.jpg&quot;);height: 650px;background-repeat: round;background-size: cover;">
            <div class="w3-container w3-center w3-hover-opacity-off">
                <h1>Personal Cabinet</h1>
                <div class="w3-bar w3-padding-large w3-padding-24">
                    <button class="w3-btn w3-opacity-min w3-round-large" onclick="location.href='/cabinet/profile?id=${sessionScope.loggedInUser.id}'">Profile</button>
                    <button class="w3-btn w3-opacity-min w3-round-large" onclick="location.href='/cabinet/settings?id=${sessionScope.loggedInUser.id}'">Settings</button>
                    <button class="w3-btn w3-opacity-min w3-round-large" onclick="location.href='/cabinet/usercards?login=${sessionScope.loggedInUser.login}'">My cards</button>
                </div>
            </div>
        </div>
        <div><jsp:include page="footer.jsp"></jsp:include></div>
    </body>
</html>
