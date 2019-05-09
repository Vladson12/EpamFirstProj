<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html style="background-color: #000000;">
    <head>
        <title>Edit user</title>
    </head>

    <body style="background-color: rgba(255,255,255,0);">
        <div><jsp:include page="menuBar.jsp"></jsp:include></div>
        <div style="background-image: url(&quot;assets/img/1348229547604-e1432042866949.jpg&quot;);height: 650px;background-repeat: round;background-size: cover;">
                <h1>Library</h1>
                        <h2>Edit user</h2>
                    <form action="/users">
                        <jsp:useBean id="user" scope="session" type="com.epam.app.model.User"/>
                        <input value="" type="hidden" name="update" ><br />
                        <label>Name:
                            <input value="${user.name}" type="text" name="name"><br />
                        </label>
                        <label>Login:
                            <input value="${user.login}" type="text" name="login"><br />
                        </label>
                        <c:if test="${(sessionScope.loggedInUser.role eq 'ADMINISTRATOR') && (sessionScope.loggedInUser.role ne user.role)}">
                            <label>Genre: ${user.role}
                                <select name = "role">
                                    <option value = "READER" selected>READER</option>
                                    <option value = "LIBRARIAN">LIBRARIAN</option>
                                    <option value = "ADMINISTRATOR">ADMINISTRATOR</option>
                                </select>
                            </label>
                        </c:if>
                        <button type="submit">Edit</button>
                    </form>
                <button onclick="location.href='/users'">Back</button>
        </div>
        <div><jsp:include page="footer.jsp"></jsp:include></div>
    </body>
</html>
