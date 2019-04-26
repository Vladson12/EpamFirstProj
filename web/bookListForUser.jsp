<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
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
</head>
<body>

<jsp:include page="menuBar.jsp"></jsp:include>

<table>
    <tr style="font-size: 22px">
        <th width="1%" style="text-align: center">№</th>
        <th width="22%" style="text-align: center">Title</th>
        <th width="27%" style="text-align: center">Description</th>
        <th width="10%" style="text-align: center">Author</th>
        <th width="17%" style="text-align: center">Actions</th>

    </tr>
    <c:forEach var="list" items="${list}">
        <tr>
            <td style="text-align: center"><c:out value="${list.id}"/></td>
            <td><c:out value="${list.title}"/></td>
            <td><c:out value="${list.description}"/></td>
            <td><c:out value="${list.author}"/></td>
            <jsp:useBean id="list" scope="page" type="com.epam.app.model.Book"/>

            <td style="text-align: center">
                <input style="font-size: 16px" ${list.bookState.name().equals("ORDERED") ? 'disabled=""' : ''}
                       type="button" value="Order" onclick="location.href='/bookList?login=${login}&id=${list.id}'">
            </td>
        </tr>
    </c:forEach>
</table>
<hr/>
<table width="100%">
    <tr style="text-align: center">
        <td>
            <input style="font-size: 16px; text-align: left" type="button" value="Previous page"
                   onclick="location.href='/bookList?pageSide=previous'">
            <input style="font-size: 16px; text-align: left" type="button" value="Next page"
                   onclick="location.href='/bookList?pageSide=next'">
            <c:if test="${sessionScope.loggedInUser.role eq 'LIBRARIAN'}">
                <input style="font-size: 16px; text-align: right" type="button" value="Add book"
                       onclick="location.href='/addBook'">
            </c:if>
        </td>
    </tr>
</table>
</body>
</html>