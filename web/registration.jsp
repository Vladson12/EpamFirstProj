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
    <title><fmt:message key="registration_page.title"/></title>
    <style>
        body {
            font-family: Consolas;
        }
        div.signupform {
            width: 40%;
            margin-left: 30%;
        }
    </style>
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
<body>

<jsp:include page="menuBar.jsp"></jsp:include>

<div class="signupform">
    <div class="w3-container w3-light-gray w3-padding w3-margin">
        <h2 class="w3-text w3-center"><fmt:message key="registration_page.signup"/></h2>
        <p><%=(request.getAttribute("errMessage") == null) ? ""
                : request.getAttribute("errMessage")%></p>
        <form name="form" action="registration" method="post" onsubmit="return validate()">
            <label><fmt:message key="registration_page.username"/>:
                <input type="text" placeholder="<fmt:message key="registration_page.username_ph"/>" name="name" class="w3-input w3-animate-input w3-border w3-round-large"><br/>
            </label>
            <label><fmt:message key="registration_page.email"/>:
                <input type="email" placeholder="<fmt:message key="registration_page.email_ph"/>" name="login" class="w3-input w3-animate-input w3-border w3-round-large"><br/>
            </label>
            <label><fmt:message key="registration_page.password"/>:
                <input type="password" placeholder="<fmt:message key="registration_page.password_ph"/>" name="password" class="w3-input w3-animate-input w3-border w3-round-large"><br/>
            </label>
            <label><fmt:message key="registration_page.confirm"/>:
                <input type="password" placeholder="<fmt:message key="registration_page.confirm_ph"/>" name="conpassword" class="w3-input w3-animate-input w3-border w3-round-large"><br/>
            </label>
            <div class="w3-bar w3-center">
                <button type="submit" class="w3-btn w3-green w3-round-large w3-right"><fmt:message key="registration_page.create_bn"/></button>
            </div>
        </form>
    </div>
</div>

<div class="w3-container w3-grey w3-opacity w3-right-align w3-padding">
    <button class="w3-btn w3-round-large" onclick="location.href='..'">Back</button>
</div>

</body>
</html>