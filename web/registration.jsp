<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link rel="stylesheet" href="styles/w3.css">
    <title>Registration</title>

    <script>
        function validate() {
            var name = document.form.name.value;
            var login = document.form.login.value;
            var password = document.form.password.value;
            var conpassword = document.form.conpassword.value;

            // add validation ....@mail.ru
            //authorization
            if (name == null || name == "") {
                alert("Username can't be blank");
                return false;
            } else if (login == null || login == "") {
                alert("Email can't be blank");
                return false;
            } else if (password.length < 6) {
                alert("Password must be at least 6 characters long.");
                return false;
            } else if (password != conpassword) {
                alert("Confirm Password should match with the Password");
                return false;
            }
        }
    </script>
</head>
<body class="w3-light-grey">

<jsp:include page="menuBar.jsp"></jsp:include>

<div class="w3-container w3-blue-grey w3-opacity w3-right-align">
    <h1>Library</h1>
</div>

<center><h2>Create your Library account. It's free and only takes a minute. </h2></center>
<form name="form" action="registration" method="post" onsubmit="return validate()">
    <table align="center">

        <tr>
            <td>Username</td>
            <td><input type="text" name="name"/></td>
        </tr>
        <tr>
            <td>Email</td>
            <td><input type="email" name="login"/></td>
        </tr>
        <tr>
            <td>Password</td>
            <td><input type="password" name="password"/></td>
        </tr>
        <tr>
            <td>Confirm Password</td>
            <td><input type="password" name="conpassword"/></td>
        </tr>
        <tr>
            <td><%=(request.getAttribute("errMessage") == null) ? ""
                    : request.getAttribute("errMessage")%>
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <input type="submit" value="Register"></input><input
                    type="reset" value="Reset"></input></td>
        </tr>

    </table>
</form>

<div class="w3-container w3-grey w3-opacity w3-right-align w3-padding">
    <button class="w3-btn w3-round-large" onclick="location.href='..'">Back</button>
</div>

</body>
</html>