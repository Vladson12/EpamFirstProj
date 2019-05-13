<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session"/>
<fmt:setLocale value="${language}"/>
<fmt:setBundle basename="internationalization.messages"/>

<html lang="${language}" style="background-color: #ffffff;">
<head>
    <title><fmt:message key="faq_page.title"/></title>
</head>

<body>
    <h2><fmt:message key="faq_page.header"/></h2>
    <p><fmt:message key="faq_page.question"/>: <fmt:message key="faq_page.question1"></fmt:message></p>
    <p><fmt:message key="faq_page.answer"/>: <fmt:message key="faq_page.answer1"></fmt:message></p>
    <p><fmt:message key="faq_page.question"/>: <fmt:message key="faq_page.question2"></fmt:message></p>
    <p><fmt:message key="faq_page.answer"/>: <fmt:message key="faq_page.answer2"></fmt:message></p>
    <p><fmt:message key="faq_page.question"/>: <fmt:message key="faq_page.question3"></fmt:message></p>
    <p><fmt:message key="faq_page.answer"/>: <fmt:message key="faq_page.answer3"></fmt:message></p>
</body>
</html>
