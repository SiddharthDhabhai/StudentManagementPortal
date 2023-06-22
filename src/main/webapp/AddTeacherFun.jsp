<%@page import="com.portal.services.TeachersService"%>
<%@page import="com.portal.models.Teachers"%>
<% 
String teacherName = request.getParameter("txttname");
String ddlsub = request.getParameter("ddlsubject");
int subid = Integer.parseInt(ddlsub);
Teachers teachers= new Teachers();
TeachersService ts = new TeachersService();
teachers.setTeacher_name(teacherName);
teachers.setSub_id(subid);
ts.addTeacher(teachers);
response.sendRedirect("AddTeachers.jsp");
%>