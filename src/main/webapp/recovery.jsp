<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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
            <div class="recform">
                <div class="w3-container w3-padding w3-margin">
                    <h2>Reset your password</h2>
                    <p><%=(request.getAttribute("errMessage") == null) ? ""
                            : request.getAttribute("errMessage")%></p>
                    <form name="form" action="passwordRecovery" method="post" onsubmit="return validate()">
                        <label>Email:
                            <input type="email" name="login" class="w3-input w3-animate-input w3-border w3-round-large"><br/>
                        </label>
                        <button type="submit" class="w3-btn w3-green w3-round-large w3-right">Send password reset email</button>
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
