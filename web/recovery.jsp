<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="${language}"/>
<fmt:setBundle basename="internationalization.messages"/>

<html lang="${language}">
<head>
    <title><fmt:message key="recovery_page.title"/></title>
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

<jsp:include page="menuBar.jsp"></jsp:include>

<div class="recform">
    <div class="w3-container w3-padding w3-margin">
        <h2><fmt:message key="recovery_page.recovery"/></h2>
        <p><%=(request.getAttribute("errMessage") == null) ? ""
                : request.getAttribute("errMessage")%></p>
        <form name="form" action="passwordRecovery" method="post" onsubmit="return validate()">
            <label><fmt:message key="recovery_page.email"/>:
                <input type="email" name="login" placeholder="<fmt:message key="recovery_page.email_ph"/>" class="w3-input w3-animate-input w3-border w3-round-large"><br/>
            </label>
            <button type="submit" class="w3-btn w3-green w3-round-large w3-right"><fmt:message key="recovery_page.signin_bn"/></button>
        </form>
    </div>
</div>

<div class="w3-container w3-grey w3-opacity w3-right-align w3-padding">
    <button class="w3-btn w3-round-large" onclick="location.href='..'">Back</button>
</div>

</body>
</html>
