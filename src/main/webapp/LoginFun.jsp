<%@page import="com.portal.services.UserService"%>
<%@page import="com.portal.models.User"%>
<% 

String email = request.getParameter("txtemail");
String pwd = request.getParameter("txtpwd");
session = request.getSession();

User u = new User();
UserService us = new UserService();
u = us.checkLoginDetails(email, pwd);
if(u!=null) {
	String name = u.getPersonname();
	session.setAttribute("name", name);
	if(email.equals("admin@gmail.com") && pwd.equals("admin@123")){
		response.sendRedirect("WelcomeAdmin.jsp");
	}
	else{
	response.sendRedirect("Welcome.jsp");
	}
}
else {
	out.print("<h2>Invalid username or password</h2>");
	response.sendRedirect("Loginpage.jsp");
}


%>