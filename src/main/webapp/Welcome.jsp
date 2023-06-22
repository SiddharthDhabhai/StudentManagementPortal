<%@page import="com.portal.models.Students"%>
<%@page import="javax.persistence.criteria.CriteriaBuilder.In"%>
<%@page import="java.util.List"%>
<%@page import="com.portal.models.Classes"%>
<%@page import="com.portal.services.ClassesService"%>
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
<hr>
<% String uname = (String)session.getAttribute("name"); %>
<h2>Welcome to : &nbsp;<%=uname %></h2>
<hr>
<br></br>
<h2>Class Information Dashboard</h2>
<form action= "Welcome.jsp" method="post" id="welcomeform">
<label id="selectClass">Select class to see information : </label>
<select name="ddlclasses" style="width:150px" id="selectClass">
	<option value="-1">Select Class</option>
	<%
	ClassesService sc=new ClassesService();
	List<Classes > call= sc.showAllClasses();
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

<% try{
	String cid = request.getParameter("ddlclasses");
   ClassesService cs = new ClassesService();
   Classes c = cs.searchClasses(Integer.parseInt(cid));
   %>
   <h3> Subject info in Class :- <%=c.getClass_name() %></h3>
   <table >
   <tr>
   <th>Class Name</th>
   <th>Subject_1</th>
   <th>Subject_2</th>
   <th>Subject_3</th>
   <th>Subject_4</th>
   <th>Subject_5</th>
   </tr>
   <tr>
   <td><%=c.getClass_name() %> </td>
   <td><%=c.getSubject1() %></td>
   <td><%=c.getSubject2() %></td>
   <td><%=c.getSubject3() %></td>
   <td><%=c.getSubject4() %></td>
   <td><%=c.getSubject5() %></td>
   </tr>
   </table>
   <br></br>
   <h3> Students info in Class :- <%=c.getClass_name() %></h3>
    <table >
   <tr>
   <th>Class Name</th>
   <th>Student Id</th>
   <th>Student Name</th>
   </tr>
   <% for(Students s: c.getStudents()){
	   %>  
   <tr>
   <td><%=c.getClass_name() %> </td>
   <td><%=s.getStudent_id() %></td>
   <td><%=s.getStudent_name() %></td>
   </tr>
   
<% }}
 catch(Exception e){
 e.printStackTrace();
 }
 %>
</table>
</body>
</html>