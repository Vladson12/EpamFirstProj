<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <title>Books</title>
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

<jsp:include page="menuBar.jsp"></jsp:include>

<table class="stat">
    <tr>
        <th>
            <input style="font-size: 16px; text-align: right" type="button" value="Back"
                   onclick="location.href='/home'">

        </th>
    </tr>
    <tr style="font-size: 22px">
        <th width="2%" style="text-align: center">№</th>
        <th width="15%" style="text-align: center">Name</th>
        <th width="15%" style="text-align: center">Author</th>
        <th width="15%" style="text-align: center">Genre</th>
        <th width="31%" style="text-align: center">Description</th>
        <th width="7%" style="text-align: center">Year</th>
        <th width="15%" style="text-align: center">Actions</th>
    </tr>
    <c:forEach var="list" items="${list}">
        <tr>
            <td style="text-align: center"><c:out value="${list.id}"/></td>
            <td><c:out value="${list.title}"/></td>
            <td><c:out value="${list.author}"/></td>
            <td><c:out value="${list.genre}"/></td>
            <td><c:out value="${list.description}"/></td>
            <td><c:out value="${list.year}"/></td>
            <jsp:useBean id="list" scope="page" type="com.epam.app.model.Book"/>


            <td style="text-align: center">
                <input style="font-size: 16px" ${list.bookState.name().equals("ORDERED") ? 'disabled=""' : ''}
                       type="button" value="Order" onclick="location.href='/bookList?login=${login}&id=${list.id}'">
                <c:set var="userRole" value="${sessionScope.loggedInUser.role}"/>
                <c:if test="${userRole ne 'READER'}">
                    <input style="font-size: 16px" type="button" value="Edit" onclick="location.href='/editBook?id=${list.id}'">
                </c:if>
            </td>


        </tr>
    </c:forEach>
</table>
<hr/>

<tr style="text-align: center">
    <td>
        <input style="font-size: 16px; text-align: left" type="button" value="Previous page"
               onclick="location.href='/bookList?pageSide=previous'">
        <input style="font-size: 16px; text-align: left" type="button" value="Next page"
               onclick="location.href='/bookList?pageSide=next'">
    </td>
</tr>
</body>
</html>