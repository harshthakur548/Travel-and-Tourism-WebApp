 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


	<%
    	try{
            String destination =request.getParameter("destination");
            String checkin =request.getParameter("checkin");
            String checkout =request.getParameter("checkout");
            String rooms =request.getParameter("rooms");
            String adults =request.getParameter("adults");
            String children =request.getParameter("children");
           
    		Class.forName("com.mysql.jdbc.Driver");
    		Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/practice","root","root");
    	    String s = "insert into reservation values(?,?,?,?,?,?)";
            
            PreparedStatement p = cn.prepareStatement(s);
             
             p.setString(1,destination);
             p.setString(2,checkin);
             p.setString(3,checkout);
             p.setString(4,rooms);
             p.setString(5,adults);
             p.setString(6,children);
         
           
        
        
             int i = p.executeUpdate();
             
             if(i>0)
             {
      			%>
	<jsp:forward page="OrderPlaced.html"></jsp:forward>
	<%
             }
             else
             {
            	%>
	<jsp:include page="Reservation.html"></jsp:include>
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