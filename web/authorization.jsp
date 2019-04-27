<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <title>Authorization</title>
    <script>
        function validate() {
            var login = document.form.login.value;
            var password = document.form.password.value;

            if (login == null || login == "") {
                alert("Email can't be blank");
                return false;
            } else if (password.length < 6) {
                alert("Password must be at least 6 characters long.");
                return false;
            }
        }
    </script>
</head>
<body class="w3-light-grey">

<jsp:include page="menuBar.jsp"></jsp:include>

<center><h2>Sign in to Library</h2></center>
<form name="form" action="login" method="post" onsubmit="return validate()">
    <table align="center">

        <tr>
            <td>Email address</td>
            <td><input type="email" name="login"/></td>
        </tr>
        <tr>
            <td>Password</td>
            <td><input type="password" name="password"/></td>
        </tr>
        <tr>
            <td><%=(request.getAttribute("errMessage") == null) ? ""
                    : request.getAttribute("errMessage")%>
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <input type="submit" value="Log in"></input><input
                    type="reset" value="Reset"></input></td>
        </tr>

    </table>
</form>

<div class="w3-container w3-grey w3-opacity w3-right-align w3-padding">
    <button class="w3-btn w3-round-large" onclick="location.href='..'">Back</button>
</div>

</body>
</html>