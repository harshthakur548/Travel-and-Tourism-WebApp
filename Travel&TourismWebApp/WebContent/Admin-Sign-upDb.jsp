 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*"%>
<%@ page trimDirectiveWhitespaces="true"%>

<html>
<head>
<meta charset="ISO-8859-1">
<title>Register here!</title>
</head>
<body>

	<%
    	try{
            String uname =request.getParameter("uname");
            String email =request.getParameter("email");
            String password =request.getParameter("password");
           
    		Class.forName("com.mysql.jdbc.Driver");
    		Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/practice","root","root");
    	    String s = "insert into admin values(?,?,?)";
            
            PreparedStatement p = cn.prepareStatement(s);
             
             p.setString(1,uname);
             p.setString(2,email);
             p.setString(3,password);
         
           
        
        
             int i = p.executeUpdate();
             
             if(i>0)
             {
      			%>
	<jsp:forward page="AdminLogin.html"></jsp:forward>
	<%
             }
             else
             {
            	%>
	<jsp:include page="Admin-Sign-up.html"></jsp:include>
	<%
             }
	}
	catch(Exception ex){
	%>
	<% ex.printStackTrace();
	out.println("Something went wrong please try again.");
	}
	%>

</body>
</html>