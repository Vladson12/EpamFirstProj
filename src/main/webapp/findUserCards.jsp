<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html style="background-color: #000000;">
    <head>
        <title>Login enter</title>
    </head>

    <body style="background-color: rgba(255,255,255,0);">
        <div style="height: 10vh;"><jsp:include page="menuBar.jsp"></jsp:include></div>
        <div style="height: 70vh;background-image: url(assets/img/1348229547604-e1432042866949.jpg);background-repeat: round;background-size: cover;">
                <form name="findUserCards" action="findUserCards" method="post">
                    <table border="1" bgcolor="A9A9A9">
                        <tr>
                            <th>Enter user login : </th>
                            <td>
                                <input type="text" name="login" value="">
                            </td>
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
        </div>
        <div style="height: 20vh"><jsp:include page="footer.jsp"></jsp:include></div>
    </body>
</html>
