<%@ page import="com.epam.app.model.enums.CardState" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Library: Cards</title>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
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

<jsp:include page="menuBar.jsp"></jsp:include>

<h1> <c:out value="${login}" /></h1>
<table id="userCard">
    <tr style="font-size: 22px">
        <th width="1%" style="text-align: center">№</th>
        <th width="22%" onclick="sortTable(1)" onmouseover="this.style.cursor='pointer'" style="text-align: center">Book</th>
        <th width="27%" onclick="sortTable(2)" onmouseover="this.style.cursor='pointer'" style="text-align: center">From</th>
        <th width="27%" onclick="sortTable(3)" onmouseover="this.style.cursor='pointer'" style="text-align: center">To</th>
        <th width="10%" style="text-align: center">State</th>
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
            <c:choose>
                <c:when test="${(userRole eq 'LIBRARIAN') || (userRole eq 'ADMINISTRATOR')}">
                    <td style="text-align: center">
                        <%if (list.getCardState().equals(CardState.ORDERED)) {%>
                        <input style = "font-size: 16px" type = "button" value = "Take home"
                                onclick = "location.href = '/cards?id=${list.id}&button=home'" >
                        <input style = "font-size: 16px" type = "button" value = "Take reading hall"
                                onclick = "location.href='/cards?id=${list.id}&button=hall'" >
                        <%} else if(list.getCardState().equals(CardState.AT_HALL) ||
                                list.getCardState().equals(CardState.AT_HOME) ||
                            list.getCardState().equals(CardState.OVERDUE)) {%>
                        <input style = "font-size: 16px" type = "button" value = "Return"
                               onclick = "location.href = '/cards?id=${list.id}&button=return'" >
                        <%}%>
                    </td>
                </c:when>

                <c:otherwise>
                    <td style="text-align: center">
                        <%if (list.getCardState().equals(CardState.ORDERED)) {%>
                        <input style = "font-size: 16px" type = "button" value = "reset"
                               onclick = "location.href = '/myCard?login=${login}&id=${list.id}&button=reset'" >
                        <%}%>
                    </td>
                </c:otherwise>
            </c:choose>

        </tr>
    </c:forEach>
</table>
<hr/>
<script>
    function sortTable(n) {
        var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
        table = document.getElementById("userCard");
        switching = true;
        dir = "asc";
        while (switching) {
            switching = false;
            rows = table.rows;
            for (i = 1; i < (rows.length - 1); i++) {
                shouldSwitch = false;
                x = rows[i].getElementsByTagName("TD")[n];
                y = rows[i + 1].getElementsByTagName("TD")[n];
                xi=x.innerHTML.toLowerCase().replace(/-/g, '');
                yi=y.innerHTML.toLowerCase().replace(/-/g, '');
                if (dir == "asc") {
                    if (xi > yi) {
                        shouldSwitch = true;
                        break;
                    }
                } else if (dir == "desc") {
                    if (xi < yi) {
                        shouldSwitch = true;
                        break;
                    }
                }
            }
            if (shouldSwitch) {
                rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
                switching = true;
                switchcount++;
            } else {
                if (switchcount == 0 && dir == "asc") {
                    dir = "desc";
                    switching = true;
                }
            }
        }
    }
</script>
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


