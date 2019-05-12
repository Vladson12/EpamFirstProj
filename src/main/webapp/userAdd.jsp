<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
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
        <div style="height: 10vh"><jsp:include page="menuBar.jsp"></jsp:include></div>
        <div style="height: 70vh;background-image: url(assets/img/1348229547604-e1432042866949.jpg);background-repeat: round;background-size: cover;">
            <div style="background-color: rgb(255,255,255);opacity: 0.84;font-size: 1vw; max-width: 500px; margin:0 auto;">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12 align-self-center">
                            <h2>Add user</h2>
                            <form name="form" action="addUser" method="post" onsubmit="return validate()">
                                <label>Username</label><br/>
                                <label><input type="text" name="name"/></label><br/>
                                <label>Email</label><br/>
                                <label><input type="email" name="login"/></label><br/>
                                <c:set var="userRole" value="${sessionScope.loggedInUser.role}"/>
                                <c:choose>
                                <c:when test="${userRole eq 'ADMINISTRATOR'}">
                                <label>Role</label><br/>
                                <label><select name="role">
                                    <option value="READER" selected>Reader</option>
                                    <option value="LIBRARIAN">Librarian</option>
                                    <option value="ADMINISTRATOR">Administrator</option>
                                </select></label><br/>
                                </c:when>
                                <c:otherwise>
                                <label>Role</label><br/>
                                <label><select name="role">
                                    <option value="READER" selected>Reader</option>
                                </select></label><br/>
                                </c:otherwise>
                                </c:choose>
                                <%=(request.getAttribute("errMessage") == null) ? "" : request.getAttribute("errMessage")%>
                                <label><input type="submit" value="Add"/></label><br/>
                                <label><input type="reset" value="Reset"/></label><br/>
                            </form>
                            <label><button class="w3-btn w3-round-large" onclick="location.href='..'">Back</button></label><br/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div style="height: 20vh"><jsp:include page="footer.jsp"></jsp:include></div>
    </body>
</html>

