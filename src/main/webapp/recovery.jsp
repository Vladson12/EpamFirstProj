<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="${language}"/>
<fmt:setBundle basename="internationalization.messages"/>

<html lang="${language}" style="background-color: #000000;">
    <head>
        <title><fmt:message key="recovery_page.title"/></title>
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

    <body style="background-color: rgba(255,255,255,0);">
        <div style="height: 10vh"><jsp:include page="menuBar.jsp"></jsp:include></div>
        <div style="height: 70vh;background-image: url(assets/img/1348229547604-e1432042866949.jpg);background-repeat: round;background-size: cover;">
                    <h2><fmt:message key="recovery_page.recovery"/></h2>
                    <p><%=(request.getAttribute("errMessage") == null) ? "" : request.getAttribute("errMessage")%></p>
                    <form name="form" action="passwordRecovery" method="post" onsubmit="return validate()">
                        <label><fmt:message key="recovery_page.email"/>:
                            <input type="email" placeholder="<fmt:message key="recovery_page.email_ph"/>" name="login"><br/>
                        </label>
                        <button type="submit"><fmt:message key="recovery_page.signin_bn"/></button>
                    </form>
                <button onclick="location.href='..'">Back</button>
        </div>
        <div style="height: 20vh;"><jsp:include page="footer.jsp"></jsp:include></div>
    </body>
</html>
