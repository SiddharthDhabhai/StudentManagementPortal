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
<h2>Add Classes</h2>
<form action="AddClassesFun.jsp" method="post">
<br></br>
<input type="text" name="txtcname" placeholder = "Enter Class Name" required>
<br></br>
<select name="ddlsubject1" style="width:150px">
	<option value="-1">Select First Subject </option>
	
	<%
	SubjectService ss1 = new SubjectService();
	List<Subjects> subAll1 = ss1.showAllSubjects();
	for(Subjects s : subAll1)
	{
	%>
		<option value='<%= s.getSubject_name()%>'>
				<%=s.getSubject_name() %> 
		</option>
	<%
	}
	%></select>
	<select name="ddlsubject2" style="width:150px">
	<option value="-1">Select Second Subject</option>
	
	<%
	SubjectService ss2 = new SubjectService();
	List<Subjects> subAll2 = ss2.showAllSubjects();
	for(Subjects s : subAll2)
	{
	%>
		<option value='<%=s.getSubject_name() %>'>
				<%=s.getSubject_name() %> 
		</option>
	<%
	}
	%></select>
	<select name="ddlsubject3" style="width:150px">
	<option value="-1">Select Third Subject</option>
	
	<%
	SubjectService ss3 = new SubjectService();
	List<Subjects> subAll3 = ss3.showAllSubjects();
	for(Subjects s : subAll3)
	{
	%>
		<option value='<%=s.getSubject_name() %>'>
				<%=s.getSubject_name() %> 
		</option>
	<%
	}
	%></select>
	<select name="ddlsubject4" style="width:150px">
	<option value="-1">Select Fourth Subject</option>
	
	<%
	SubjectService ss4 = new SubjectService();
	List<Subjects> subAll4 = ss4.showAllSubjects();
	for(Subjects s : subAll4)
	{
	%>
		<option value='<%=s.getSubject_name() %>'>
				<%=s.getSubject_name() %> 
		</option>
	<%
	}
	%></select>
	<select name="ddlsubject5" style="width:150px">
	<option value="-1">Select Fifth Subject</option>
	
	<%
	SubjectService ss5 = new SubjectService();
	List<Subjects> subAll5 = ss5.showAllSubjects();
	for(Subjects s : subAll5)
	{
	%>
		<option value='<%=s.getSubject_name() %>'>
				<%=s.getSubject_name() %> 
		</option>
	<%
	}
	%></select>
<button type="submit">Submit</button>
<br>
</form>
<br>
<table >
<tr>
<th>Class Name</th>
<th>Subject_1</th>
<th>Subject_2</th>
<th>Subject_3</th>
<th>Subject_4</th>
<th>Subject_5</th>
</tr>
<%try{ 
 ClassesService cs = new ClassesService();
 List<Classes> call = cs.showAllClasses();
 for(Classes c: call){
	 %>
<tr>
<td><%=c.getClass_name() %> </td>
<td><%=c.getSubject1() %></td>
<td><%=c.getSubject2() %></td>
<td><%=c.getSubject3() %></td>
<td><%=c.getSubject4() %></td>
<td><%=c.getSubject5() %></td>
</tr> 
<% }}
catch(Exception ex){
ex.printStackTrace();
}%>
</table>
</main>
</body>
</html>