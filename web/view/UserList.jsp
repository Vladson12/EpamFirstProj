<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head><title>User List</title>
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

<table>
    <tr style="font-size: 22px">
        <th width="1%" style="text-align: center">№</th>
        <th width="22%" style="text-align: center">Name</th>
        <th width="27%" style="text-align: center">Login</th>
        <th width="10%" style="text-align: center">Password</th>
        <%--        <th width="12%" style="text-align: center">ISBN</th>--%>
        <%--        <th width="3%" style="text-align: center">Год выпуска</th>--%>
        <%--        <th width="8%" style="text-align: center">Статус</th>--%>
        <th width="17%" style="text-align: center">Actions</th>

    </tr>
    <c:forEach var = "userlist" items = "${userlist}">
        <tr>
            <td style="text-align: center"><c:out value="${userlist.id}" /></td>
            <td><c:out value="${userlist.name}" /></td>
            <td><c:out value="${userlist.login}" /></td>
            <td><c:out value="${userlist.password}" /></td>
                <%--            <td style="text-align: center">${list.isbn}</td>--%>
                <%--            <td style="text-align: center">${list.printyear}</td>--%>
                <%--            <td style="text-align: center">--%>
                <%--&lt;%&ndash;                <c:if test="${list.readalready != true}">&ndash;%&gt;--%>
                <%--&lt;%&ndash;                    <p>Не прочитана</p></c:if>&ndash;%&gt;--%>
                <%--&lt;%&ndash;                <c:if test="${list.readalready == true}">&ndash;%&gt;--%>
                <%--&lt;%&ndash;                    <p>Прочитана</p></c:if>&ndash;%&gt;--%>
                <%--            </td>--%>
            <td style="text-align: center">
                    <%--                <input style="font-size: 16px" type="button" value="Прочитать" onclick="location.href='/view/${list.id}'">--%>
                    <%--                <input style="font-size: 16px" type="button" value="Удалить" onclick="location.href='/delete/${list.id}'">--%>
                    <%--                <input style="font-size: 16px" type="button" value="Заменить" onclick="location.href='/edit/${list.id}'">--%>
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
            <input style="font-size: 16px; text-align: right" type="button" value="Добавить новую книгу" onclick="location.href='/add'">
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
</html>
