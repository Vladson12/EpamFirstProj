<%--
  Created by IntelliJ IDEA.
  User: usr
  Date: 18.04.2019
  Time: 12:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login enter</title>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>

<jsp:include page="menuBar.jsp"></jsp:include>

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

</body>
</html>
