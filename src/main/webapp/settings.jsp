<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session"/>
<fmt:setLocale value="${language}"/>
<fmt:setBundle basename="internationalization.messages"/>

<html lang="${language}" style="background-color: #000000;">
<head>
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
            }
        }
    </script>
</head>

<body style="background-color: rgba(255,255,255,0);">
<div style="height: 10vh;"><jsp:include page="menuBar.jsp"></jsp:include></div>
<div style="height: 70vh;background-image: url(assets/img/1348229547604-e1432042866949.jpg);background-repeat: round;background-size: cover;">
    <h3><fmt:message key="changepass_page.header"/></h3>
    <p>
        <%=(request.getAttribute("errMessage") == null) ? "" : request.getAttribute("errMessage")%>
    </p>
    <c:set var="user" value="${sessionScope.loggedInUser}"></c:set>
    <form name="form" method="post" action="settings?id=${user.id}" onsubmit="return validate()">
        <label><fmt:message key="changepass_page.oldpass"/>:
            <input type="password" placeholder="<fmt:message key="changepass_page.oldpass_ph"/>" name="oldPass"><br/>
        </label>
        <label><fmt:message key="changepass_page.newpass"/>:
            <input type="password" placeholder="<fmt:message key="changepass_page.newpass_ph"/>" name="newPass"><br/>
        </label>
        <label><fmt:message key="changepass_page.confnewpass"/>:
            <input type="password" placeholder="<fmt:message key="changepass_page.confnewpass_ph"/>" name="confirmNewPass"><br/>
        </label>
        <button type="submit"><fmt:message key="changepass_page.savechanges_bn"/></button>
    </form>
    <button onclick="location.href='..'">Back</button>
</div>
<div style="height: 20vh"><jsp:include page="footer.jsp"></jsp:include></div>
</body>
</html>


