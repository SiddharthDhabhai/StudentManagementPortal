<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" href="style.css">
</head>
<body>
<header>
<h1>LEARNER'S ACADEMY</h1>
</header>
<main><div>
<h2>Sign Up</h2>
<hr>
<form action="AddUserfunctionality.jsp" method="post">
<hr>
<br></br>
<input type="text" name="txtpname" placeholder = "Enter Your Name" required>
<br></br>
<input type="email" name="txtemail" placeholder = "Enter Email id" required>
<br></br>
<input type="password" name="txtpwd" placeholder = "Enter Password" required>
<br></br>
<input type="password" name="txtpwd2" placeholder = "Conform Password" required>
<br></br>
<button type="submit">Sign Up</button>
<br>
<hr>
</form>
</div>
</main>
</body>
</html>