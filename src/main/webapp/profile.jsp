<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html style="background-color: #000000;">
    <head>
        <title>Personal Cabine: Profile</title>
    </head>

    <body style="background-color: rgba(255,255,255,0);">
        <div><jsp:include page="menuBar.jsp"></jsp:include></div>
        <div style="background-image: url(&quot;assets/img/1348229547604-e1432042866949.jpg&quot;);height: 650px;background-repeat: round;background-size: cover;">
                    <h3>Profile</h3>
                    <form method="post" action="profile?=${sessionScope.loggedInUser.id}">
                        <jsp:useBean id="user" scope="session" type="com.epam.app.model.User"/>
                        <input  value="${user.id}" type="hidden" name="id"><br/>
                        <label>Name:
                            <input value="${user.name}" type="text" name="name"><br/>
                        </label>
                        <label>Role:
                            <c:set var="userRole" value="${sessionScope.loggedInUser.role}"></c:set>
                            <c:choose>
                                <c:when test="${(userRole eq 'ADMINISTRATOR') && (sessionScope.loggedInUser.id ne user.id)}">
                                        <select class="w3-round-large" name="role">
                                            <option value="READER" ${user.role eq 'READER' ? 'selected' : ''}>Reader</option>
                                            <option value="LIBRARIAN" ${user.role eq 'LIBRARIAN' ? 'selected' : ''}>Librarian</option>
                                            <option value="ADMINISTRATOR" ${user.role eq 'ADMINISTRATOR' ? 'selected' : ''}>Administrator</option>
                                        </select>
                                </c:when>
                                <c:otherwise>
                                    <input value="${user.role}" type="text" name="name" disabled><br/>
                                </c:otherwise>
                            </c:choose>
                        </label>
                        <label>Email:
                            <input value="${user.login}" type="text" name="login" disabled><br/>
                        </label>
                        <button type="submit">Save</button>
                    </form>
                <button onclick="location.href='..'">Back</button>
        </div>
        <div><jsp:include page="footer.jsp"></jsp:include></div>
    </body>
</html>
