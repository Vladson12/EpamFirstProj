<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html style="background-color: #000000;">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
        <title>Library: Users</title>
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/fonts/fontawesome-all.min.css">
        <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
        <link rel="stylesheet" href="assets/fonts/googleapis.com.roboto.css">
        <link rel="stylesheet" href="assets/css/Bold-BS4-Footer-Big-Logo.css">
        <link rel="stylesheet" href="assets/css/Bootstrap-Theme-Switchers.css">
        <link rel="stylesheet" href="assets/css/dataTables.bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/aos-2.1.1.css">
        <link rel="stylesheet" href="assets/css/sticky-dark-top-nav-with-dropdown.css">
        <link rel="stylesheet" href="assets/css/styles.css">
        <link rel="stylesheet" href="assets/css/Table-With-Search.css">
        <link rel="stylesheet" href="assets/css/Toggle-Switch-1-1.css">
        <link rel="stylesheet" href="assets/css/Toggle-Switch-1.css">
        <link rel="stylesheet" href="assets/css/Toggle-Switch.css">
    </head>

    <body style="background-color: rgba(255,255,255,0);">
        <div style="height: 10vh"><jsp:include page="menuBar.jsp"></jsp:include></div>
        <div class="align-middle" style="height: 70vh;background-image: url(&quot;assets/img/1348229547604-e1432042866949.jpg&quot;);background-repeat: round;background-size: cover;">

            <div style="background-color: rgb(255,255,255);opacity: 0.84;font-size: 1vw; max-width: 1200px; margin:0 auto;">
                <div class="container">
                    <div class="row">
                        <div class="col">
                            <form action="/users?show=" method="get">
                                <label>Enter user login to find user:</label>
                                <label><input type="text" name="login" value=""></label>
                                <label><input type="submit" name="insert" value="Search"></label>
                            </form>
                        </div>
                        <div class="col">
                            <label><button onclick="location.href='/addUser'">+ Add new user</button></label>
                        </div>
                    </div>
                </div>
            </div>
            <div>
                <table id="userTable" class="table table-bordered table-hover table-sm" style="font-size: 1vw; max-width: 1200px; margin:0 auto;">
                    <thead class="bill-header cs" style="background-color: rgba(0,0,0,0.81);">
                        <tr style="text-align: center">
                            <th id="nameUL"   onmouseover="this.style.cursor='pointer'" class="col-lg-2" style="width: 34vh;">Name</th>
                            <th id="loginUL" onmouseover="this.style.cursor='pointer'" class="col-lg-3" style="width: 20vh;">Login</th>
                            <th id="roleUL"  onmouseover="this.style.cursor='pointer'" class="col-lg-2" style="width: 19vh;">Role</th>
                            <th class="col-lg-2" style="width: 19vh;">Actions</th>
                        </tr>
                    </thead>
                    <tbody style="background-color: #ffffff;">
                        <c:forEach var="user" items="${users}">
                            <jsp:useBean id="user" scope="page" type="com.epam.app.model.User"/>
                            <c:set var="userRole" value="${sessionScope.loggedInUser.role}"/>
                            <c:set var="userLogin" value="${sessionScope.loggedInUser.login}"/>
                            <c:choose>
                            <c:when test="${((userRole eq 'LIBRARIAN') && (user.role eq 'READER'))
                                || ((userRole eq 'ADMINISTRATOR')&&(!userLogin.equals(user.login)))}">
                            <tr style="padding: auto">
                                <td><c:out value="${user.name}"/></td>
                                <td><c:out value="${user.login}"/></td>
                                <td><c:out value="${user.role}"/></td>
                                <td style="text-align: center">
                                    <div class="container">
                                        <div class="row">
                                            <div class="col">
                                                <form action="/users?login=${user.login}&button=findCards" method="post">
                                                    <input type="submit" value="Card List">
                                                </form>
                                            </div>
                                            <div class="col">
                                                <form action="/users?login=${user.login}&button=edit" method="post">
                                                    <input type="submit" value="Edit">
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            </c:when>
                            </c:choose>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <div style="background-color: rgb(255,255,255);opacity: 0.84;font-size: 1vw; max-width: 1200px; margin:0 auto;">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12 align-self-center">
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
                        </div>
                    </div>
                </div>
            </div>


            <script src="assets/js/sorting.js"></script>
            <script src="assets/js/jquery.min.js"></script>
            <script src="assets/bootstrap/js/bootstrap.min.js"></script>
            <script src="assets/js/jquery.dataTables.min.js"></script>
            <script src="assets/js/dataTables.bootstrap.min.js"></script>
            <script src="assets/js/-Bootswatch-Theme-Switcher-BS4-.js"></script>
            <script src="assets/js/bs-animation.js"></script>
            <script src="assets/js/aos-2.1.1.js"></script>
            <script src="assets/js/Table-With-Search.js"></script>
        </div>
        <div style="height: 20vh;"><jsp:include page="footer.jsp"></jsp:include></div>
    </body>
</html>