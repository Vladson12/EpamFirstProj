<%@ page import="com.epam.app.model.enums.CardState" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html style="background-color: #000000;">
    <head>
        <title>Library: Cards</title>

        <script language="JavaScript" >
            function open_window() {
                window.open("view/dateFormat.jsp" ,null,
                    "height=200,width=400,status=yes,toolbar=no,menubar=no,location=no");
            }
        </script>
    </head>
    <body style="background-color: rgba(255,255,255,0);">
    <div><jsp:include page="menuBar.jsp"></jsp:include></div>
    <div style="background-image: url(&quot;assets/img/1348229547604-e1432042866949.jpg&quot;);height: 650px;background-repeat: round;background-size: cover;">
        <h1> <c:out value="${login}" /></h1>
        <table id="userCard">
            <tr style="font-size: 22px">
                <th width="1%" style="text-align: center">№</th>
                <th width="22%" id="bookCL" onmouseover="this.style.cursor='pointer'" style="text-align: center">Book</th>
                <th width="27%" id="fromCL" onmouseover="this.style.cursor='pointer'" style="text-align: center">From</th>
                <th width="27%" id="toCL" onmouseover="this.style.cursor='pointer'" style="text-align: center">To</th>
                <th width="10%" id="stateCL" onmouseover="this.style.cursor='pointer'" style="text-align: center">State</th>
                <th width="17%" style="text-align: center">Actions</th>
            </tr>
            <c:forEach var = "list" items = "${list}">
                <jsp:useBean id="list" scope="page" type="com.epam.app.model.Card"/>
                <tr>
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
                                    <input style="font-size: 16px" type="submit" value="Take home">
                                </form>
                                <form action="/cards?id=${list.id}&button=hall" method="post">
                                    <input style="font-size: 16px" type="submit" value="Take reading hall">
                                </form>
                                <%} else if(list.getCardState().equals(CardState.AT_HALL) ||
                                        list.getCardState().equals(CardState.AT_HOME) ||
                                        list.getCardState().equals(CardState.OVERDUE)) {%>
                                <form action="/cards?id=${list.id}&button=return" method="post">
                                    <input style="font-size: 16px" type="submit" value="Return">
                                </form>
                                <%}%>
                            </td>
                            <c:set var="flag" value="1"/>
                        </c:when>

                        <c:otherwise>
                            <td style="text-align: center">
                                <%if (list.getCardState().equals(CardState.ORDERED)) {%>
                                <form action="/cabinet/usercards?login=${login}&id=${list.id}&button=reset" method="post">
                                    <input style="font-size: 16px" type="submit" value="reset">
                                </form>
                                <%}%>
                            </td>
                            <c:set var="flag" value="2"/>
                        </c:otherwise>
                    </c:choose>

                </tr>
            </c:forEach>
        </table>
        <script type="text/javascript" src="../cabinet/sorting.js"></script>
            <button onclick="location.href='/home'">Back</button>
            <table width="100%">
                <tr style="text-align: center">
                    <c:choose>
                        <c:when test="${(flag eq 1)}">
                            <td>
                                <input style="font-size: 16px; text-align: left" type="button" value="Previous page"
                                       onclick="location.href='/cards?login=${login}&pageSide=previous'">
                                <input style="font-size: 16px; text-align: left" type="button" value="Next page"
                                       onclick="location.href='/cards?login=${login}&pageSide=next'">
                            </td>
                        </c:when>

                        <c:when test="${(flag eq 2)}">
                            <td>
                                <input style="font-size: 16px; text-align: left" type="button" value="Previous page"
                                       onclick="location.href='/cabinet/usercards?login=${login}&pageSide=previous'">
                                <input style="font-size: 16px; text-align: left" type="button" value="Next page"
                                       onclick="location.href='/cabinet/usercards?login=${login}&pageSide=next'">
                            </td>
                        </c:when>
                    </c:choose>
                </tr>
            </table>
    </div>
    <div><jsp:include page="footer.jsp"></jsp:include></div>
    </body>
</html>