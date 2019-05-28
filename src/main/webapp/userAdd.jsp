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
                    } else
                        alert("The user successfully added");
                    return true;
                }
            </script>
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

    </head>

    <body style="background-color: rgba(255,255,255,0);">
        <div style="height: 10vh"><jsp:include page="menuBar.jsp"></jsp:include></div>
        <div class="d-flex" style="height: 70vh;background-image: url(assets/img/1348229547604-e1432042866949.jpg);background-repeat: round;background-size: cover;">
            <div style="font-size: 0.85rem; min-width:30vw; margin:0 auto; margin-top: 1vh; background-color: #ffffff;">
                <div class="container">
                    <div>
                        <form name="form" action="addUser" method="post" onsubmit="return validate()">
                            <div class="form-group">
                                <h2><fmt:message key="useradd_page.header"/></h2>
                                    <div id="formdiv">
                                        <div class="form-row" style="margin-right:0px;margin-left:0px;padding-top:24px;">
                                            <div class="col-md-8 offset-md-1">
                                                <p style="margin-left:2%;font-family:Roboto, sans-serif;">
                                                    <strong><fmt:message key="useradd_page.username"/></strong>
                                                </p>
                                            </div>
                                            <div class="col-md-10 offset-md-1">
                                                <input value="${book.title}" name="title" class="form-control" type="text" placeholder="<fmt:message key="useradd_page.username_ph"/>" name="name" style="margin-left:0px;font-family:Roboto, sans-serif;"/>
                                            </div>
                                        </div>
                                        <div class="form-row" style="margin-right:0px;margin-left:0px;padding-top:24px;">
                                            <div class="col-md-8 offset-md-1">
                                                <p style="margin-left:2%;font-family:Roboto, sans-serif;">
                                                    <strong><fmt:message key="useradd_page.email"/></strong>
                                                </p>
                                            </div>
                                            <div class="col-md-10 offset-md-1">
                                                <input value="${book.title}" name="title" class="form-control" type="email" placeholder="<fmt:message key="useradd_page.email_ph"/>" name="login" style="margin-left:0px;font-family:Roboto, sans-serif;"/>
                                            </div>
                                        </div>

                                        <div class="form-row" style="margin-right:0px;margin-left:0px;padding-top:24px;margin-top:-16px;">
                                            <div class="col-md-8 offset-md-1">
                                                <p style="margin-left:2%;font-family:Roboto, sans-serif;">
                                                    <strong><fmt:message key="profile_page.role"/></strong>
                                                </p>
                                            </div>
                                        <c:set var="userRole" value="${sessionScope.loggedInUser.role}"/>
                                        <c:choose>
                                        <c:when test="${userRole eq 'ADMINISTRATOR'}">
                                        <div class="col-md-10 offset-md-1">
                                            <select class="form-control" style="font-family:Roboto, sans-serif;" name="role">
                                                <optgroup label="This is a group">
                                                    <option value="READER" selected><fmt:message key="role.reader"/></option>
                                                    <option value="LIBRARIAN"><fmt:message key="role.librarian"/></option>
                                                    <option value="ADMINISTRATOR"><fmt:message key="role.admin"/></option>
                                                </optgroup>
                                            </select>
                                        </div>
                                        </c:when>
                                        <c:otherwise>
                                        <div class="col-md-10 offset-md-1">
                                            <select class="form-control" style="font-family:Roboto, sans-serif;" name="role">
                                                <optgroup label="This is a group">
                                                    <option value="READER" selected><fmt:message key="role.reader"/></option>
                                                </optgroup>
                                            </select>
                                        </div>
                                        </c:otherwise>
                                        </c:choose>
                                        </div>

                                        <%=(request.getAttribute("errMessage") == null) ? "" : request.getAttribute("errMessage")%>
                                        <div class="form-row" style="margin-right:0px;margin-left:0px;padding-top:24px;">
                                            <div class="btn-group" role="group" style="text-align: center;">
                                                <button class="button button5" value="Reset" style="font-family:Roboto, sans-serif;" type="reset"><fmt:message key="cardlist_page.actions_reset"/></button>
                                                <button class="button button5" value="Add"  type="submit"><fmt:message key="useredit_page.savechanges_bn"/></button>
                                                <button class="button button5" onclick="location.href='..'"  type="submit"><fmt:message key="back.bn"/></button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        <div style="height: 20vh"><jsp:include page="footer.jsp"></jsp:include></div>
    </body>
</html>

