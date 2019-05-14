<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session"/>
<fmt:setLocale value="${language}"/>
<fmt:setBundle basename="internationalization.messages"/>

<html lang="${language}" style="background-color: #000000;">
<head>
    <meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Save book</title>
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
    <script>
        function validate() {
            var title = document.form.title.value;
            var author = document.form.author.value;
            var description = document.form.description.value;
            var genre = document.form.genre.value;
            var year = document.form.year.value;

            if (title == null || title == "") {
                alert("Title can't be blank");
                return false;
            } else if (author == null || author == "") {
                alert("Author can't be blank");
                return false;
            } else if (description == null || description == "") {
                alert("Description can't be blank");
                return false;
            } else if (genre == null || genre == "") {
                alert("Genre can't be blank");
                return false;
            } else if (year == null || year == "") {
                alert("Year can't be blank");
                return false;
            } else
                alert("The book successfully added");
            return true;
        }
    </script>
</head>
    <body style="background-color: rgba(255,255,255,0);">
    <div style="height: 10vh;"><jsp:include page="menuBar.jsp"></jsp:include></div>
    <div class="d-flex" style="min-height: 70vh; background-image: url(assets/img/1348229547604-e1432042866949.jpg);background-repeat: round;background-size: cover;">
        <div style="min-width: 30vw; margin:0 auto; margin-top: 1vh;">
            <div class="container-fluid" >
                <div class="row" style="background-color: #ffffff;">
                    <div style="font-size: 0.7rem;">
                        <h4><fmt:message key="bookaddedit_page.header"/></h4>
                        <div style="float: left;">
                            <form name="form" method="post" action="saveBook" onsubmit="return validate()">
                                <jsp:useBean id="book" scope="session" type="com.epam.app.model.Book"/>
                                <input value="${book.id}" type="hidden" name="id"><br/>
                                <label><fmt:message key="bookaddedit_page.book_title"/></label><br/>
                                <label><input value="${book.title}" type="text" name="title"></label><br/>
                                <label><fmt:message key="bookaddedit_page.book_author"/></label><br/>
                                <label><input value="${book.author}" type="text" name="author"></label><br/>
                                <label><fmt:message key="bookaddedit_page.book_description"/></label><br/>
                                <label><input value="${book.description}" type="text" name="description"></label><br/>
                                <label><fmt:message key="bookaddedit_page.book_genre"/></label><br/>
                                <label><select name = "genre">
                                    <option value = "TEXTBOOK" ${book.genre eq 'TEXTBOOK' ? 'selected' : ''}><fmt:message key="book_genre.textbook"/></option>
                                    <option value = "NARRATIVE_NONFICTION" ${book.genre eq 'NARRATIVE_NONFICTION' ? 'selected' : ''}><fmt:message key="book_genre.narrative_nonfiction"/></option>
                                    <option value = "FANTASY" ${book.genre eq 'FANTASY' ? 'selected' : ''}><fmt:message key="book_genre.fantasy"/></option>
                                    <option value = "DRAMA" ${book.genre eq 'DRAMA' ? 'selected' : ''}><fmt:message key="book_genre.drama"/></option>
                                    <option value = "CRIME_AND_DETECTIVE" ${book.genre eq 'CRIME_AND_DETECTIVE' ? 'selected' : ''}><fmt:message key="book_genre.crime_and_detective"/></option>
                                    <option value = "SELF_HELP_BOOK" ${book.genre eq 'SELF_HELP_BOOK' ? 'selected' : ''}><fmt:message key="book_genre.self_help"/></option>
                                    <option value = "SCIENCE_FICTION" ${book.genre eq 'SCIENCE_FICTION' ? 'selected' : ''}><fmt:message key="book_genre.science_fiction"/></option>
                                </select></label><br/>
                                <label><fmt:message key="bookaddedit_page.book_year"/></label><br/>
                                <label><input value="${book.year}" type="text" name="year"></label><br/>
                                <label><button class="button button5" type="submit"><fmt:message key="bookaddedit_page.save_bn"/></button></label><br/>
                            </form>
                        </div>
                        <div style="float: right; font-size: 0.7rem;">
                            <label><button class="button button5" onclick="location.href='/bookList'"><fmt:message key="back.bn"/></button></label><br/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
        <div style="height: 20vh;"><jsp:include page="footer.jsp"></jsp:include></div>
    </body>
</html>
