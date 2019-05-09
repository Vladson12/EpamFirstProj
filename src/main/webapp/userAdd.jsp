<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html style="background-color: #000000;">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Library: Add user</title>
        <script>
            function validate() {

                var name = document.form.name.value;
                var login = document.form.login.value;

                if (name == null || name == "") {
                    alert("Username can't be blank");
                    return false;
                } else if (login == null || login == "") {
                    alert("Email can't be blank");
                    return false;
                }
            }
        </script>
    </head>

    <body style="background-color: rgba(255,255,255,0);">
        <div><jsp:include page="menuBar.jsp"></jsp:include></div>
        <div style="background-image: url(&quot;assets/img/1348229547604-e1432042866949.jpg&quot;);height: 650px;background-repeat: round;background-size: cover;">
            <center><h2>Add user</h2></center>
            <form name="form" action="addUser" method="post" onsubmit="return validate()">
                <table align="center">
                    <tr>
                        <td>Username</td>
                        <td><input type="text" name="name"/></td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td><input type="email" name="login"/></td>
                    </tr>
                    <c:set var="userRole" value="${sessionScope.loggedInUser.role}"/>
                    <c:choose>
                        <c:when test="${userRole eq 'ADMINISTRATOR'}">
                            <tr>
                                <td>Role</td>
                                <td>
                                    <select name="role">
                                        <option value="READER" selected>Reader</option>
                                        <option value="LIBRARIAN">Librarian</option>
                                        <option value="ADMINISTRATOR">Administrator</option>
                                    </select>
                                </td>
                            </tr>
                        </c:when>
                        <c:otherwise>
                            <tr>
                                <td>Role</td>
                                <td>
                                    <select name="role">
                                        <option value="READER" selected>Reader</option>
                                    </select>
                                </td>

                            </tr>
                        </c:otherwise>
                    </c:choose>
                    <tr>
                        <td><%=(request.getAttribute("errMessage") == null) ? ""
                                : request.getAttribute("errMessage")%>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <input type="submit" value="Add"/><input
                                type="reset" value="Reset"/></td>
                    </tr>
                </table>
            </form>
            <div class="w3-container w3-grey w3-opacity w3-right-align w3-padding">
                <button class="w3-btn w3-round-large" onclick="location.href='..'">Back</button>
            </div>
        </div>
        <div><jsp:include page="footer.jsp"></jsp:include></div>
    </body>
</html>

