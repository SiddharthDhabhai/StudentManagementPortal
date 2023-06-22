<%@page import="com.portal.services.StudentsService"%>
<%@page import="com.portal.models.Students"%>
<% 
String sname = request.getParameter("txtsname");
String ddlclasses = request.getParameter("ddlclasses");
int cid = Integer.parseInt(ddlclasses);
Students students = new Students();
StudentsService studentsService = new StudentsService();
students.setStudent_name(sname);
students.setClass_id(cid);
studentsService.addStudents(students);

response.sendRedirect("AddStundents.jsp");

%>
