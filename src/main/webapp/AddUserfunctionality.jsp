<%@page import="com.portal.models.User"%>
<%@page import="com.portal.services.UserService"%>
<% 
String name = request.getParameter("txtpname");
String email= request.getParameter("txtemail");
String pwd= request.getParameter("txtpwd");
String pwd2= request.getParameter("txtpwd2");
if(pwd.equals(pwd2)) {
	UserService us = new UserService();
	User u = new User();
	u.setPersonname(name);
	u.setUsername(email);
	u.setPassword(pwd);
	us.addUser(u);
	out.print("<h2>You are signed up successfully</h2>");
	response.sendRedirect("Loginpage.jsp");

}
else {
	out.print("<h2>Password details mismatch Try again!!</h2>");
	response.sendRedirect("Signup.jsp");
}

%>