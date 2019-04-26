<%@ page import="com.epam.app.model.enums.CardState" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head><title>Книжная полка</title>
    <style>
        table {
            font-family: arial, sans-serif;
            border-collapse: collapse;
            width: 100%;
        }
        td, th {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }
        tr:nth-child(even) {
            background-color: #dddddd;
        }
    </style>

    <script language="JavaScript" >
        function open_window() {
            window.open("view/dateFormat.jsp" ,null,
                "height=200,width=400,status=yes,toolbar=no,menubar=no,location=no");
        }
    </script>

</head>
<body>
<c:if test="${sessionScope.loggedInUser.role eq 'LIBRARIAN'}">
    <p>You're LIBRARIAN.</p>
</c:if>
<h1> <c:out value="${login}" /></h1>
<table>
    <tr style="font-size: 22px">
        <th width="1%" style="text-align: center">№</th>
        <th width="22%" style="text-align: center">Книга</th>
        <th width="27%" style="text-align: center">From</th>
        <th width="27%" style="text-align: center">To</th>
        <th width="10%" style="text-align: center">Состояние</th>
        <th width="17%" style="text-align: center">Действия</th>

    </tr>
    <c:forEach var = "list" items = "${list}">
        <jsp:useBean id="list" scope="page" type="com.epam.app.model.Card"/>
        <tr>
            <td style="text-align: center"><c:out value="${list.id}" /></td>
            <td><c:out value="${list.book.author}" /><br><c:out value="${list.book.title}" /></td>
            <td><c:out value="${list.startDate}" /></td>
            <td><c:out value="${list.endDate}" /></td>
            <td><c:out value="${list.cardState}" /></td>

            <c:if test="${sessionScope.loggedInUser.role eq 'LIBRARIAN'}">
                <td style="text-align: center">
                    <%if (list.getCardState().equals(CardState.ORDERED)) {%>
                    <input style = "font-size: 16px" type = "button" value = "Take home"
                            onclick = "location.href = '/cards?id=${list.id}&button=home'" >
                    <input style = "font-size: 16px" type = "button" value = "Take reading hole"
                            onclick = "location.href='/cards?id=${list.id}&button=hall'" >
                    <%} else if(list.getCardState().equals(CardState.AT_HALL) ||
                            list.getCardState().equals(CardState.AT_HOME) ||
                        list.getCardState().equals(CardState.OVERDUE)) {%>
                    <input style = "font-size: 16px" type = "button" value = "Return"
                           onclick = "location.href = '/cards?id=${list.id}&button=return'" >
                    <%}%>
                </td>
            </c:if>

            <c:if test="${sessionScope.loggedInUser.role eq 'READER'}">
                <td style="text-align: center">
                    <%if (list.getCardState().equals(CardState.ORDERED)) {%>
                    <input style = "font-size: 16px" type = "button" value = "reset"
                           onclick = "location.href = '/myCard?login=${login}&id=${list.id}&button=reset'" >
                    <%}%>
                </td>
            </c:if>

        </tr>
    </c:forEach>
</table>
<hr/>

<div class="w3-container w3-grey w3-opacity w3-right-align w3-padding">
    <button class="w3-btn w3-round-large" onclick="location.href='/home'">Back</button>
</div>
<%--<table width="100%">--%>
<%--    <tr style="text-align: center">--%>
<%--        <td>--%>
<%--            <input style="font-size: 16px; text-align: left" type="button" value="Предыдущая страница" onclick="location.href='/turnPage/previous'">--%>
<%--            <input style="font-size: 16px; text-align: left" type="button" value="Следующая страница" onclick="location.href='/turnPage/next'">--%>
<%--            <input style="font-size: 16px; text-align: right" type="button" value="Добавить новую книгу" onclick="location.href='/getUserCard'">--%>

<%--        </td>--%>
<%--    </tr>--%>
<%--</table>--%>
</body>


