<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="${language}"/>
<fmt:setBundle basename="internationalization.messages"/>

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
                <a href="${pageContext.request.contextPath}/logout" class="w3-bar-item w3-left w3-hover-blue"><fmt:message key="menu_bar.signout"/></a>
                <a href="${pageContext.request.contextPath}/cabinet" class="w3-bar-item w3-right w3-hover-blue">
                    ${loggedInUser.name}: <c:if test="${loggedInUser.role eq 'ADMINISTRATOR'}">
                        <fmt:message key="menu_bar.admin"/>
                    </c:if>
                    <c:if test="${loggedInUser.role eq 'LIBRARIAN'}">
                        <fmt:message key="menu_bar.librarian"/>
                    </c:if>
                    <c:if test="${loggedInUser.role eq 'READER'}">
                        <fmt:message key="menu_bar.reader"/>
                    </c:if>
                </a>
            </c:when>
            <c:otherwise>
                <a href="${pageContext.request.contextPath}/" class="w3-bar-item w3-hover-blue"><fmt:message key="menu_bar.home"/></a>
                <a href="${pageContext.request.contextPath}/login" class="w3-bar-item w3-hover-blue"><fmt:message key="menu_bar.signin"/></a>
                <a href="${pageContext.request.contextPath}/registration" class="w3-bar-item w3-hover-blue"><fmt:message key="menu_bar.signup"/></a>
            </c:otherwise>
        </c:choose>
        <form>
            <c:forEach items="${param}" var="parameter">
                <c:if test="${parameter.key ne 'language'}">
                    <input type="hidden" name="${parameter.key}" value="${parameter.value}">
                </c:if>
            </c:forEach>
            <select class="w3-bar-item w3-dark-gray w3-opacity-min w3-hover-blue" id="language" name="language"  onchange="submit()">
                <option value="en" ${language == 'en' ? 'selected' : ''}><fmt:message key="menu_bar.lang_en"/></option>
                <option value="ru" ${language == 'ru' ? 'selected' : ''}><fmt:message key="menu_bar.lang_ru"/></option>
            </select>
        </form>
    </div>
</body>
</html>

