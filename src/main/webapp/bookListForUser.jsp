<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session"/>
<fmt:setLocale value="${language}"/>
<fmt:setBundle basename="internationalization.messages"/>

<html lang="${language}" style="background-color: #000000;">
    <head>
        <meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
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
    </head>

    <body style="background-color: rgba(255,255,255,0);">
    <div style="height: 10vh;"><jsp:include page="menuBar.jsp"></jsp:include></div>
    <div class="d-flex" style="min-height: 70vh; background-image: url(assets/img/1348229547604-e1432042866949.jpg);background-repeat: round;background-size: cover;">
        <div class="align-self-center" style="background-color: rgb(255,255,255); margin:0 auto;">
            <div class="container">
                <div class="row">
                    <div class="col" style="font-size: 0.85rem;">
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
                            <label><input type="submit" name="insert" value="<fmt:message key="book_search.search_bn"/>"></label>
                        </form>
                        <input type="button" value="<fmt:message key="bookslist_page.addbook"/>" onclick="location.href='/saveBook?id=0'">
                    </div>
                </div>
            </div>
            <div>
                <table id="bookList" class="table table-bordered table-hover table-sm" style="font-size: 0.85rem; margin:0 auto;">
                    <thead class="bill-header cs" style="background-color: rgba(0,0,0,0.90);">
                    <tr style="text-align: center">
                        <th                                                        ><fmt:message key="booklist_page.table_number"/></th>
                        <th id="nameBL"   onmouseover="this.style.cursor='pointer'"><fmt:message key="booklist_page.table_title"/></th>
                        <th id="authorBL" onmouseover="this.style.cursor='pointer'"><fmt:message key="booklist_page.table_author"/></th>
                        <th id="genreBL"  onmouseover="this.style.cursor='pointer'"><fmt:message key="booklist_page.table_genre"/></th>
                        <th id="yearBL"   onmouseover="this.style.cursor='pointer'"><fmt:message key="booklist_page.table_year"/></th>
                        <th                                                        ><fmt:message key="booklist_page.table_actions"/></th>
                    </tr>
                    </thead>
                    <tbody style="background-color: #ffffff;">
                    <c:forEach var="list" items="${list}">
                        <jsp:useBean id="list" scope="page" type="com.epam.app.model.Book"/>
                        <tr >
                            <td style="text-align: center"><c:out value="${list.id}"/></td>
                            <td><c:out value="${list.title}"/></td>
                            <td><c:out value="${list.author}"/></td>
                            <td><c:out value="${list.genre}"/></td>
                            <td style="text-align: center"><c:out value="${list.year}"/></td>
                            <td>
                                <div class="container">
                                    <div class="row">
                                        <div class="col">
                                            <form action="/bookList?login=${login}&id=${list.id}" method="post">
                                                <button type="submit" value="Order"><fmt:message key="booklist_page.actions_order"/></button>
                                            </form>
                                        </div>
                                        <div class="col">
                                            <form action="/viewBook?login=${login}&id=${list.id}" method="post">
                                                <button type="submit" value="Order"><fmt:message key="booklist_page.actions_view"/></button>
                                            </form>
                                        </div>
                                        <div class="col">
                                        <c:set var="userRole" value="${sessionScope.loggedInUser.role}"/>
                                        <c:if test="${userRole ne 'READER'}">
                                            <input type="button" value="<fmt:message key="booklist_page.actions_edit"/>" onclick="location.href='/saveBook?id=${list.id}'">
                                        </c:if>
                                        </div>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <div style="background-color: rgba(0,0,0,0.90); font-size: 0.85rem;">
                <div class="container">
                    <div class="row">
                        <div class="col">
                            <input type="button" value="<fmt:message key="pagination.previous_page"/>" onclick="location.href='/bookList?pageSide=previous'">
                            <input type="button" value="<fmt:message key="pagination.next_page"/>" onclick="location.href='/bookList?pageSide=next'">
                        </div>
                        <div class="col">
                            <input type="button" value="<fmt:message key="back.bn"/>" onclick="location.href='..'">
                        </div>
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
        </div>
    </div>
    <div style="height: 20vh;"><jsp:include page="footer.jsp"></jsp:include></div>
    </body>
</html>