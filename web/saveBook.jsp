<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Save book</title>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>

<body class="w3-light-grey">

<jsp:include page="menuBar.jsp"></jsp:include>

<div class="w3-container w3-padding">
    <div class="w3-card-4">
        <div class="w3-container w3-center w3-green">
            <h2>Save book</h2>
        </div>
        <form method="post" class="w3-selection w3-light-grey w3-padding" action="saveBook">
            <jsp:useBean id="book" scope="session" type="com.epam.app.model.Book"/>
            <input value="${book.id}" type="hidden" name="id" class="w3-input w3-animate-input w3-border w3-round-large" ><br />
            <label>Title:
                <input value="${book.title}" type="text" name="title" class="w3-input w3-animate-input w3-border w3-round-large" ><br />
            </label>
            <label>Author:
                <input value="${book.author}" type="text" name="author" class="w3-input w3-animate-input w3-border w3-round-large" ><br />
            </label>
            <label>Description:
                <input value="${book.description}" type="text" name="description" class="w3-input w3-animate-input w3-border w3-round-large" ><br />
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
                <input value="${book.year}" type="text" name="year" class="w3-input w3-animate-input w3-border w3-round-large" ><br />
            </label>
            <button type="submit" class="w3-btn w3-green w3-round-large w3-margin-bottom">Save</button>
        </form>
    </div>
</div>
<div class="w3-container w3-grey w3-opacity w3-right-align w3-padding">
    <button class="w3-btn w3-round-large" onclick="location.href='/home'">Back</button>
</div>
</body>
</html>
