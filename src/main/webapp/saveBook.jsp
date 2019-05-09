<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html style="background-color: #000000;">
    <head>
        <title>Save book</title>
    </head>

    <body style="background-color: rgba(255,255,255,0);">
        <div><jsp:include page="menuBar.jsp"></jsp:include></div>
        <div style="background-image: url(&quot;assets/img/1348229547604-e1432042866949.jpg&quot;);height: 650px;background-repeat: round;background-size: cover;">
                        <h2>Save book</h2>
                    <form method="post" action="saveBook">
                        <jsp:useBean id="book" scope="session" type="com.epam.app.model.Book"/>
                        <input value="${book.id}" type="hidden" name="id"><br />
                        <label>Title:
                            <input value="${book.title}" type="text" name="title"><br />
                        </label>
                        <label>Author:
                            <input value="${book.author}" type="text" name="author"><br />
                        </label>
                        <label>Description:
                            <input value="${book.description}" type="text" name="description"><br />
                        </label>
                        <label>Genre: ${book.genre}
                            <select name = "genre">
                                <option value = "TEXTBOOK" selected>TEXTBOOK</option>
                                <option value = "NARRATIVE_NONFICTION">NARRATIVE_NONFICTION</option>
                                <option value = "FANTASY">FANTASY</option>
                                <option value = "DRAMA">DRAMA</option>
                                <option value = "CRIME_AND_DETECTIVE">CRIME_AND_DETECTIVE</option>
                                <option value = "SELF_HELP_BOOK">SELF_HELP_BOOK</option>
                                <option value = "SCIENCE_FICTION">SCIENCE_FICTION</option>
                            </select>
                        </label>
                        <label>Year:
                            <input value="${book.year}" type="text" name="year"><br />
                        </label>
                        <button type="submit">Save</button>
                    </form>
                <button class="w3-btn w3-round-large" onclick="location.href='/home'">Back</button>
        </div>
        <div><jsp:include page="footer.jsp"></jsp:include></div>
    </body>
</html>
