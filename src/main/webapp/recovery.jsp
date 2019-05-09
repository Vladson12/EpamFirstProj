<%--
  Created by IntelliJ IDEA.
  User: vladd
  Date: 29.04.2019
  Time: 0:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Library: Password recovery</title>
    <style>
        div.recform {
            width: 40%;
            margin-left: 30%;
        }
    </style>
    <script>
        function validate() {
            var login = document.form.login.value;

            if (login == null || login == "") {
                alert("Email can't be blank");
                return false;
            }
        }
    </script>
</head>
<body class="w3-light-grey">

<jsp:include page="menuBarOld.jsp"></jsp:include>

<div class="recform">
    <div class="w3-container w3-padding w3-margin">
        <h2>Reset your password</h2>
        <p><%=(request.getAttribute("errMessage") == null) ? ""
                : request.getAttribute("errMessage")%></p>
        <form name="form" action="passwordRecovery" method="post" onsubmit="return validate()">
            <label>Email:
                <input type="email" name="login" class="w3-input w3-animate-input w3-border w3-round-large"><br/>
            </label>
            <button type="submit" class="w3-btn w3-green w3-round-large w3-right">Send password reset email</button>
        </form>
    </div>
</div>

<div class="w3-container w3-grey w3-opacity w3-right-align w3-padding">
    <button class="w3-btn w3-round-large" onclick="location.href='..'">Back</button>
</div>

</body>
</html>
