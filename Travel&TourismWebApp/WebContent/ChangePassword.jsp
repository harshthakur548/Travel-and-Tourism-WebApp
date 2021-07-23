<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
String email=request.getParameter("email");
String password=request.getParameter("pass");
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/practice","root","root");
	PreparedStatement ps=con.prepareStatement("update member set password=? where email=?");
	ps.setString(1,password);
	ps.setString(2,email);
	int i=ps.executeUpdate();
	if(i>0)
	{
		response.sendRedirect("Login.html");
	}
	else{
		response.sendRedirect("ChangePassword.html");
	}
}
catch(Exception e)
{
	e.printStackTrace();
}
	%>
</body>
</html>