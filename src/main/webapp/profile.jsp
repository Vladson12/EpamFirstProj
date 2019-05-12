<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session"/>
<fmt:setLocale value="${language}"/>
<fmt:setBundle basename="internationalization.messages"/>

<html lang="${language}" style="background-color: #000000;">
<head>
    <title><fmt:message key="profile_page.title"/></title>
</head>
<body style="background-color: rgba(255,255,255,0);">
        <div><jsp:include page="menuBar.jsp"></jsp:include></div>
        <div style="background-image: url(&quot;assets/img/1348229547604-e1432042866949.jpg&quot;);height: 650px;background-repeat: round;background-size: cover;">
            <h3><fmt:message key="profile_page.header"/></h3>
            <br method="post" action="profile?=${sessionScope.loggedInUser.id}">
            <jsp:useBean id="user" scope="session" type="com.epam.app.model.User"/>
            <input  value="${user.id}" type="hidden" name="id"><br/>
            <label><fmt:message key="profile_page.name"/>
                <input value="${user.name}" placeholder="<fmt:message key="profile_page.name_ph"/>" type="text" name="name"><br/>
            </label></br>
            <label><fmt:message key="profile_page.role"/>
                <select name="role" disabled>
                    <option value="READER" ${user.role eq 'READER' ? 'selected' : ''}><fmt:message key="role.reader"/></option>
                    <option value="LIBRARIAN" ${user.role eq 'LIBRARIAN' ? 'selected' : ''}><fmt:message key="role.librarian"/></option>
                    <option value="ADMINISTRATOR" ${user.role eq 'ADMINISTRATOR' ? 'selected' : ''}><fmt:message key="role.admin"/></option>
                </select>
            </label>
            <label><fmt:message key="profile_page.login"/>
                <input value="${user.login}" type="text" name="login" disabled><br/>
            </label>
            <button type="submit"><fmt:message key="profile_page.savechanges_bn"/></button>
    </form>
    <button onclick="location.href='..'"><fmt:message key="back.bn"/></button>
</div>
<div style="height: 20vh;"><jsp:include page="footer.jsp"></jsp:include></div>
</body>
</html>
