<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html style="background-color: #000000;">
    <head>
        <title>Personal Cabinet: Settings</title>
        <script>
            function validate() {
                var oldPassword = document.form.oldPass.value;
                var newPassword = document.form.newPass.value;
                var confirmNewPassword = document.form.confirmNewPass.value;

                if (oldPassword.length < 6) {
                    alert("Old password is at least 6 characters long");
                    return false;
                } else if (newPassword.length < 6) {
                    alert("New password must be at least 6 characters long.");
                    return false;
                } else if (newPassword !== confirmNewPassword) {
                    alert("ConfirmPassword should match the newPassword");
                    return false;
                }
            }
        </script>
    </head>

    <body style="background-color: rgba(255,255,255,0);">
        <div><jsp:include page="menuBar.jsp"></jsp:include></div>
        <div style="background-image: url(&quot;assets/img/1348229547604-e1432042866949.jpg&quot;);height: 650px;background-repeat: round;background-size: cover;">
                    <h3>Change password</h3>
                        <p>
                            <%=(request.getAttribute("errMessage") == null) ? "" : request.getAttribute("errMessage")%>
                        </p>
                    <c:set var="user" value="${sessionScope.loggedInUser}"></c:set>
                    <form name="form" method="post" action="settings?id=${user.id}" onsubmit="return validate()">
                        <label>Old password:
                            <input type="password" name="oldPass"><br/>
                        </label>
                        <label>New password:
                            <input type="password" name="newPass"><br/>
                        </label>
                        <label>Confirm new password:
                            <input type="password" name="confirmNewPass"><br/>
                        </label>
                        <button type="submit">Save</button>
                    </form>
                <button onclick="location.href='..'">Back</button>
        </div>
        <div><jsp:include page="footer.jsp"></jsp:include></div>
    </body>
</html>


