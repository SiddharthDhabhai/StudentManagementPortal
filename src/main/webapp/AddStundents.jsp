<%@page import="com.portal.services.ClassesService"%>
<%@page import="com.portal.services.TeachersService"%>
<%@page import="com.portal.models.*"%>
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
<h2>Add Students</h2>

<form action="AddStudentFun.jsp" method="post">
<br></br>
<input type="text" name="txtsname" placeholder = "Enter Students Name" required>
<br></br>
<select name="ddlclasses" style="width:150px">
	<option value="-1">Select Class</option>
	
	<%
	ClassesService sc=new ClassesService();
	List<Classes> call= sc.showAllClasses();
	for(Classes c : call)
	{
	%>
		<option value='<%= c.getClass_id() %>'>
				<%=c.getClass_name() %> 
		</option>
	<%
	}
	%>

</select>
<button type="submit">Submit</button>
<br>
</form>
<br>
<table >
<tr>
<th>Student ID</th>
<th>Student Name</th>
<th> Class </th>
</tr>
<%try{ 
	ClassesService cService = new ClassesService();
	List<Classes> calll = cService.showAllClasses();
	for(Classes ca: calll){
		for(Students sa: ca.getStudents()){
%>
<tr>
<td><%=sa.getStudent_id() %> </td>
<td><%=sa.getStudent_name() %></td>
<td><%=ca.getClass_name()  %></td>
</tr> 
<% }}}
catch(Exception ex){
ex.printStackTrace();
}%>
</table>
</div>
</main>
</body>
</html>