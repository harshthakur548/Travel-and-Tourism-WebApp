<html>
<head>
<meta charset="ISO-8859-1">
	<%@ page import="java.sql.*"%>
	<%@ page import="java.io.*"%>
<title>Admin Data!</title>

  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

  <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet" />
  <link href="assets/css/fresh-bootstrap-table.css" rel="stylesheet" />
</head>
<body> 
 <div class="fresh-table full-color-orange" style="background-image: url('https://images.pexels.com/photos/707582/pexels-photo-707582.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260');  height: 650px;
   width: 100%;">
 
  <div class="toolbar">

<button class="btn btn-primary" >
  <span class="spinner-border spinner-border-sm"></span>
  Loading..
</button>
 
    <a href = "index.html" id="alertBtn" class="btn btn-primary btn-lg" style="float:right;" >Log-out!</a>
  </div> 
  <table id="fresh-table" class="table">
    <thead>
      <th>Destination</th>
      <th>Check-In</th>
      <th>Check-Out</th>
      <th>Rooms</th>
      <th>Adults</th>
      <th>Children</th>
    </thead>
					<%
					try {
						Class.forName("com.mysql.jdbc.Driver");
						Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Practice", "root", "root");
						PreparedStatement ps = con.prepareStatement("Select * from reservation"); 
						ResultSet rs = ps.executeQuery(); 
						 
						while (rs.next()) 
						{

							out.print("<tr>");
							out.print("<td>" + rs.getString(1) + "</td>");
							out.print("<td>" + rs.getString(2) + "</td>");
							out.print("<td>" + rs.getString(3) + "</td>");
							out.print("<td>" + rs.getString(4) + "</td>");
							out.print("<td>" + rs.getString(5) + "</td>");
							out.print("<td>" + rs.getString(6) + "</td>"); 
							out.print("</tr>");
			}
			out.print("</table>");
  

}

catch (SQLException e) {
e.printStackTrace();
	}
					%>
					</table> 
					<% %>
</body>
</html>