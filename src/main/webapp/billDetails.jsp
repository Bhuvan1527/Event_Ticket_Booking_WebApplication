<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*, dbmsMiniProj.*, java.time.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Your Bill</title>
<link href="bootstrap.min.css" rel="stylesheet">
<link href="style.css" rel="stylesheet">
</head>
<body>
<nav class="navbar navbar-expand-lg bg-success navbar-dark sticky-top">
		<div class="container">
			<a href="#" class="navbar-brand">Dhamaka Events</a>
			<div class="collapse navbar-collapse">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item"><a class="nav-link" href="Logout">Log
							Out</a></li>
					<li class="nav-item"><a class="nav-link" href="booking.jsp">Events</a>
					<li class="nav-item"><a class="nav-link" href="#contact">Contact</a>
					</li>
				</ul>
			</div>
		</div>

	</nav>
	<section class="bg-light">
	<h1 class="text-success text-center fw-bold">Thank you for Booking the Event</h1>
	<h2 class="text-secondary text-center">Please show the screenshot at the entry</h2> 
		<div class="con d-flex flex-row justify-content-center p-5">
			<%
			long millis=System.currentTimeMillis();
	DataBaseCon dbc = new DataBaseCon();
	try{
		Connection con = dbc.getConnection();
		Statement stmt = con.createStatement();
		String[] pkey = request.getParameter("key").split("!");
		int tc = Integer.parseInt(request.getParameter("ticketCount"));
		String query = "select * from Events where eventCategory = '"+pkey[0]+"' and eventName = '"+pkey[1]+"' and cityName = '"+pkey[2]+"'";
		ResultSet rs = stmt.executeQuery(query);
		if(rs.next()){
			%><div class="card mt-2" style="width: 25rem;">
			<div class="card-body">
		    <h5 class="card-title text-success"><%= rs.getString("eventName") %></h5>
		    <h6 class="card-subtitle mb-2 text-muted"><%= rs.getString("cityName") %></h6>
		    <p class="card-text"><%= rs.getString("eventDesc") %></p>
		    <ul class="list-group list-group-flush">
    <li class="list-group-item bg-success text-light">Event Date: <%= rs.getString("eventDate") %></li>
    <li class="list-group-item">Event Time: <%= rs.getString("eventTime") %></li>
    <li class="list-group-item bg-success text-light">Payment:	 <%= rs.getDouble("ticketPrice")*tc %></li>
    <li class="list-group-item">Ticket Booked on: <%= new java.sql.Date(millis).toString() %></li>
    <li class="list-group-item bg-success text-light">Tickets Booked: <%= tc%></li>
  </ul>
  	<button class="btn btn-danger" disabled="disabled">Booked</button>
  	<%
  		}
  	%>
  	
		  </div>
		</div>
		<%
		con.close();
		dbc.closeConnection();
	}
	catch(Exception exc){
		exc.printStackTrace();
	}
%>			
		</div>
	</section>
	<%@ include file="footer.html" %>
</body>
</html>