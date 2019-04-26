
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
</head>
<body>
<h1> <c:out value="${login}" /></h1>
<table>
    <tr style="font-size: 22px">
        <th width="1%" style="text-align: center">№</th>
        <th width="22%" style="text-align: center">Книга</th>
        <th width="27%" style="text-align: center">Срок регистрации</th>
        <th width="10%" style="text-align: center">Состояние</th>
        <th width="17%" style="text-align: center">Действия</th>

    </tr>
    <c:forEach var = "list" items = "${list}">
        <jsp:useBean id="list" scope="page" type="com.epam.app.model.Card"/>
        <tr>
            <td style="text-align: center"><c:out value="${list.id}" /></td>
            <td><c:out value="${list.book.author}" /><br><c:out value="${list.book.title}" /></td>
            <td><c:out value="${list.toStringDates()}" /></td>
            <td><c:out value="${list.cardState}" /></td>
                <%--            <td style="text-align: center">${list.isbn}</td>--%>
                <%--            <td style="text-align: center">${list.printyear}</td>--%>
                <%--            <td style="text-align: center">--%>
                <%--                <c:if test="${list.readalready != true}">--%>
                <%--                    <p>Не прочитана</p></c:if>--%>
                <%--                <c:if test="${list.readalready == true}">--%>
                <%--                    <p>Прочитана</p></c:if>--%>
                <%--            </td>--%>
            <td style="text-align: center">
                <input style="font-size: 16px" type="button" value="Take home" onclick="location.href='/cards?id=${list.id}&button=home'">
                <input style="font-size: 16px" type="button" value="Take reading hole" onclick="location.href='/delete/${list.id}'">
            </td>
        </tr>
    </c:forEach>
</table>
<hr/>

<table width="100%">
    <tr style="text-align: center">
        <td>
            <input style="font-size: 16px; text-align: left" type="button" value="Предыдущая страница" onclick="location.href='/turnPage/previous'">
            <input style="font-size: 16px; text-align: left" type="button" value="Следующая страница" onclick="location.href='/turnPage/next'">
            <input style="font-size: 16px; text-align: right" type="button" value="Добавить новую книгу" onclick="location.href='/getUserCard'">
            <%--            <form:form action="/find" method="post" style="text-align: right">--%>
            <%--                <a>Поиск по </a>--%>
            <%--                <select style="font-size: 16px" name="column">--%>
            <%--                    <option value="title">наименованию</option>--%>
            <%--                    <option value="author">автору</option>--%>
            <%--                    <option value="year">году выпуска</option>--%>
            <%--                </select>--%>
            <%--                <input style="font-size: 16px" type="text" name="query">--%>
            <%--                <input style="font-size: 16px" type="submit" value="Найти">--%>
            <%--            </form:form>--%>
        </td>
    </tr>
</table>
</body>


