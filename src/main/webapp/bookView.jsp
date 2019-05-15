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
    <title><fmt:message key="bookview_page.title"/></title>
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
<div style="height: 10vh;"><jsp:include page="menuBar.jsp"></jsp:include></div>
<div class="d-flex" style="min-height: 70vh;background-image: url(assets/img/1348229547604-e1432042866949.jpg);background-repeat: round;background-size: cover;">
    <div style="background-color: rgb(255,255,255);min-width: 60vw; margin:0 auto; margin-top: 1vh;">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12 align-self-center">
                    <h3><fmt:message key="bookview_page.header"/></h3>
                    <img src="assets/img/questionrbook-512.png" alt="Trulli" width="200" height="200">
                    <c:set var="book" value="${book}"/>
                    <jsp:useBean id="book" scope="page" type="com.epam.app.model.Book"/>
                    <label><input  value="${book.id}" type="hidden" name="id"></label>
                    <h4><fmt:message key="bookaddedit_page.book_title"/></h4>
                    <p>${book.title}</p>
                    <h4><fmt:message key="bookaddedit_page.book_author"/></h4>
                    <p>${book.author}</p>
                    <h4><fmt:message key="bookaddedit_page.book_genre"/></h4>
                    <p>
                        <c:choose>
                            <c:when test="${book.genre eq 'TEXTBOOK'}">
                                <fmt:message key="book_genre.textbook"/></td>
                            </c:when>
                            <c:when test="${book.genre eq 'NARRATIVE_NONFICTION'}">
                                <fmt:message key="book_genre.narrative_nonfiction"/>
                            </c:when>
                            <c:when test="${book.genre eq 'DRAMA'}">
                                <fmt:message key="book_genre.drama"/>
                            </c:when>
                            <c:when test="${book.genre eq 'FANTASY'}">
                                <fmt:message key="book_genre.fantasy"/>
                            </c:when>
                            <c:when test="${book.genre eq 'CRIME_AND_DETECTIVE'}">
                                <fmt:message key="book_genre.crime_and_detective"/>
                            </c:when>
                            <c:when test="${book.genre eq 'SELF_HELP_BOOK'}">
                                <fmt:message key="book_genre.self_help"/>
                            </c:when>
                            <c:when test="${book.genre eq 'SCIENCE_FICTION'}">
                                <fmt:message key="book_genre.science_fiction"/>
                            </c:when>
                            <c:otherwise>
                                <fmt:message key="book_genre.drama"/>
                            </c:otherwise>
                        </c:choose>
                    </p>
                    <h4><fmt:message key="bookaddedit_page.book_description"/></h4>
                    <p>${book.description}</p>
                    <h4><fmt:message key="bookaddedit_page.book_year"/></h4>
                    <p>${book.year}</p>
                    <button ${sessionScope.loggedInUser.role eq 'READER' ? 'hidden' : ''} class="button button5" onclick="location.href='/saveBook?id=${book.id}'"><fmt:message key="booklist_page.actions_edit"/></button>
                    <button class="button button5" onclick="location.href='/cabinet'"><fmt:message key="back.bn"/></button>
                </div>
            </div>
        </div>
    </div>
</div>
<div style="height: 20vh;"><jsp:include page="footer.jsp"></jsp:include></div>
</body>
</html>
