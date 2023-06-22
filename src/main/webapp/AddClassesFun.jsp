<%@ page import="com.portal.services.ClassesService" %>
<%@ page import="com.portal.services.SubjectService" %>
<%@ page import="com.portal.models.Classes" %>
<%@ page import="com.portal.models.Subjects" %>
<%@ page import="java.util.*" %>

<%
String className = request.getParameter("txtcname");
String subject1 = request.getParameter("ddlsubject1");
String subject2 = request.getParameter("ddlsubject2");
String subject3 = request.getParameter("ddlsubject3");
String subject4 = request.getParameter("ddlsubject4");
String subject5 = request.getParameter("ddlsubject5");

Classes classes = new Classes();
ClassesService classesService = new ClassesService();
classes.setClass_name(className);
classes.setSubject1(subject1);
classes.setSubject2(subject2);
classes.setSubject3(subject3);
classes.setSubject4(subject4);
classes.setSubject5(subject5);
classesService.addClasses(classes);

response.sendRedirect("AddClasses.jsp");
%>
