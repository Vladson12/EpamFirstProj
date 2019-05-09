<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html style="background-color: #000000;">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Library: Authorization</title>
        <script>
            function validate() {
                var login = document.form.login.value;
                var password = document.form.password.value;

                if (login == null || login == "") {
                    alert("Email can't be blank");
                    return false;
                } else if (password.length < 6) {
                    alert("Password must be at least 6 characters long.");
                    return false;
                }
            }
        </script>
    </head>

    <body style="background-color: rgba(255,255,255,0);">
        <div><jsp:include page="menuBar.jsp"></jsp:include></div>
        <div style="background-image: url(&quot;assets/img/1348229547604-e1432042866949.jpg&quot;);height: 650px;background-repeat: round;background-size: cover;">
            <div class="signinform">
                <div class="w3-container w3-light-gray w3-padding w3-margin">
                    <h2 class="w3-text w3-center">Log in</h2>
                    <p><%=(request.getAttribute("errMessage") == null) ? ""
                            : request.getAttribute("errMessage")%></p>
                    <form name="form" action="login" method="post" onsubmit="return validate()">
                        <label>Email:
                            <input type="email" name="login" class="w3-input w3-animate-input w3-border w3-round-large"><br/>
                        </label>
                        <label>Password:
                            <input type="password" name="password" class="w3-input w3-animate-input w3-border w3-round-large"><br/>
                        </label>
                        <div class="w3-bar w3-center">
                            <button type="submit" class="w3-btn w3-green w3-round-large w3-right">Log in</button>
                            <a href="${pageContext.request.contextPath}/passwordRecovery" class="w3-bar-item w3-left">Forgot password?</a>
                        </div>
                    </form>
                </div>
            </div>
            <div class="w3-container w3-grey w3-opacity w3-right-align w3-padding">
                <button class="w3-btn w3-round-large" onclick="location.href='..'">Back</button>
            </div>
        </div>
        <div><jsp:include page="footer.jsp"></jsp:include></div>
    </body>
</html>