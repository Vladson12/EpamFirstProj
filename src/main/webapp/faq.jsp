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
    <title><fmt:message key="faq_page.title"/></title>
</head>

<body style="background-color: rgba(255,255,255,0);">
    <div style="height: 10vh;"><jsp:include page="menuBar.jsp"></jsp:include></div>
    <div class="d-flex" style="min-height: 70vh; background-image: url(assets/img/1348229547604-e1432042866949.jpg);background-repeat: round;background-size: cover;">
        <div style="min-width: 60vw; margin:0 auto; margin-top: 1vh;">
            <div class="container-fluid" >
                <div class="row" style="background-color: #ffffff;">
                    <div style="font-size: 1rem;">
                        <div style="float: left;">
                            <h2><fmt:message key="faq_page.header"/></h2>
                            <p><fmt:message key="faq_page.question"/>: <fmt:message key="faq_page.question1"></fmt:message></p>
                            <p><fmt:message key="faq_page.answer"/>: <fmt:message key="faq_page.answer1"></fmt:message></p>
                            <p><fmt:message key="faq_page.question"/>: <fmt:message key="faq_page.question2"></fmt:message></p>
                            <p><fmt:message key="faq_page.answer"/>: <fmt:message key="faq_page.answer2"></fmt:message></p>
                            <p><fmt:message key="faq_page.question"/>: <fmt:message key="faq_page.question3"></fmt:message></p>
                            <p><fmt:message key="faq_page.answer"/>: <fmt:message key="faq_page.answer3"></fmt:message></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div style="height: 20vh;"><jsp:include page="footer.jsp"></jsp:include></div>
</body>
</html>
