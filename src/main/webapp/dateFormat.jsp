<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html style="background-color: #000000;">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Library : Card date</title>
        <script language="JavaScript">
            function back() {
                window.close();
            }
        </script>
    </head>

    <body style="background-color: rgba(255,255,255,0);">
        <div><jsp:include page="menuBar.jsp"></jsp:include></div>
        <div style="background-image: url(&quot;assets/img/1348229547604-e1432042866949.jpg&quot;);height: 650px;background-repeat: round;background-size: cover;">
            <center> Select new date ${login}  </center>
            <form name="form" action="/cardDate" method="post">
                <input type="hidden" name="login" value="${login}"/>
                <input type="hidden" name="id" value="${id}"/>
                <table align="center">
                    <td>End Date</td>
                    <td><input type="date" name="date"/></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <input type="submit" name="update" value="Update">
                        </td>
                    </tr>
                </table>
            </form>
        </div>
        <div><jsp:include page="footer.jsp"></jsp:include></div>
    </body>
</html>
