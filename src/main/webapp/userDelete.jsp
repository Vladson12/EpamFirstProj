<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html style="background-color: #000000;">
    <head>
        <title>Delete user</title>
    </head>

    <body style="background-color: rgba(255,255,255,0);">
        <div style="height: 10vh"><jsp:include page="menuBar.jsp"></jsp:include></div>
        <div style="height: 70vh;background-image: url(assets/img/1348229547604-e1432042866949.jpg);background-repeat: round;background-size: cover;">
            <div style="background-color: rgb(255,255,255);opacity: 0.84;font-size: 1vw; max-width: 500px; margin:0 auto;">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12 align-self-center">
                            <label><h1>Library</h1></label>
                            <form action="/users">
                                <jsp:useBean id="user" scope="session" type="com.epam.app.model.User"/>
                                <label><input value="" type="hidden" name="delete" ></label>
                                <label><h2>Do you really want delete user ${user.login} ?</h2></label>
                                <label><button type="submit" >Delete</button></label>
                                <label><button type="button" onclick="location.href='/users'">Back</button></label>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div style="height: 20vh;"><jsp:include page="footer.jsp"></jsp:include></div>
    </body>
</html>
