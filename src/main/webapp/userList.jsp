<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session"/>
<fmt:setLocale value="${language}"/>
<fmt:setBundle basename="internationalization.messages"/>

<html lang="${language}" style="background-color: #000000;">
    <head>
        <meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
        <title><fmt:message key="userlist_page.title"/></title>
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
        <div class="d-flex" style="min-height: 70vh;background-image: url(assets/img/1348229547604-e1432042866949.jpg);background-repeat: round;background-size: cover;">
            <div class="align-self-center" style="background-color: rgb(255,255,255); max-width: 1200px; font-size: 0.85rem; margin:0 auto;">
                <div class="container">
                    <div class="row">
                        <div class="col" style="font-size: 0.85rem;">
                            <form action="/users?show=" method="get">
                                <label><fmt:message key="user_search.by_login"/></label>
                                <label><input type="text" name="login" value=""></label>
                                <label><input type="submit" name="insert" value="<fmt:message key="user_search.search_bn"/>"></label>
                            </form>
                        </div>
                        <div class="col">
                            <label><button onclick="location.href='/addUser'"><fmt:message key="userlist_page.adduser_bn"/></button></label>
                        </div>
                    </div>
                </div>
                <div>
                    <table id="userTable" class="table table-bordered table-hover table-sm" style="font-size: 0.85rem; max-width: 1200px; margin:0 auto;">
                        <thead class="bill-header cs" style="background-color: rgba(0,0,0,0.90);">
                        <tr style="text-align: center">
                            <th id="nameUL"   onmouseover="this.style.cursor='pointer'" class="col-lg-2" style="width: 39vh;"><fmt:message key="userlist_page.table_username"/></th>
                            <th id="loginUL" onmouseover="this.style.cursor='pointer'" class="col-lg-3" style="width: 30vh;"><fmt:message key="userlist_page.table_login"/></th>
                            <th id="roleUL"  onmouseover="this.style.cursor='pointer'" class="col-lg-2" style="width: 12vh;"><fmt:message key="userlist_page.table_role"/></th>
                            <th                                                         class="col-lg-2" style="width: 19vh;"><fmt:message key="userlist_page.table_actions"/></th>
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
                                        <c:choose>
                                            <c:when test="${user.role eq 'ADMINISTRATOR'}">
                                                <td><fmt:message key="role.admin"/></td>
                                            </c:when>
                                            <c:when test="${user.role eq 'LIBRARIAN'}">
                                                <td><fmt:message key="role.librarian"/></td>
                                            </c:when>
                                            <c:otherwise>
                                                <td><fmt:message key="role.reader"/></td>
                                            </c:otherwise>
                                        </c:choose>

                                        <td style="text-align: center">
                                            <div class="container">
                                                <div class="row">
                                                    <div class="col">
                                                        <form action="/users?login=${user.login}&button=findCards" method="post">
                                                            <input type="submit" value="<fmt:message key="userlist_page.actions_cardlist"/>">
                                                        </form>
                                                </div>
                                                <div class="col">
                                                        <form action="/users?login=${user.login}&button=edit" method="post">
                                                            <input type="submit" value="<fmt:message key="userlist_page.actions_edit"/>">
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                </c:when>
                                <c:when test="${((userRole eq 'LIBRARIAN') &&(!userLogin.equals(user.login)) &&
                                    ((user.role eq 'LIBRARIAN')||(user.role eq 'ADMINISTRATOR')))}">
                                    <tr style="padding: auto">
                                        <td><c:out value="${user.name}"/></td>
                                        <td><c:out value="${user.login}"/></td>
                                        <td><c:out value="${user.role}"/></td>
                                        <td style="text-align: center">
                                            <div class="container">
                                                <div class="row">
                                                    <div class="col">
                                                        <form action="/users?login=${user.login}&button=findCards" method="post">
                                                            <input type="submit" value="<fmt:message key="userlist_page.actions_cardlist"/>">
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
                <div style="background-color: rgba(0,0,0,0.90);;font-size: 0.85rem; max-width: 1200px; margin:0 auto;">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12 align-self-center">
                                <input type="button" value="<fmt:message key="pagination.previous_page"/>"
                                       onclick="location.href='/users?pageSide=previous'">
                                <input type="button" value="<fmt:message key="pagination.next_page"/>"
                                       onclick="location.href='/users?pageSide=next'">
                                <button onclick="location.href='/users'"><fmt:message key="userlist_page.touserlist_bn"/></button>
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
        </div>
        <div style="height: 20vh;"><jsp:include page="footer.jsp"></jsp:include></div>
    </body>
</html>