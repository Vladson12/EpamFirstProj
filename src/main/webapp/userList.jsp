<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html style="background-color: #000000;">
    <head>
        <title>Library: Users</title>
    </head>

    <body style="background-color: rgba(255,255,255,0);">
        <div><jsp:include page="menuBar.jsp"></jsp:include></div>
        <div style="background-image: url(&quot;assets/img/1348229547604-e1432042866949.jpg&quot;);height: 650px;background-repeat: round;background-size: cover;">
                <form action="/users?show=" method="get">
                    <table>
                        <tr>
                            <th>Enter user login to find user:</th>
                            <td><input type="text" name="login" value=""></td>
                            <td><input type="submit" name="insert" value="Insert"></td>
                        </tr>
                    </table>
                </form>
                    <button onclick="location.href='/addUser'">+ Add new user </button>
            <table id="userTable">
                <tr style="font-size: 22px">
                    <th id="nameUL"  width="25%" onmouseover="this.style.cursor='pointer'" style="text-align: center">
                        Name
                    </th>
                    <th id="loginUL"  width="25%" onmouseover="this.style.cursor='pointer'" style="text-align: center">
                        Login
                    </th>
                    <th id="roleUL" width="25%" onmouseover="this.style.cursor='pointer'" style="text-align: center">
                        Role
                    </th>
                    <th width="25%" style="text-align: center">Actions</th>
                </tr>
                <c:forEach var="user" items="${users}">
                    <jsp:useBean id="user" scope="page" type="com.epam.app.model.User"/>
                    <c:set var="userRole" value="${sessionScope.loggedInUser.role}"/>
                    <c:set var="userLogin" value="${sessionScope.loggedInUser.login}"/>
                    <c:choose>
                        <c:when test="${((userRole eq 'LIBRARIAN') && (user.role eq 'READER'))
                            || ((userRole eq 'ADMINISTRATOR')&&(!userLogin.equals(user.login)))}">
                                <tr>
                                    <td><c:out value="${user.name}"/></td>
                                    <td><c:out value="${user.login}"/></td>
                                    <td><c:out value="${user.role}"/></td>
                                    <td style="text-align: center">
                                        <form action="/users?login=${user.login}&button=findCards" method="post">
                                            <input style="font-size: 16px" type="submit" value="Card List">
                                        </form>
                                        <form action="/users?login=${user.login}&button=edit" method="post">
                                            <input style="font-size: 16px" type="submit" value="Edit">
                                        </form>
                                    </td>
                                </tr>
                        </c:when>
                    </c:choose>
                </c:forEach>
            </table>
            <hr/>
            <table width="100%">
                <tr style="text-align: center">
                    <td>
                        <input style="font-size: 16px; text-align: left" type="button" value="Previous page"
                               onclick="location.href='/users?pageSide=previous'">
                        <input style="font-size: 16px; text-align: left" type="button" value="Next page"
                               onclick="location.href='/users?pageSide=next'">
                    </td>
                </tr>
            </table>
                <button class="w3-btn w3-round-large" onclick="location.href='/users'">To user list</button>
            <script type="text/javascript" src="cabinet/sorting.js"></script>
        </div>
        <div><jsp:include page="footer.jsp"></jsp:include></div>
    </body>
</html>