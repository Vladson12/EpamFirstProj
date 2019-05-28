<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session"/>
<fmt:setLocale value="${language}"/>
<fmt:setBundle basename="internationalization.messages"/>

<html lang="${language}" style="background-color: #000000;">
    <head>
        <meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
        <link rel="icon" type="image/ico" href="assets/img/LibLogo.jpg" />
        <title><fmt:message key="registration_page.title"/></title>
        <style>
            .button {
                background-color: #4CAF50; /* Green */
                border: none;
                color: white;
                font-size: 0.75rem;
                padding: 2px 4px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                margin: 1px 1px;
                -webkit-transition-duration: 0.4s; /* Safari */
                transition-duration: 0.4s;
                cursor: pointer;
            }
            .button5 {
                background-color: white;
                color: black;
                border: 2px solid #000000;
                border-radius: 5px;
            }
            .button5:hover {
                background-color: #e04c40;
                color: white;
            }
        </style>

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
        <div class="d-flex" style="height: 70vh;background-image: url(assets/img/1348229547604-e1432042866949.jpg);background-repeat: round;background-size: cover;">
            <div class="align-self-center" style="background-color: rgb(255,255,255);opacity: 0.84;font-size: 1vw; max-width: 500px; margin:0 auto;">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12 align-self-center">
                            <h2><fmt:message key="registration_page.signup"/></h2>
                            <p><%=(request.getAttribute("errMessage") == null) ? "" : request.getAttribute("errMessage")%></p>
                            <form name="form" action="registration" method="post" onsubmit="return validate()">
                                <label><fmt:message key="registration_page.username"/>:</label><br/>
                                <label><input type="text" placeholder="<fmt:message key="registration_page.username_ph"/>" name="name"></label><br/>
                                <label><fmt:message key="registration_page.email"/>:</label><br/>
                                <label><input type="email" placeholder="<fmt:message key="registration_page.email_ph"/>" name="login"></label><br/>
                                <label><fmt:message key="registration_page.password"/>:</label><br/>
                                <label><input type="password" placeholder="<fmt:message key="registration_page.password_ph"/>" name="password"></label><br/>
                                <label><fmt:message key="registration_page.confirm"/>:</label><br/>
                                <label><input type="password" placeholder="<fmt:message key="registration_page.confirm_ph"/>" name="conpassword"></label><br/>
                                <label><button class="button button5" type="submit"><fmt:message key="registration_page.create_bn"/></button></label><br/>
                            </form>
                            <label><button class="button button5" onclick="location.href='..'"><fmt:message key="back.bn"/></button></label><br/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div style="height: 20vh"> <jsp:include page="footer.jsp"></jsp:include></div>
    </body>
</html>