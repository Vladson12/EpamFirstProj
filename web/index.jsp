<%--
  Created by IntelliJ IDEA.
  User: Konstantin
  Date: 2019-04-13
  Time: 14:03
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Library</title>
  <link rel="stylesheet" href="styles/w3.css">
</head>

<body class="w3-light-grey">
<div class="w3-container w3-blue-grey w3-opacity w3-right-align">
  <h1>Library</h1>
</div>

<div class="w3-container w3-center">
  <div class="w3-bar w3-padding-large w3-padding-24">
    <button class="w3-btn w3-hover-light-blue w3-round-large" onclick="location.href='/GetUserList'">Users list</button>
    <button class="w3-btn w3-hover-green w3-round-large" onclick="location.href='/AddNewUser'">Add user</button>
    <button class="w3-btn w3-hover-indigo w3-round-large" onclick="location.href='/BookListView'">Books list</button>
    <button class="w3-btn w3-hover-indigo w3-round-large" onclick="location.href='/enterOfUser'">FR</button>
    <button class="w3-btn w3-hover-aqua w3-round-large" onclick="location.href='/AddBook'">Add book</button>
    <%--<button class="w3-btn w3-hover-aqua w3-round-large" onclick="location.href='/PersonalCabinet'">Personal Cabinet</button>--%>

    <button class="w3-btn w3-hover-indigo w3-round-large" onclick="location.href='view/enterOfUser.jsp'">FR</button>

    <button class="w3-btn w3-hover-aqua w3-round-large" onclick="location.href=''">Add book</button>
  </div>
</div>
</body>
</html>
