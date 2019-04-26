<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: usr
  Date: 19.04.2019
  Time: 10:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register</title>
    <script language="JavaScript" >
        function back() {
            window.close();
        }
    </script>
</head>

<body>

<jsp:include page="menuBar.jsp"></jsp:include>

<center>  Select new date ${login}  </center>
<form name="form" action="/cardDate" method="post">
<input type="hidden" name="login" value="${login}" />
<input type="hidden" name="id" value="${id}" />
    <table align="center">
            <td>End Date</td>
            <td><input type="date" name="date"/></td>
        </tr>
        <tr>
            <td></td>
            <td>
                <input type="submit" name="update" value="Update">
            </td>
        </tr>
    </table>
</form>

</body>
</html>
