<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html style="background-color: #000000;">
    <head>
        <title>Login enter</title>
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    </head>

    <body style="background-color: rgba(255,255,255,0);">
        <div><jsp:include page="menuBar.jsp"></jsp:include></div>
        <div style="background-image: url(&quot;assets/img/1348229547604-e1432042866949.jpg&quot;);height: 650px;background-repeat: round;background-size: cover;">
            <center>
                <form name="findUserCards" action="findUserCards" method="post">
                    <table border="1" bgcolor="A9A9A9">
                        <tr>
                            <th>Enter user login : </th>
                            <td><input type="text" name="login" value=""></td>
                        </tr>
                        <tr>
                        <tr>
                            <table>
                                <tr>
                                    <td><input type="submit" name="insert" value="Insert"></td>
                                </tr>
                            </table>
                        </tr>
                    </table>
                </form>
            </center>
        </div>
        <div><jsp:include page="footer.jsp"></jsp:include></div>
    </body>
</html>
