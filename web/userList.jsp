<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Users</title>
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
</head>
<body>

<jsp:include page="menuBar.jsp"></jsp:include>

<div class="w3-container w3-blue-grey w3-opacity w3-right-align">
    <h1>Library</h1>
</div>

<table>
    <tr style="font-size: 22px">

        <th width="22%" style="text-align: center">Name</th>
        <th width="27%" style="text-align: center">Login</th>
        <th width="27%" style="text-align: center">Role</th>

    </tr>
    <c:forEach var="users" items="${users}">
        <tr>
            <td><c:out value="${users.name}"/></td>
            <td><c:out value="${users.login}"/></td>
            <td><c:out value="${users.role}"/></td>

            <jsp:useBean id="users" scope="page" type="com.epam.app.model.User"/>

        </tr>
    </c:forEach>
</table>
<hr/>
<table width="100%">
    <tr style="text-align: center">
        <td>
            <input style="font-size: 16px; text-align: left" type="button" value="Previous page"
                   onclick="location.href='/users?pageSide=previous'">
            <input style="font-size: 16px; text-align: left" type="button" value="Next page"
                   onclick="location.href='/users?pageSide=next'">
<%--            <c:if test="${sessionScope.loggedInUser.role eq 'LIBRARIAN'}">--%>
<%--                <input style="font-size: 16px; text-align: right" type="button" value="Add book"--%>
<%--                       onclick="location.href='/addBook'">--%>
<%--            </c:if>--%>
        </td>
    </tr>
</table>
</body>
</html>