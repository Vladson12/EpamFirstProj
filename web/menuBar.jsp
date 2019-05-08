<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<c:set var="language" value="${pageContext.request.locale}" scope="session"/>
<fmt:setLocale value="${language}"/>
<%--<fmt:setLocale value="${sessionScope.locale}"/>--%>
<fmt:setBundle basename="internationalization.messages"/>
<!DOCTYPE html>
<html lang="${language}">
<head>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <style>
        body {
            font-family: Consolas;
        }

        a.w3-bar-item {
            text-decoration: none;
        }

    </style>
</head>

<body>
    <div class="w3-container w3-black w3-opacity-min w3-text-white w3-right-align">
        <h1><fmt:message key="menu_bar.title"/></h1>
    </div>

    <div class="w3-bar w3-dark-gray w3-large w3-opacity-min w3-left-align" >
        <c:set var="loggedIn" value="${not empty loggedInUser}"/>
        <c:choose>
            <c:when test="${loggedIn}">
                <a href="${pageContext.request.contextPath}/home" class="w3-bar-item w3-left w3-hover-blue"><fmt:message key="menu_bar.home"/></a>
                <a href="${pageContext.request.contextPath}/logout" class="w3-bar-item w3-left w3-hover-blue"><fmt:message key="menu_bar.signin"/></a>
                <a href="${pageContext.request.contextPath}/cabinet" class="w3-bar-item w3-right w3-hover-blue">${loggedInUser.name}: ${loggedInUser.role}</a>
            </c:when>
            <c:otherwise>
                <a href="${pageContext.request.contextPath}/" class="w3-bar-item w3-hover-blue"><fmt:message key="menu_bar.home"/></a>
                <a href="${pageContext.request.contextPath}/login" class="w3-bar-item w3-hover-blue"><fmt:message key="menu_bar.signin"/></a>
                <a href="${pageContext.request.contextPath}/registration" class="w3-bar-item w3-hover-blue"><fmt:message key="menu_bar.signup"/></a>
            </c:otherwise>
        </c:choose>
        <form>
            <select class="w3-bar-item w3-dark-gray w3-opacity-min w3-hover-blue" id="language" name="language"  onchange="submit()">
                <option value=en" ${language == 'en' ? 'selected' : ''}><fmt:message key="menu_bar.lang_en"/></option>
                <option value="ru" ${language == 'ru' ? 'selected' : ''}><fmt:message key="menu_bar.lang_ru"/></option>
            </select>
        </form>
    </div>
</body>
</html>

