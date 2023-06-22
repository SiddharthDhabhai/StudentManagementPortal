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
<h2>Add Teachers</h2>
<form action="AddTeacherFun.jsp" method="post">
<br></br>
<input type="text" name="txttname" placeholder = "Enter Teacher Name" required>
<br></br>
<select name="ddlsubject" style="width:150px">
	<option value="-1">Select Subject</option>
	
	<%
	SubjectService ss = new SubjectService();
	List<Subjects> subAll = ss.showAllSubjects();
	for(Subjects s : subAll)
	{
	%>
		<option value='<%= s.getSub_id() %>'>
				<%=s.getSubject_name() %> 
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
<th>Teacher Id</th>
<th> Teacher Name</th>
<th> Subject </th>
</tr>
<%try{ 
 SubjectService subjectService = new SubjectService();
 List<Subjects> suball = subjectService.showAllSubjects();
 for(Subjects s: suball){
	 for(Teachers t:s.getTeachers()){
%>
<tr>
<td><%=t.getT_no()%> </td>
<td><%=t.getTeacher_name()%></td>
<td><%=s.getSubject_name()%></td>
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