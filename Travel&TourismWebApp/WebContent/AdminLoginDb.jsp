 
<%@ page import="java.sql.*"%>
<%@ page trimDirectiveWhitespaces="true"%>

<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%
    	try{
            String email =request.getParameter("email");
            String password =request.getParameter("password");
    		Class.forName("com.mysql.jdbc.Driver");
    		Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/practice","root","root");
    		
            PreparedStatement p = cn.prepareStatement("select * from admin where email=? and password=?");
             
             p.setString(1,email);
             p.setString(2,password);
        	 ResultSet r = p.executeQuery();
             
             if(r.next())
             {
      			%>
	<jsp:forward page="Admin-DataDb.jsp"></jsp:forward>
	<%
             }
             else
             {
            	%>
	<jsp:include page="AdminLogin.html"></jsp:include>
	<%
             }
	}
	catch(Exception ex){
	%>
	<%
	out.println("Something went wrong please try again.");
			ex.printStackTrace();
	}
	%>

</body>
</html>