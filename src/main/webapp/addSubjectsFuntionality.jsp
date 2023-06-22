<%@page import="com.portal.services.SubjectService"%>
<%@page import="com.portal.models.Subjects"%>
<% 
String subname = request.getParameter("txtsname");
Subjects subjects = new Subjects();
SubjectService subjectService = new SubjectService();
subjects.setSubject_name(subname);
subjectService.addSubject(subjects);
response.sendRedirect("AddSubjects.jsp");

%>