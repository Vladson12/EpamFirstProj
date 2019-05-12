<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session"/>
<fmt:setLocale value="${language}"/>
<fmt:setBundle basename="internationalization.messages"/>

<html lang="${language}">
<head>
    <title><fmt:message key="profile_page.title"/></title>
    <style>
        body {
            font-family: Consolas;
        }
        div.profform {
            width: 40%;
            margin-left: 30%;
        }
    </style>
</head>
<body>

<jsp:include page="menuBar.jsp"></jsp:include>

<div class="profform">
    <div class="w3-container w3-padding">
        <h3><fmt:message key="profile_page.header"/></h3>
        <form method="post" class="w3-selection w3-light-gray w3-padding" action="profile?id=${sessionScope.loggedInUser.id}">
            <jsp:useBean id="user" scope="session" type="com.epam.app.model.User"/>
            <input  value="${user.id}" type="hidden" name="id" class="w3-input w3-animate-input w3-border w3-round-large"><br/>
            <label><fmt:message key="profile_page.name"/>:
                <input value="${user.name}" type="text" name="name" placeholder="<fmt:message key="profile_page.name_ph"/>" class="w3-input w3-animate-input w3-border w3-round-large"><br/>
            </label>
            <label><fmt:message key="profile_page.role"/>:
                <c:set var="userRole" value="${sessionScope.loggedInUser.role}"></c:set>
                <c:choose>
                    <c:when test="${(userRole eq 'ADMINISTRATOR') && (sessionScope.loggedInUser.id ne user.id)}">
                        <div class="w3-container">
                            <select class="w3-round-large" name="role">
                                <option value="READER" ${user.role eq 'READER' ? 'selected' : ''}><fmt:message key="profile_page.reader"/></option>
                                <option value="LIBRARIAN" ${user.role eq 'LIBRARIAN' ? 'selected' : ''}><fmt:message key="profile_page.librarian"/></option>
                                <option value="ADMINISTRATOR" ${user.role eq 'ADMINISTRATOR' ? 'selected' : ''}><fmt:message key="profile_page.admin"/></option>
                            </select>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <input value=
                               <c:if test="${user.role eq 'ADMINISTRATOR'}">
                                   <fmt:message key="profile_page.admin"/>
                               </c:if>
                               <c:if test="${user.role eq 'LIBRARIAN'}">
                                   <fmt:message key="profile_page.librarian"/>
                               </c:if>
                               <c:if test="${user.role eq 'READER'}">
                                   <fmt:message key="profile_page.reader"/>
                               </c:if>
                                       type="text" name="name" disabled class="w3-input w3-animate-input w3-border w3-round-large"><br/>
                    </c:otherwise>
                </c:choose>
            </label>
            <label>Email:
                <input value="${user.login}" type="text" name="login" disabled class="w3-input w3-animate-input w3-border w3-round-large"><br/>
            </label>
            <button type="submit" class="w3-btn w3-green w3-round-large w3-margin-bottom"><fmt:message key="profile_page.savechanges_bn"/></button>
        </form>
    </div>
</div>

<div class="w3-container w3-grey w3-opacity w3-right-align w3-padding">
    <button class="w3-btn w3-round-large" onclick="location.href='..'">Back</button>
</div>

</body>
</html>
