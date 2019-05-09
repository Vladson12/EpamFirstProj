<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html style="background-color: #000000;">
    <head>
        <title>Delete user</title>
    </head>

    <body style="background-color: rgba(255,255,255,0);">
        <div><jsp:include page="menuBar.jsp"></jsp:include></div>
        <div style="background-image: url(&quot;assets/img/1348229547604-e1432042866949.jpg&quot;);height: 650px;background-repeat: round;background-size: cover;">
                <h1>Library</h1>
                    <form action="/users">
                        <jsp:useBean id="user" scope="session" type="com.epam.app.model.User"/>
                        <input value="" type="hidden" name="delete" ><br />
                                <h2>Do you really want delete user ${user.login} ?</h2>
                            <button type="submit" >Delete</button>
                            <button type="button" onclick="location.href='/users'">Back</button>
                    </form>
        </div>
        <div><jsp:include page="footer.jsp"></jsp:include></div>
    </body>
</html>
