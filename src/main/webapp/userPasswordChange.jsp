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
    <title><fmt:message key="changepass_page.title"/></title>
    <script>
        function validate() {
            var oldPassword = document.form.oldPass.value;
            var newPassword = document.form.newPass.value;
            var confirmNewPassword = document.form.confirmNewPass.value;

            if (oldPassword.length < 6) {
                alert("Old password is at least 6 characters long");
                return false;
            } else if (newPassword.length < 6) {
                alert("New password must be at least 6 characters long.");
                return false;
            } else if (newPassword !== confirmNewPassword) {
                alert("ConfirmPassword should match the newPassword");
                return false;
            } else alert("Password has been changed!");
            return true;
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
                    <label><h3><fmt:message key="changepass_page.header"/></h3></label>
                    <label>
                        <p>
                        <%=(request.getAttribute("errMessage") == null) ? "" : request.getAttribute("errMessage")%>
                        </p>
                    </label>
                    <c:set var="user" value="${sessionScope.loggedInUser}"></c:set>
                    <form name="form" method="post" action="changePassword?id=${user.id}" onsubmit="return validate()">
                        <label><fmt:message key="changepass_page.oldpass"/>:</label>
                        <label><input type="password" placeholder="<fmt:message key="changepass_page.oldpass_ph"/>" name="oldPass"></label>
                        <label><fmt:message key="changepass_page.newpass"/>:</label>
                        <label><input type="password" placeholder="<fmt:message key="changepass_page.newpass_ph"/>" name="newPass"></label>
                        <label><fmt:message key="changepass_page.confnewpass"/>:</label>
                        <label><input type="password" placeholder="<fmt:message key="changepass_page.confnewpass_ph"/>" name="confirmNewPass"></label>
                        <label><button type="submit"><fmt:message key="changepass_page.savechanges_bn"/></button></label>
                    </form>
                    <label><button onclick="location.href='/cabinet'"><fmt:message key="back.bn"/></button></label>
                </div>
            </div>
        </div>
    </div>
</div>
<div style="height: 20vh"><jsp:include page="footer.jsp"></jsp:include></div>
</body>
</html>


