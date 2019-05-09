<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html style="background-color: #000000;">
    <head>
        <meta charset="UTF-8">
        <title>Library: Welcome</title>
    </head>

    <body style="background-color: rgba(255,255,255,0);">
        <div><jsp:include page="menuBar.jsp"></jsp:include></div>
        <div style="background-image: url(&quot;assets/img/1348229547604-e1432042866949.jpg&quot;);height: 650px;background-repeat: round;background-size: cover;">
            <center>
                <div class="w3-container w3-red w3-opacity-min w3-text-white w3-center-align">
                    <h1>Ooooops...Something went wrong! :(</h1>
                </div>
            </center>
        </div>
        <div><jsp:include page="footer.jsp"></jsp:include></div>
    </body>
</html>
