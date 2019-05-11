<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html style="background-color: #000000;">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Library: Registration</title>
        <script>
            function validate() {
                var name = document.form.name.value;
                var login = document.form.login.value;
                var password = document.form.password.value;
                var conpassword = document.form.conpassword.value;

                if (name == null || name == "") {
                    alert("Username can't be blank");
                    return false;
                } else if (login == null || login == "") {
                    alert("Email can't be blank");
                    return false;
                } else if (password.length < 6) {
                    alert("Password must be at least 6 characters long.");
                    return false;
                } else if (password != conpassword) {
                    alert("Confirm Password should match with the Password");
                    return false;
                }
            }
        </script>
    </head>

    <body style="background-color: rgba(255,255,255,0);">
        <div style="height: 10vh;"><jsp:include page="menuBar.jsp"></jsp:include></div>
        <div style="height: 70vh;background-image: url(&quot;assets/img/1348229547604-e1432042866949.jpg&quot;);height: 650px;background-repeat: round;background-size: cover;">

            <div style="background-color: rgb(255,255,255);opacity: 0.84;font-size: 1vw; max-width: 500px; margin:0 auto;">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12 align-self-center">

                        <h2>Sign up</h2>
                        <p><%=(request.getAttribute("errMessage") == null) ? "" : request.getAttribute("errMessage")%></p>
                        <form name="form" action="registration" method="post" onsubmit="return validate()">
                            <label>Username:</label><br/>
                            <label><input type="text" placeholder="Enter username" name="name"></label><br/>
                            <label>Email:</label><br/>
                            <label><input type="email" placeholder="Enter Email" name="login"></label><br/>
                            <label>Password:</label><br/>
                            <label><input type="password" placeholder="Enter password" name="password"></label><br/>
                            <label>Confirm password:</label><br/>
                            <label><input type="password" placeholder="Enter password" name="conpassword"></label><br/>
                            <label><button type="submit">Create</button></label><br/>
                        </form>
                            <label><button onclick="location.href='..'">Back</button></label><br/>
                        </div>
                    </div>
                 </div>
            </div>


        </div>
        <div style="height: 20vh"> <jsp:include page="footer.jsp"></jsp:include></div>
    </body>
</html>