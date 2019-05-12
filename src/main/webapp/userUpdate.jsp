<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html style="background-color: #000000;">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
        <title>Edit user</title>
    </head>

    <body style="background-color: rgba(255,255,255,0);">
        <div style="height: 10vh"><jsp:include page="menuBar.jsp"></jsp:include></div>
        <div style="height: 70vh;background-image: url(&quot;assets/img/1348229547604-e1432042866949.jpg&quot;);height: 650px;background-repeat: round;background-size: cover;">

            <div style="background-color: rgb(255,255,255);opacity: 0.84;font-size: 1vw; max-width: 500px; margin:0 auto;">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12 align-self-center">


                            <h2>Edit user</h2>
                            <form action="/users">
                                <jsp:useBean id="user" scope="session" type="com.epam.app.model.User"/>
                                <label><input value="" type="hidden" name="update" ></label><br/>
                                <label>Name:</label><br/>
                                <label><input value="${user.name}" type="text" name="name"></label><br/>
                                <label>Login:</label><br/>
                                <label><input value="${user.login}" type="text" name="login"></label><br/>
                                <c:if test="${(sessionScope.loggedInUser.role eq 'ADMINISTRATOR') && (sessionScope.loggedInUser.role ne user.role)}">
                                <label>Genre: ${user.role}</label><br/>
                                    <label><select name = "role">
                                    <option value = "READER" selected>READER</option>
                                    <option value = "LIBRARIAN">LIBRARIAN</option>
                                    <option value = "ADMINISTRATOR">ADMINISTRATOR</option>
                                </select></label><br/>
                                </c:if>
                                <label><button type="submit">Edit</button></label><br/>
                            </form>
                            <label><button onclick="location.href='/users'">Back</button></label><br/>

                        </div>
                    </div>
                </div>
            </div>


        </div>
        <div style="height: 20vh"><jsp:include page="footer.jsp"></jsp:include></div>
    </body>
</html>
