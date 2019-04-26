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
    <title>Add User</title>
    <link rel="stylesheet" href="styles/w3.css">

    <script>
        function validate() {
            // var fullname = document.form.fullname.value;
            var name = document.form.name.value;
            var login = document.form.login.value;

            // if (fullname == null || fullname == "") {
            //     alert("Full Name can't be blank");
            //     return false;
            // } else if (email == null || email == "") {
            //     alert("Email can't be blank");
            //     return false;
// }
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
<center><h2>Create your LibraryApp account. It's free and only takes a minute. </h2></center>
<form name="form" action="AddNewUser" method="post" onsubmit="return validate()">
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
                <input type="submit" value="Add"></input><input
                    type="reset" value="Reset"></input></td>
        </tr>

    </table>
</form>

</body>
</html>

