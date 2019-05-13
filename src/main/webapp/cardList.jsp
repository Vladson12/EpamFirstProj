<%@ page import="com.epam.app.model.enums.CardState" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session"/>
<fmt:setLocale value="${language}"/>
<fmt:setBundle basename="internationalization.messages"/>

<html lang="${language}" style="background-color: #000000;">
    <head>
        <meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
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
        <title><fmt:message key="cardlist_page.title"/></title>

        <script language="JavaScript" >
            function open_window() {
                window.open("view/dateFormat.jsp" ,null,
                    "height=200,width=400,status=yes,toolbar=no,menubar=no,location=no");
            }
        </script>
    </head>

    <body style="background-color: rgba(255,255,255,0);">
    <div style="height: 10vh;"><jsp:include page="menuBar.jsp"></jsp:include></div>
    <div class="d-flex" style="min-height: 70vh;background-image: url(assets/img/1348229547604-e1432042866949.jpg);background-repeat: round;background-size: cover;">
        <div class="align-self-center" style="background-color: rgb(255,255,255); margin:0 auto; max-width: 1200px;">
            <div class="container">
                <div class="row">
                    <div class="col" style="font-size: 0.85rem;">
                        <h1><c:out value="${login}" /></h1>
                    </div>
                </div>
            </div>
            <div>
                <table id="userCard" class="table table-bordered table-hover table-sm" style="font-size: 0.85rem; max-width: 1200px; margin:0 auto;">
                    <thead class="bill-header cs" style="background-color: rgba(0,0,0,0.90);">
                        <tr style="text-align: center">
                            <th                                                           class="col" style="width: 5vh;">№</th>
                            <th id="bookCL"     onmouseover="this.style.cursor='pointer'" class="col" style="width: 27vh;"><fmt:message key="cardlist_page.table_book"/></th>
                            <th id="fromCL"     onmouseover="this.style.cursor='pointer'" class="col" style="width: 15vh;"><fmt:message key="cardlist_page.table_from"/></th>
                            <th id="toCL"       onmouseover="this.style.cursor='pointer'" class="col" style="width: 15vh;"><fmt:message key="cardlist_page.table_to"/></th>
                            <th id="stateCL"    onmouseover="this.style.cursor='pointer'" class="col" style="width: 19vh;"><fmt:message key="cardlist_page.table_state"/></th>
                            <th                                                           class="col" style="width: 19vh;"><fmt:message key="cardlist_page.table_actions"/></th>
                        </tr>
                    </thead>
                    <tbody style="background-color: #ffffff;">
                        <c:forEach var = "list" items = "${list}">
                        <jsp:useBean id="list" scope="page" type="com.epam.app.model.Card"/>
                        <tr style="padding: auto">
                            <td style="text-align: center"><c:out value="${list.id}" /></td>
                            <td><c:out value="${list.book.author}" /><br><c:out value="${list.book.title}" /></td>
                            <td><c:out value="${list.startDate}" /></td>
                            <td><c:out value="${list.endDate}" /></td>
                            <td><c:out value="${list.cardState}" /></td>

                            <c:set var="userRole" value="${sessionScope.loggedInUser.role}"/>
                            <c:set var="userLogin" value="${sessionScope.loggedInUser.login}"/>
                            <c:choose>
                                <c:when test="${(((userRole eq 'LIBRARIAN')  || (userRole eq 'ADMINISTRATOR'))
                                    && !(userLogin.equals(list.user.login)))}">
                                    <td style="text-align: center">
                                    <%if (list.getCardState().equals(CardState.ORDERED)) {%>
                                    <form action="/cards?id=${list.id}&button=home" method="post">
                                        <input type="submit" value="<fmt:message key="cardlist_page.actions_takehome"/>">
                                    </form>
                                    <form action="/cards?id=${list.id}&button=hall" method="post">
                                        <input type="submit" value="<fmt:message key="cardlist_page.actions_taketohall"/>">
                                    </form>
                                    <%} else if(list.getCardState().equals(CardState.AT_HALL) ||
                                            list.getCardState().equals(CardState.AT_HOME) ||
                                            list.getCardState().equals(CardState.OVERDUE)) {%>
                                    <form action="/cards?id=${list.id}&button=return" method="post">
                                        <input type="submit" value="<fmt:message key="cardlist_page.actions_return"/>">
                                    </form>
                                    <%}%>
                                </td>
                                <c:set var="flag" value="1"/>
                                </c:when>
                                <c:otherwise>
                                    <td style="text-align: center">
                                        <%if (list.getCardState().equals(CardState.ORDERED)) {%>
                                        <form action="/cabinet/usercards?login=${login}&id=${list.id}&button=reset" method="post">
                                            <input type="submit" value="<fmt:message key="cardlist_page.actions_reset"/>">
                                        </form>
                                        <%}%>
                                    </td>
                                    <c:set var="flag" value="2"/>
                                </c:otherwise>
                            </c:choose>
                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <div style="background-color: rgba(0,0,0,0.90); font-size: 0.85rem; max-width: 1200px; margin:0 auto;">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12 align-self-center">
                            <label><button onclick="location.href='/cabinet'"><fmt:message key="back.bn"/></button></label>
                            <c:choose>
                                <c:when test="${(flag eq 1)}">
                                    <label>
                                        <input type="button" value="<fmt:message key="pagination.previous_page"/>"
                                        onclick="location.href='/cards?login=${login}&pageSide=previous'">
                                    </label>
                                    <label>
                                        <input type="button" value="<fmt:message key="pagination.next_page"/>"
                                        onclick="location.href='/cards?login=${login}&pageSide=next'">
                                    </label>
                                </c:when>
                                <c:when test="${(flag eq 2)}">
                                    <label>
                                        <input type="button" value="<fmt:message key="pagination.previous_page"/>"
                                            onclick="location.href='/cabinet/usercards?login=${login}&pageSide=previous'">
                                    </label>
                                    <label>
                                        <input type="button" value="<fmt:message key="pagination.next_page"/>"
                                            onclick="location.href='/cabinet/usercards?login=${login}&pageSide=next'">
                                    </label>
                                    </c:when>
                                </c:choose>
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