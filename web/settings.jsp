<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session"/>
<fmt:setLocale value="${language}"/>
<fmt:setBundle basename="internationalization.messages"/>

<html lang="${language}">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <title><fmt:message key="changepass_page.title"/></title>
    <style>
        body {
            font-family: Consolas;
        }
        div.setform {
            width: 40%;
            margin-left: 30%;
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

<body>

<jsp:include page="menuBar.jsp"></jsp:include>

<div class="setform">
    <div class="w3-container w3-padding">
        <h3><fmt:message key="changepass_page.header"/></h3>
            <p><%=(request.getAttribute("errMessage") == null) ? ""
                    : request.getAttribute("errMessage")%></p>

        <c:set var="user" value="${sessionScope.loggedInUser}"></c:set>
        <form name="form" method="post" class="w3-selection w3-light-gray w3-padding" action="settings?id=${user.id}" onsubmit="return validate()">
            <label><fmt:message key="changepass_page.oldpass"/>:
                <input type="password" name="oldPass" placeholder="<fmt:message key="changepass_page.oldpass_ph"/>" class="w3-input w3-animate-input w3-border w3-round-large"><br/>
            </label>
            <label><fmt:message key="changepass_page.newpass"/>:
                <input type="password" name="newPass" placeholder="<fmt:message key="changepass_page.newpass_ph"/>" class="w3-input w3-animate-input w3-border w3-round-large"><br/>
            </label>
            <label><fmt:message key="changepass_page.confnewpass"/>:
                <input type="password" name="confirmNewPass" placeholder="<fmt:message key="changepass_page.confnewpass_ph"/>" class="w3-input w3-animate-input w3-border w3-round-large"><br/>
            </label>
            <button type="submit" class="w3-btn w3-green w3-round-large w3-margin-bottom"><fmt:message key="changepass_page.savechanges_bn"/></button>
        </form>
    </div>
</div>

<div class="w3-container w3-grey w3-opacity w3-right-align w3-padding">
    <button class="w3-btn w3-round-large" onclick="location.href='..'">Back</button>
</div>

</body>
</html>


