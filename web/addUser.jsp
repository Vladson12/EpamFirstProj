<%--
  Created by IntelliJ IDEA.
  User: Konstantin
  Date: 2019-04-12
  Time: 12:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Add user</title>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

    <script>
        function validate() {

            var name = document.form.name.value;
            var login = document.form.login.value;

            if (name == null || name == "") {
                alert("Username can't be blank");
                return false;
            } else if (login == null || login == "") {
                alert("Email can't be blank");
                return false;
            }
        }
    </script>
</head>

<body>

<jsp:include page="menuBar.jsp"></jsp:include>

<center><h2>Add user</h2></center>
<form name="form" action="addUser" method="post" onsubmit="return validate()">
    <table align="center">

        <tr>
            <td>Username</td>
            <td><input type="text" name="name"/></td>
        </tr>

        <tr>
            <td>Email</td>
            <td><input type="text" name="login"/></td>
        </tr>

        <tr>
            <td><%=(request.getAttribute("errMessage") == null) ? ""
                    : request.getAttribute("errMessage")%>
            </td>
        </tr>

        <tr>
            <td></td>
            <td>
                <input type="submit" value="Add"/><input
                    type="reset" value="Reset"/></td>
        </tr>

    </table>
</form>

</body>
</html>

