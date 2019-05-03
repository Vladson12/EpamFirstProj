<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: vladd
  Date: 28.04.2019
  Time: 18:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Personal Cabine: Profile</title>
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
        <h3>Profile</h3>
        <form method="post" class="w3-selection w3-light-gray w3-padding" action="profile?=${sessionScope.loggedInUser.id}">
            <jsp:useBean id="user" scope="session" type="com.epam.app.model.User"/>
            <input  value="${user.id}" type="hidden" name="id" class="w3-input w3-animate-input w3-border w3-round-large"><br/>
            <label>Name:
                <input value="${user.name}" type="text" name="name" class="w3-input w3-animate-input w3-border w3-round-large"><br/>
            </label>
            <label>Role:
                <c:set var="userRole" value="${sessionScope.loggedInUser.role}"></c:set>
                <c:choose>
                    <c:when test="${(userRole eq 'ADMINISTRATOR') && (sessionScope.loggedInUser.id ne user.id)}">
                        <%--<label>Role:--%>
                        <div class="w3-container">
                            <select class="w3-round-large" name="role">
                                <option value="READER" ${user.role eq 'READER' ? 'selected' : ''}>Reader</option>
                                <option value="LIBRARIAN" ${user.role eq 'LIBRARIAN' ? 'selected' : ''}>Librarian</option>
                                <option value="ADMINISTRATOR" ${user.role eq 'ADMINISTRATOR' ? 'selected' : ''}>Administrator</option>
                            </select>
                        </div>
                        <%--</label>--%>
                    </c:when>
                    <c:otherwise>
                        <%--<label>Role: --%>
                        <input value="${user.role}" type="text" name="name" disabled class="w3-input w3-animate-input w3-border w3-round-large"><br/>
                        <%--</label>--%>
                    </c:otherwise>
                </c:choose>
            </label>
            <label>Email:
                <input value="${user.login}" type="text" name="login" disabled class="w3-input w3-animate-input w3-border w3-round-large"><br/>
            </label>
            <button type="submit" class="w3-btn w3-green w3-round-large w3-margin-bottom">Save</button>
        </form>
    </div>
</div>

<div class="w3-container w3-grey w3-opacity w3-right-align w3-padding">
    <button class="w3-btn w3-round-large" onclick="location.href='..'">Back</button>
</div>

</body>
</html>
