<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html style="background-color: #000000;">
<head>
    <title>Save book</title>
    <script>
        function isSuccess() {
            alert("The book successfully added");
            return true;
        }
    </script>
</head>

<body style="background-color: rgba(255,255,255,0);">
<div style="height: 10vh;">
    <jsp:include page="menuBar.jsp"></jsp:include>
</div>
<div style="height: 70vh;background-image: url(&quot;assets/img/1348229547604-e1432042866949.jpg&quot;);background-repeat: round;background-size: cover;">

    <div style="background-color: rgb(255,255,255);opacity: 0.84;font-size: 1vw; max-width: 500px; margin:0 auto;">
        <div class="container">
            <div class="row">
                <div class="col-md-12 align-self-center">


                    <h2>Save book</h2>

                    <form method="post" action="saveBook" onsubmit="return isSuccess()">
                        <jsp:useBean id="book" scope="session" type="com.epam.app.model.Book"/>
                        <input value="${book.id}" type="hidden" name="id"><br/>
                        <label>Title:</label><br/>
                        <label>input value="${book.title}" type="text" name="title"></label><br/>
                        <label>Author:</label><br/>
                        <label><input value="${book.author}" type="text" name="author"></label><br/>
                        <label>Description:</label><br/>
                        <label><input value="${book.description}" type="text" name="description"></label><br/>
                        <label>Genre: ${book.genre}</label><br/>
                        <label><select name="genre">
                            <option value="TEXTBOOK" selected>TEXTBOOK</option>
                            <option value="NARRATIVE_NONFICTION">NARRATIVE_NONFICTION</option>
                            <option value="FANTASY">FANTASY</option>
                            <option value="DRAMA">DRAMA</option>
                            <option value="CRIME_AND_DETECTIVE">CRIME_AND_DETECTIVE</option>
                            <option value="SELF_HELP_BOOK">SELF_HELP_BOOK</option>
                            <option value="SCIENCE_FICTION">SCIENCE_FICTION</option>
                        </select></label><br/>
                        <label>Year:</label><br/>
                        <label><input value="${book.year}" type="text" name="year"></label><br/>
                        <label>
                            <button type="submit">Save</button>
                        </label><br/>
                    </form>
                    <label>
                        <button class="w3-btn w3-round-large" onclick="location.href='/home'">Back</button>
                    </label><br/>
                </div>
            </div>
        </div>
    </div>

</div>
<div style="height: 20vh;">
    <jsp:include page="footer.jsp"></jsp:include>
</div>
</body>
</html>
