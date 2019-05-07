<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Library: Users</title>
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

<center>
    <form action="/users?show=" method="get">
        <tr>
            <th>Enter user login to find user:</th>
            <td><input type="text" name="login" value=""></td>
            <td><input type="submit" name="insert" value="Insert"></td>
        </tr>
    </form>
</center>

<div class="w3-container w3-center">
    <div class="w3-bar  w3-round-large w3-left w3-padding-large ">
        <button class="w3-btn w3-hover-blue-grey w3-round-large" onclick="location.href='/addUser'">+ Add new user
        </button>
    </div>
</div>


<table id="userTable">
    <tr style="font-size: 22px">

        <th onclick="sortTable(0)" width="25%" onmouseover="this.style.cursor='pointer'" style="text-align: center">
            Name
        </th>
        <th onclick="sortTable(1)" width="25%" onmouseover="this.style.cursor='pointer'" style="text-align: center">
            Login
        </th>
        <th onclick="sortTable(2)" width="25%" onmouseover="this.style.cursor='pointer'" style="text-align: center">
            Role
        </th>
        <th width="25%" style="text-align: center">Actions</th>

    </tr>
    <c:forEach var="user" items="${users}">
        <jsp:useBean id="user" scope="page" type="com.epam.app.model.User"/>
        <c:set var="userRole" value="${sessionScope.loggedInUser.role}"/>
        <c:set var="userLogin" value="${sessionScope.loggedInUser.login}"/>
        <c:choose>
            <c:when test="${((userRole eq 'LIBRARIAN') && (user.role eq 'READER'))
                || ((userRole eq 'ADMINISTRATOR')&&(!userLogin.equals(user.login)))}">
                    <tr>
                        <td><c:out value="${user.name}"/></td>
                        <td><c:out value="${user.login}"/></td>
                        <td><c:out value="${user.role}"/></td>

                        <td style="text-align: center">
                            <form action="/users?login=${user.login}&button=findCards" method="post">
                                <input style="font-size: 16px" type="submit" value="Card List">
                            </form>
                            <form action="/users?login=${user.login}&button=edit" method="post">
                                <input style="font-size: 16px" type="submit" value="Edit">
                            </form>
                                <%--                            <form action="/users?login=${user.login}&button=delete" method="post">--%>
                                <%--                                <input style="font-size: 16px" type="submit" value="Delete">--%>
                                <%--                            </form>--%>
                        </td>
                    </tr>
            </c:when>
        </c:choose>
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
        </td>
    </tr>
</table>
<div class="w3-container w3-grey w3-opacity w3-right-align w3-padding">
    <button class="w3-btn w3-round-large" onclick="location.href='/users'">To user list</button>
</div>
<script type="text/javascript">
    table = document.getElementById("userTable");
    function sortTable(n) {
        var rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
        switching = true;
        dir = "asc";
        while (switching) {
            switching = false;
            rows = table.rows;
            for (i = 1; i < (rows.length - 1); i++) {
                shouldSwitch = false;
                x = rows[i].getElementsByTagName("TD")[n];
                y = rows[i + 1].getElementsByTagName("TD")[n];
                if (dir == "asc") {
                    if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
                        shouldSwitch = true;
                        break;
                    }
                } else if (dir == "desc") {
                    if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
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
</body>
</html>