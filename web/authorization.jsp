<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session"/>
<fmt:setLocale value="${language}"/>
<fmt:setBundle basename="internationalization.messages"/>


<html lang="${language}">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <title><fmt:message key="authorization_page.title"/></title>
    <style>
        body {
            font-family: Consolas;
        }
        div.signinform {
            width: 40%;
            margin-left: 30%;
        }
    </style>
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
<body>

<jsp:include page="menuBar.jsp"></jsp:include>

<div class="signinform">
    <div class="w3-container w3-light-gray w3-padding w3-margin">
        <h2 class="w3-text w3-center"><fmt:message key="authorization_page.signin"/></h2>
        <p><%=(request.getAttribute("errMessage") == null) ? ""
                : request.getAttribute("errMessage")%></p>
        <form name="form" action="login" method="post" onsubmit="return validate()">
            <label><fmt:message key="authorization_page.email"/>:
                <input type="email" name="login" placeholder="<fmt:message key="authorization_page.email_ph"/>" class="w3-input w3-animate-input w3-border w3-round-large"><br/>
            </label>
            <label><fmt:message key="authorization_page.password"/>:
                <input type="password" name="password" placeholder="<fmt:message key="authorization_page.password_ph"/>" class="w3-input w3-animate-input w3-border w3-round-large"><br/>
            </label>
            <div class="w3-bar w3-center">
                <button type="submit" class="w3-btn w3-green w3-round-large w3-right"><fmt:message key="authorization_page.signin_bn"/></button>
                <a href="${pageContext.request.contextPath}/passwordRecovery" class="w3-bar-item w3-left"><fmt:message key="authorization_page.password_recovery"/></a>
            </div>
        </form>
    </div>
</div>

<div class="w3-container w3-grey w3-opacity w3-right-align w3-padding">
    <button class="w3-btn w3-round-large" onclick="location.href='..'">Back</button>
</div>

</body>
</html>