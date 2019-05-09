<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html style="background-color: #000000;">
    <head>
        <title>Library: Password recovery</title>
        <script>
            function validate() {
                var login = document.form.login.value;

                if (login == null || login == "") {
                    alert("Email can't be blank");
                    return false;
                }
            }
        </script>
    </head>

    <body style="background-color: rgba(255,255,255,0);">
        <div><jsp:include page="menuBar.jsp"></jsp:include></div>
        <div style="background-image: url(&quot;assets/img/1348229547604-e1432042866949.jpg&quot;);height: 650px;background-repeat: round;background-size: cover;">
                    <h2>Reset your password</h2>
                    <p><%=(request.getAttribute("errMessage") == null) ? "" : request.getAttribute("errMessage")%></p>
                    <form name="form" action="passwordRecovery" method="post" onsubmit="return validate()">
                        <label>Email:
                            <input type="email" name="login"><br/>
                        </label>
                        <button type="submit">Send password reset email</button>
                    </form>
                <button onclick="location.href='..'">Back</button>
        </div>
        <div><jsp:include page="footer.jsp"></jsp:include></div>
    </body>
</html>
