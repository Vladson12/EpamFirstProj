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
        <title><fmt:message key="profile_page.title"/></title>
        <script>
            function validate() {
                var name = document.form.name.value;
                if (name == null || name == "") {
                    alert("Username can't be blank");
                    return false;
                } else {
                    alert("The operation was successful");
                    return true;
                }
            }
        </script>
    </head>

    <body style="background-color: rgba(255,255,255,0);">
        <div style="height: 10vh;"><jsp:include page="menuBar.jsp"></jsp:include></div>
        <div class="d-flex" style="height: 70vh;background-image: url(assets/img/1348229547604-e1432042866949.jpg);background-repeat: round;background-size: cover;">
            <div class="align-self-center" style="background-color: rgb(255,255,255);opacity: 0.84;font-size: 1vw; max-width: 500px; margin:0 auto;">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12 align-self-center">
                            <h3><fmt:message key="profile_page.header"/></h3>
                            <form name="form" method="post" action="profile?=${sessionScope.loggedInUser.id}" onsubmit="return validate()">
                                <jsp:useBean id="user" scope="session" type="com.epam.app.model.User"/>
                                <label><input  value="${user.id}" type="hidden" name="id"></label>
                                <label><fmt:message key="profile_page.name"/></label>
                                <label><input value="${user.name}" placeholder="<fmt:message key="profile_page.name_ph"/>" type="text" name="name"></label>
                                <label><fmt:message key="profile_page.role"/></label>
                                <label>
                                    <select name="role" disabled>
                                        <option value="READER" ${user.role eq 'READER' ? 'selected' : ''}><fmt:message key="role.reader"/></option>
                                        <option value="LIBRARIAN" ${user.role eq 'LIBRARIAN' ? 'selected' : ''}><fmt:message key="role.librarian"/></option>
                                        <option value="ADMINISTRATOR" ${user.role eq 'ADMINISTRATOR' ? 'selected' : ''}><fmt:message key="role.admin"/></option>
                                    </select>
                                </label>
                                <label><fmt:message key="profile_page.login"/></label>
                                <label><input value="${user.login}" type="text" name="login" disabled></label>
                                <label><button type="submit"><fmt:message key="profile_page.savechanges_bn"/></button></label>
                            </form>
                            <label><button onclick="location.href='/cabinet'"><fmt:message key="back.bn"/></button></label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div style="height: 20vh;"><jsp:include page="footer.jsp"></jsp:include></div>
    </body>
</html>
