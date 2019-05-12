<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session"/>
<fmt:setLocale value="${language}"/>
<fmt:setBundle basename="internationalization.messages"/>

<html lang="${language}">
<head>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <title><fmt:message key="cabinet_page.title"/></title>
    <style>
        body {
            font-family: Consolas;
        }

        button.w3-btn {
            color: black;
            size: legal;
            font-size: xx-large;
            background-color: #A9A9A9;
        }
    </style>
</head>

<body class="w3-light-grey">

<jsp:include page="menuBar.jsp"></jsp:include>

<div class="w3-container w3-center w3-hover-opacity-off">
    <h1><fmt:message key="cabinet_page.header"/></h1>
    <div class="w3-bar w3-padding-large w3-padding-24">
        <button class="w3-btn w3-opacity-min w3-round-large" onclick="location.href='/cabinet/profile?id=${sessionScope.loggedInUser.id}'"><fmt:message key="cabinet_page.profile_bn"/></button>
        <button class="w3-btn w3-opacity-min w3-round-large" onclick="location.href='/cabinet/settings?id=${sessionScope.loggedInUser.id}'"><fmt:message key="cabinet_page.changepass_bn"/></button>
        <button class="w3-btn w3-opacity-min w3-round-large" onclick="location.href='/cabinet/usercards?login=${sessionScope.loggedInUser.login}'"><fmt:message key="cabinet_page.mycards_bn"/></button>
    </div>
</div>

</body>
</html>
