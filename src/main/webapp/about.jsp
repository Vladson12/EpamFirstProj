<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session"/>
<fmt:setLocale value="${language}"/>
<fmt:setBundle basename="internationalization.messages"/>

<html lang="${language}" style="background-color: #ffffff;">
<head>
    <title><fmt:message key="aboutus_page.title"/></title>
</head>

<body>
    <h4><fmt:message key="aboutus_page.header"/></h4>
    <p><fmt:message key="aboutus_page.text"/></p>
</body>
</html>
