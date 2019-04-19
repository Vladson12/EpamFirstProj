<pre><%@ page language="java" contentType="text/html; charset=ISO-8859-1"
              pageEncoding="ISO-8859-1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register</title>
<script> 
function validate() {
    var login = document.form.login.value;
    var password = document.form.password.value;

     if (login == null || login == "") {
        alert("Email can't be blank");
        return false;
    } else if (password.length < 6) {
        alert("Password must be at least 6 characters long.");
        return false;
    }
}
</script> 
</head>
<body>
<center><h2>Autorization</h2></center>
<form name="form" action="AuthorizationUser" method="post" onsubmit="return validate()">
<table align="center">

 <tr>
 <td>Email</td>
 <td><input type="email" name="login"/></td>
 </tr>
 <tr>
 <td>Password</td>
 <td><input type="password" name="password"/></td>
 </tr>
 <tr>
 <td><%=(request.getAttribute("errMessage") == null) ? ""
         : request.getAttribute("errMessage")%></td>
 </tr>
 <tr>
 <td></td>
 <td>
  <input type="submit" value="Log in"></input><input
         type="reset" value="Reset"></input></td>
 </tr>

</table>
</form>
 
</body>
</html>