<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html style="background-color: #000000;">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
        <title>LibrarySite</title>
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
        <div style="height: 70vh; background-image: url(assets/img/1348229547604-e1432042866949.jpg);background-repeat: round;background-size: cover;">
            <div id="change-me" style="background-color: rgb(255,255,255);opacity: 0.84;font-size: 1vw; max-width: 1200px; margin:0 auto;">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12 align-self-center">
                            <form action="/bookList?show=" method="get">
                                <label>Enter author name to find book:</label>
                                <label><input type="text" name="context" value=""></label>
                                <label>and/or choose book genre</label>
                                    <label><select name="genre">
                                        <option value="" selected>-</option>
                                        <option value="TEXTBOOK">TEXTBOOK</option>
                                        <option value="NARRATIVE_NONFICTION">NARRATIVE_NONFICTION</option>
                                        <option value="DRAMA">DRAMA</option>
                                        <option value="FANTASY">FANTASY</option>
                                        <option value="CRIME_AND_DETECTIVE">CRIME_AND_DETECTIVE</option>
                                        <option value="SELF_HELP_BOOK">SELF_HELP_BOOK</option>
                                        <option value="SCIENCE_FICTION">SCIENCE_FICTION</option>
                                    </select></label>
                                <label><input type="submit" name="insert" value="Insert"></label>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div>
                <table id="bookList" class="table table-bordered table-hover table-sm" style="font-size: 1vw; max-width: 1200px; margin:0 auto;">
                    <thead class="bill-header cs" style="background-color: rgba(0,0,0,0.81);">
                    <tr style="text-align: center">
                        <th                                                         class="col-lg-1" style="width: 5vh;">No.</th>
                        <th id="nameBL"   onmouseover="this.style.cursor='pointer'" class="col-lg-2" style="width: 34vh;">Title</th>
                        <th id="authorBL" onmouseover="this.style.cursor='pointer'" class="col-lg-3" style="width: 20vh;">Author</th>
                        <th id="genreBL"  onmouseover="this.style.cursor='pointer'" class="col-lg-2" style="width: 19vh;">Genre</th>
                        <th id="yearBL"   onmouseover="this.style.cursor='pointer'" class="col-lg-2" style="width: 10vh;">Year</th>
                        <th                                                         class="col-lg-2" style="width: 12vh;">Action</th>
                    </tr>
                    </thead>
                    <tbody style="background-color: #ffffff;">
                    <c:forEach var="list" items="${list}">
                    <jsp:useBean id="list" scope="page" type="com.epam.app.model.Book"/>
                    <tr style="padding: auto">
                        <td style="text-align: center"><c:out value="${list.id}"/></td>
                        <td><c:out value="${list.title}"/></td>
                        <td><c:out value="${list.author}"/></td>
                        <td><c:out value="${list.genre}"/></td>
                        <td style="text-align: center"><c:out value="${list.year}"/></td>
                        <td>
                            <div class="table-responsive table-borderless">
                                <table>
                                    <tr>
                                        <td style="padding: 0; width: 33.3%;">
                                            <form action="/bookList?login=${login}&id=${list.id}" method="post">
                                                <button type="submit" value="Order">Order</button>
                                            </form>
                                        </td>
                                        <td style="padding: 0; width: 33.3%;">
                                            <form action="/viewBook?login=${login}&id=${list.id}" method="post">
                                                <button type="submit" value="Order">View</button>
                                            </form>
                                        </td>
                                                <c:set var="userRole" value="${sessionScope.loggedInUser.role}"/>
                                                <c:if test="${userRole ne 'READER'}">
                                        <td style="padding: 0; width: 33.3%;">
                                            <input type="button" value="Edit"onclick="location.href='/saveBook?id=${list.id}'">
                                        </td>
                                                </c:if>
                                    </tr>
                            </table>
                            </div>
                        </td>
                    </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <div style="background-color: rgb(255,255,255);opacity: 0.84;font-size: 1vw; max-width: 1200px; margin:0 auto;">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12 align-self-center">
                            <input style="font-size: 16px; text-align: right" type="button" value="Back" onclick="location.href='/home'">
                            <input style="font-size: 16px; text-align: right" type="button" value="Add new book" onclick="location.href='/saveBook?id=0'">
                            <input style="font-size: 16px; text-align: left" type="button" value="Previous page" onclick="location.href='/bookList?pageSide=previous'">
                            <input style="font-size: 16px; text-align: left" type="button" value="Next page" onclick="location.href='/bookList?pageSide=next'">
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
        <div style="height: 20vh;"><jsp:include page="footer.jsp"></jsp:include></div>
    </body>
</html>