<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session"/>
<fmt:setLocale value="${language}"/>
<fmt:setBundle basename="internationalization.messages"/>

<html lang="${language}" style="background-color: #000000;">
<head>
    <meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <link rel="icon" type="image/ico" href="assets/img/LibLogo.jpg" />
    <title>
        <c:choose>
            <c:when test="${sessionScope.loggedInUser == null}">
                <fmt:message key="welcome_page.title"/>
            </c:when>
            <c:otherwise>
                <fmt:message key="home_page.title"/>
            </c:otherwise>
        </c:choose>
    </title>
</head>

<body style="background-color: rgba(255,255,255,0);vertical-align: center;">
<div style="height: 10vh;"><jsp:include page="menuBar.jsp"></jsp:include></div>
<div style="height: 70vh; background-image: url(assets/img/1348229547604-e1432042866949.jpg);background-repeat: round;background-size: cover;"></div>
<div style="height: 20vh;"><jsp:include page="footer.jsp"></jsp:include></div>
</body>
</html>
