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
        <div><jsp:include page="menuBar.jsp"></jsp:include></div>
        <div style="background-image: url(&quot;assets/img/1348229547604-e1432042866949.jpg&quot;);height: 650px;background-repeat: round;background-size: cover;">
                <h2>Sign up</h2>
                <p><%=(request.getAttribute("errMessage") == null) ? "" : request.getAttribute("errMessage")%></p>
                <form name="form" action="registration" method="post" onsubmit="return validate()">
                    <label>Username:
                        <input type="text" placeholder="Enter username" name="name"><br/>
                    </label>
                    <label>Email:
                        <input type="email" placeholder="Enter Email" name="login"><br/>
                    </label>
                    <label>Password:
                        <input type="password" placeholder="Enter password" name="password"><br/>
                    </label>
                    <label>Confirm password:
                        <input type="password" placeholder="Enter password" name="conpassword"><br/>
                    </label>
                        <button type="submit">Create</button>
                </form>
            <button onclick="location.href='..'">Back</button>
        </div>
        <div><jsp:include page="footer.jsp"></jsp:include></div>
    </body>
</html>