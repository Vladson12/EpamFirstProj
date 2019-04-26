<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head><title>Книжная полка</title>
    <style>
        table.stat td, tr, th {
            height:9%;
        }
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

<table class="stat">
    <tr>
        <th>
            <input style="font-size: 16px; text-align: right" type="button" value="Вернуться назад"
                   onclick="location.href='/home'">

        </th>
    </tr>
    <tr style="font-size: 22px">
        <th width="1%" style="text-align: center">№</th>
        <th width="22%" style="text-align: center">Наименование</th>
        <th width="27%" style="text-align: center">Описание</th>
        <th width="10%" style="text-align: center">Автор</th>
        <th width="17%" style="text-align: center">Действия</th>
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
            <c:if test="${sessionScope.loggedInUser.role eq 'LIBRARIAN'}">
                    <input style="font-size: 16px" type="button" value="Edit" onclick="location.href='/editBook?id=${list.id}'">
                </td>
            </c:if>

        </tr>
    </c:forEach>
</table>
<hr/>

<tr style="text-align: center">
    <td>
        <input style="font-size: 16px; text-align: left" type="button" value="Предыдущая страница"
               onclick="location.href='/bookList?pageSide=previous'">
        <input style="font-size: 16px; text-align: left" type="button" value="Следующая страница"
               onclick="location.href='/bookList?pageSide=next'">
    </td>
</tr>
</body>
</html>