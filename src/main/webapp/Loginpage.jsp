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
<div>
<hr> <p> Learner’s Academy is a school that has an online management system. The system keeps track of its classes, subjects, students, and teachers. It has a back-office application with a single administrator login.</p><hr></div>
</header>
<main><div>
<h2>Login</h2>
<form action="LoginFun.jsp" method="post">
<br></br>
<input type="email" name="txtemail" placeholder = "Enter Email id" required>
<br></br>
<input type="password" name="txtpwd" placeholder = "Enter Password" required>
<br></br>
<button type="submit">Log In</button>
<p>If not a user then <a href="Signup.jsp">Sign up</a></p>
<br>
</form>
</div>
</main>
</body>
</html>