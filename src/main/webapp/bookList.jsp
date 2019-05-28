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
        <title><fmt:message key="bookslist_page.title"/></title>
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/fonts/fontawesome-all.min.css">
        <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
        <link rel="stylesheet" href="assets/fonts/googleapis.com.roboto.css">
        <link rel="stylesheet" href="assets/css/Bold-BS4-Footer-Big-Logo.css">
        <link rel="stylesheet" href="assets/css/Bootstrap-Theme-Switchers.css">
        <link rel="stylesheet" href="assets/css/dataTables.bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/aos-2.1.1.css">
        <link rel="stylesheet" href="assets/css/sticky-dark-top-nav-with-dropdown.css">
        <link rel="stylesheet" href="assets/css/styles.css">
        <link rel="stylesheet" href="assets/css/Table-With-Search.css">
        <link rel="stylesheet" href="assets/css/Toggle-Switch-1-1.css">
        <link rel="stylesheet" href="assets/css/Toggle-Switch-1.css">
        <link rel="stylesheet" href="assets/css/Toggle-Switch.css">
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
    <c:set var="userRole" value="${sessionScope.loggedInUser.role}"/>
    <div style="height: 10vh;"><jsp:include page="menuBar.jsp"></jsp:include></div>
    <div class="d-flex" style="min-height: 70vh; background-image: url(assets/img/1348229547604-e1432042866949.jpg);background-repeat: round;background-size: cover;">
        <div style="min-width: 60vw; margin:0 auto; margin-top: 1vh;">
            <p><%if(request.getSession().getAttribute("errMessage") != null){%>
                <script>
                    alert("Amount of ordered book has been exceeded or you haven't returned the book in time!");
                </script><%}
                    request.getSession().setAttribute("errMessage",null);%></p>
            <div class="container-fluid" >
                <div class="row" style="background-color: #ffffff;">
                    <div class="col-md-12 align-self-center" style="font-size: 0.7rem;">
                        <div style="float: left;">
                            <form action="/bookList?show=" method="get">
                                <label><fmt:message key="book_search.by_name_and_author"/></label>
                                <label><input type="text" name="context" value=""></label>
                                <label><fmt:message key="book_search.by_genre"/></label>
                                <label>
                                    <select name="genre">
                                        <option value="" selected>-</option>
                                        <option value="TEXTBOOK"><fmt:message key="book_genre.textbook"/></option>
                                        <option value="NARRATIVE_NONFICTION"><fmt:message key="book_genre.narrative_nonfiction"/></option>
                                        <option value="DRAMA"><fmt:message key="book_genre.drama"/></option>
                                        <option value="FANTASY"><fmt:message key="book_genre.fantasy"/></option>
                                        <option value="CRIME_AND_DETECTIVE"><fmt:message key="book_genre.crime_and_detective"/></option>
                                        <option value="SELF_HELP_BOOK"><fmt:message key="book_genre.self_help"/></option>
                                        <option value="SCIENCE_FICTION"><fmt:message key="book_genre.science_fiction"/></option>
                                    </select>
                                </label>
                                <label><input  class="button button5" type="submit" name="insert" value="<fmt:message key="book_search.search_bn"/>"></label>
                            </form>
                        </div>
                        <c:if test="${userRole ne 'READER'}">
                        <div style="float: right; font-size: 0.7rem;">
                            <input  class="button button5" type="button" value="<fmt:message key="bookslist_page.addbook"/>" onclick="location.href='/saveBook?id=0'">
                        </div>
                        </c:if>
                    </div>
                </div>
            </div>
            <div>
                <table id="bookList" class="table table-bordered table-hover table-sm" style="font-size: 0.85rem;">
                    <thead class="bill-header cs" style="background-color: rgba(0,0,0,0.90);">
                    <tr style="text-align: center">
                        <th                                                         style="width: 3%"><fmt:message key="booklist_page.table_number"/></th>
                        <th id="nameBL"   onclick="location.href='/bookList?sort=name'"   onmouseover="this.style.cursor='pointer'" style="width: 32%"><fmt:message key="booklist_page.table_title"/></th>
                        <th id="authorBL" onclick="location.href='/bookList?sort=author'" onmouseover="this.style.cursor='pointer'" style="width: 20%"><fmt:message key="booklist_page.table_author"/></th>
                        <th id="genreBL"  onclick="location.href='/bookList?sort=genre'"  onmouseover="this.style.cursor='pointer'" style="width: 29%"><fmt:message key="booklist_page.table_genre"/></th>
                        <th id="yearBL"   onclick="location.href='/bookList?sort=year'"   onmouseover="this.style.cursor='pointer'" style="width: 4%"><fmt:message key="booklist_page.table_year"/></th>
                        <th                                                         style="width: 12%"><fmt:message key="booklist_page.table_actions"/></th>
                    </tr>
                    </thead>
                    <tbody style="background-color: #ffffff;">
                    <c:forEach var="list" items="${list}">
                        <jsp:useBean id="list" scope="page" type="com.epam.app.model.Book"/>
                        <tr >
                            <td style="text-align: center"><c:out value="${list.id}"/></td>
                            <td><c:out value="${list.title}"/></td>
                            <td><c:out value="${list.author}"/></td>
                            <c:choose>
                                <c:when test="${list.genre eq 'TEXTBOOK'}">
                                    <td><fmt:message key="book_genre.textbook"/></td>
                                </c:when>
                                <c:when test="${list.genre eq 'NARRATIVE_NONFICTION'}">
                                    <td><fmt:message key="book_genre.narrative_nonfiction"/></td>
                                </c:when>
                                <c:when test="${list.genre eq 'DRAMA'}">
                                    <td><fmt:message key="book_genre.drama"/></td>
                                </c:when>
                                <c:when test="${list.genre eq 'FANTASY'}">
                                    <td><fmt:message key="book_genre.fantasy"/></td>
                                </c:when>
                                <c:when test="${list.genre eq 'CRIME_AND_DETECTIVE'}">
                                    <td><fmt:message key="book_genre.crime_and_detective"/></td>
                                </c:when>
                                <c:when test="${list.genre eq 'SELF_HELP_BOOK'}">
                                    <td><fmt:message key="book_genre.self_help"/></td>
                                </c:when>
                                <c:when test="${list.genre eq 'SCIENCE_FICTION'}">
                                    <td><fmt:message key="book_genre.science_fiction"/></td>
                                </c:when>
                                <c:otherwise>
                                    <td><fmt:message key="book_genre.drama"/></td>
                                </c:otherwise>
                            </c:choose>
                            <td style="text-align: center"><c:out value="${list.year}"/></td>
                            <td>
                                <div class="btn-group" role="group" style="text-align: center;">
                                        <div >
                                            <form action="/bookList?login=${login}&id=${list.id}" method="post">
                                                <button type="submit"class="button button5"  value="order"><fmt:message key="booklist_page.actions_order"/></button>
                                            </form>
                                        </div>
                                        <div >
                                            <form action="/viewBook?id=${list.id}" method="post">
                                                <button type="submit" class="button button5" value="view"><fmt:message key="booklist_page.actions_view"/></button>
                                            </form>
                                        </div>
                                        <div >

                                        <c:if test="${userRole ne 'READER'}">
                                            <input type="button"  onclick="location.href='/saveBook?id=${list.id}'" class="button button5" value="<fmt:message key="booklist_page.actions_edit"/>">
                                        </c:if>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="container-fluid">
                <div class="row" style="background-color: #ffffff; font-size: 0.7rem;">
                    <div style="float: left;  font-size: 0.7rem;">
                        <button  class="button button5" type="button" onclick="location.href='/bookList?pageSide=previous'" value="<fmt:message key="pagination.previous_page"/>"><fmt:message key="pagination.previous_page"/></button>
                        <button  class="button button5" type="button" onclick="location.href='/bookList?pageSide=next'" value="<fmt:message key="pagination.next_page"/>"><fmt:message key="pagination.next_page"/> </button>
                    </div>
                    <div style="float: right; font-size: 0.7rem;">
                        <form action=".." method="get" style="float: right; ">
                            <button class="button button5" type="submit" value="<fmt:message key="back.bn"/>"><fmt:message key="back.bn"/></button>
                        </form>
                    </div>
                </div>
            </div>

            <script src="assets/js/sorting.js"></script>
            <script src="assets/js/jquery.min.js"></script>
            <script src="assets/bootstrap/js/bootstrap.min.js"></script>
            <script src="assets/js/jquery.dataTables.min.js"></script>
            <script src="assets/js/dataTables.bootstrap.min.js"></script>
            <script src="assets/js/-Bootswatch-Theme-Switcher-BS4-.js"></script>
            <script src="assets/js/bs-animation.js"></script>
            <script src="assets/js/aos-2.1.1.js"></script>
            <script src="assets/js/Table-With-Search.js"></script>
            <script src='assets/js/3.2.1.jquery.min.js'></script>
        </div>
    </div>
    <div style="height: 20vh;"><jsp:include page="footer.jsp"></jsp:include></div>
    </body>
</html>