<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <title>Personal Cabinet: Profile</title>
    <style>
        body {
            font-family: Consolas;
        }
    </style>
    <script>
        function validate() {
            var oldPassword = document.form.oldPass.value;
            var newPassword = document.form.newPass.value;
            var confirmNewPassword = document.form.confirmNewPass.value;

            if (oldPassword.length < 6) {
                alert("Old password is at least 6 characters long");
                return false;
            } else if (newPassword.length < 6) {
                alert("New password must be at least 6 characters long.");
                return false;
            } else if (newPassword !== confirmNewPassword) {
                alert("ConfirmPassword should match the newPassword");
                return false;
            }
        }
    </script>
</head>

<body class="w3-light-grey">

<jsp:include page="menuBar.jsp"></jsp:include>


<div class="w3-container w3-padding">
    <h3>Change password</h3>
        <p><%=(request.getAttribute("errMessage") == null) ? ""
                : request.getAttribute("errMessage")%></p>

    <c:set var="user" value="${sessionScope.loggedInUser}"></c:set>
    <form name="form" method="post" class="w3-selection w3-light-grey w3-padding" action="settings?id=${user.id}" onsubmit="return validate()">
        <label>Old password:
            <input type="password" name="oldPass" class="w3-input w3-animate-input w3-border w3-round-large"><br/>
        </label>
        <label>New password:
            <input type="password" name="newPass" class="w3-input w3-animate-input w3-border w3-round-large"><br/>
        </label>
        <label>Confirm new password:
            <input type="password" name="confirmNewPass" class="w3-input w3-animate-input w3-border w3-round-large"><br/>
        </label>
        <button type="submit" class="w3-btn w3-green w3-round-large w3-margin-bottom">Save</button>
    </form>
</div>

<div class="w3-container w3-grey w3-opacity w3-right-align w3-padding">
    <button class="w3-btn w3-round-large" onclick="location.href='..'">Back</button>
</div>

</body>
</html>


