<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session"/>
<fmt:setLocale value="${language}"/>
<fmt:setBundle basename="internationalization.messages"/>

<html lang="${language}" style="background-color: #000000;">
<head>
    <title><fmt:message key="useradd_page.title"/></title>
    <script>
        function validate() {

            var name = document.form.name.value;
            var login = document.form.login.value;

            if (name == null || name == "") {
                alert("Username can't be blank");
                return false;
            } else if (login == null || login == "") {
                alert("Email can't be blank");
                return false;
            }
        }
    </script>
</head>

<body style="background-color: rgba(255,255,255,0);">
<div style="height: 10vh"><jsp:include page="menuBar.jsp"></jsp:include></div>
    <div style="height: 70vh;background-image: url(&quot;assets/img/1348229547604-e1432042866949.jpg&quot;);height: 650px;background-repeat: round;background-size: cover;">
        <div style="background-color: rgb(255,255,255);opacity: 0.84;font-size: 1vw; max-width: 500px; margin:0 auto;">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 align-self-center">
                        <h2><fmt:message key="useradd_page.header"/></h2>
                        <form name="form" action="addUser" method="post" onsubmit="return validate()">
                            <label><fmt:message key="useradd_page.username"/></label><br/>
                            <label><input type="text" placeholder="<fmt:message key="useradd_page.username_ph"/>" name="name"/></label><br/>
                            <label><fmt:message key="useradd_page.email"/></label><br/>
                            <label><input type="email" placeholder="<fmt:message key="useradd_page.email_ph"/>" name="login"/></label><br/>
                            <c:set var="userRole" value="${sessionScope.loggedInUser.role}"/>
                            <c:choose>
                                <c:when test="${userRole eq 'ADMINISTRATOR'}">
                                    <label>Role</label><br/>
                                    <label><select name="role">
                                        <option value="READER" selected><fmt:message key="role.reader"/></option>
                                        <option value="LIBRARIAN"><fmt:message key="role.librarian"/></option>
                                        <option value="ADMINISTRATOR"><fmt:message key="role.admin"/></option>
                                    </select></label><br/>
                                </c:when>
                                <c:otherwise>
                                    <label>Role</label><br/>
                                    <label><select name="role">
                                        <option value="READER" selected><fmt:message key="role.reader"/></option>
                                    </select></label><br/>
                                </c:otherwise>
                            </c:choose>
                            <%=(request.getAttribute("errMessage") == null) ? "" : request.getAttribute("errMessage")%>
                            <label><input type="submit" value="Add"/></label><br/>
                            <label><input type="reset" value="Reset"/></label><br/>
                        </form>
                        <label><button class="w3-btn w3-round-large" onclick="location.href='..'">Back</button></label><br/>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div style="height: 20vh"><jsp:include page="footer.jsp"></jsp:include></div>
</body>
</html>

