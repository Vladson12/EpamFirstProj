<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html style="background-color: #000000;">
    <head>
        <meta charset="UTF-8">
        <title>Library: Welcome</title>
    </head>

    <body style="background-color: rgba(255,255,255,0);">
        <div style="height: 10vh;"><jsp:include page="menuBar.jsp"></jsp:include></div>
        <div style="height: 70vh;background-image: url(assets/img/1348229547604-e1432042866949.jpg);background-repeat: round;background-size: cover;">
            <div style="background-color: rgb(255,255,255);opacity: 0.84;font-size: 1vw; max-width: 500px; margin:0 auto;">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12 align-self-center">
                            <h1>Ooooops...Something went wrong! :(</h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div style="height: 20vh;"><jsp:include page="footer.jsp"></jsp:include></div>
    </body>
</html>
