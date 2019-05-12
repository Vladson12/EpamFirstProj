<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session"/>
<fmt:setLocale value="${language}"/>
<fmt:setBundle basename="internationalization.messages"/>

<html lang="${language}" style="background-color: #000000;">
<head>
    <title><fmt:message key="card_date_page.title"/></title>
    <script language="JavaScript">
        function back() {
            window.close();
        }
    </script>
</head>

<body style="background-color: rgba(255,255,255,0);">
<div style="height: 10vh;"><jsp:include page="menuBar.jsp"></jsp:include></div>
<div style="height: 70vh;background-image: url(assets/img/1348229547604-e1432042866949.jpg);background-repeat: round;background-size: cover;">
    Select new date ${login}
    <form name="form" action="/cardDate" method="post">
        <input type="hidden" name="login" value="${login}"/>
        <input type="hidden" name="id" value="${id}"/>
        <table align="center">
            <td><fmt:message key="card_date.end_date"/></td>
            <td>
                <input type="date" name="date"/>
            </td>
            </tr>
            <tr>
                <td>

                </td>
                <td>
                    <input type="submit" name="update" value="Update">
                </td>
            </tr>
        </table>
    </form>
</div>
<div style="height: 20vh;"><jsp:include page="footer.jsp"></jsp:include></div>
</body>
</html>
