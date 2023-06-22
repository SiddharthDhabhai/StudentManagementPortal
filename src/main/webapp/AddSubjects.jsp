<%@page import="com.portal.models.Subjects"%>
<%@page import="java.util.List"%>
<%@page import="com.portal.services.SubjectService"%>
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
<nav><%
  String name = (String)session.getAttribute("name");
if(name.isEmpty()){
	response.sendRedirect("Loginpage.jsp");
}
%></nav>
<header>
<h1>LEARNER'S ACADEMY</h1>
<div id="logoutdiv"> <a href="Logout.jsp" id="logoutbutton">LogOut</a> </div>
<div>
<hr> <p> Learner’s Academy is a school that has an online management system. The system keeps track of its classes, subjects, students, and teachers. It has a back-office application with a single administrator login.</p><hr></div>
</header>
<% String uname = (String)session.getAttribute("name"); %>
<h2>Welcome to : &nbsp;<%=uname %></h2>
<hr />
<jsp:include page="Links.jsp"/>
<hr />
<main><div>
<h2>Add Subjects</h2>
<form action="addSubjectsFuntionality.jsp" method="post">
<br></br>
<input type="text" name="txtsname" placeholder = "Enter Subject Name" required>
<br></br>
<button type="submit">Submit</button>
<br>
</form>
<br></br>
<table >
<tr>
<th>Subject Id</th>
<th> Subject Name</th>
</tr>
<%try{ 
SubjectService ss = new SubjectService();
 List<Subjects> suball = ss.showAllSubjects();
 for(Subjects s: suball){
%>
<tr>
<td><%=s.getSub_id()%> </td>
<td><%=s.getSubject_name() %></td>

</tr> 
<% }}
catch(Exception ex){
ex.printStackTrace();
}%>

</table>
</div>
</main>
</body>
</html>