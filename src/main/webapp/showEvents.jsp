<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dbmsMiniProj.*,java.sql.*"%>

<%
	DataBaseCon dbc = new DataBaseCon();
	try{
		Connection con = dbc.getConnection();
		Statement stmt = con.createStatement();
		int pageC = Integer.parseInt(request.getParameter("pageCount"));
		String query = "select * from Events limit 5 offset "+(pageC-1)*5;
		String query2 = "select * from Events where ";
		//System.out.println("1" + query2);
		if(request.getParameter("searchEvent") != null){
			query2 += "eventName LIKE '%"+request.getParameter("searchEvent")+"%'";
		}
		//System.out.println("2" + query2);
		if(request.getParameter("eventCat") != null){
			if(query2.equals("select * from Events where ")){
				query2 = query2 + "eventCategory LIKE '"+request.getParameter("eventCat")+"'";
			}
			else{
				query2 = query2 + " and eventCategory LIKE '"+request.getParameter("eventCat")+"'";
			}
			
		}
		//System.out.println("3" + query2);
		if(request.getParameter("priceThres") != null){
			if(query2.equals("select * from Events where ")) query2 = query2 + " ticketPrice <= "+ request.getParameter("priceThres");
			else query2 = query2 + " and ticketPrice <= "+ request.getParameter("priceThres");
		}
		//System.out.println("4" + query2);
		if(request.getParameter("city") != null){
			if(query2.equals("select * from Events where ")) query2 = query2 + " cityName = '"+request.getParameter("city")+"'";
			else query2 = query2 + " and cityName = '"+request.getParameter("city")+"'";
		}
		//System.out.println("5" + query2);
		if(request.getParameter("fromDate") != null){
			if(query2.equals("select * from Events where ")) query2 = query2 + " eventDate >= '"+request.getParameter("fromDate")+"'";
			else query2 = query2 + " and eventDate >= '"+request.getParameter("fromDate")+"'";
		}
		//System.out.println("6" + query2);
		if(request.getParameter("toDate") != null){
			if(query2.equals("select * from Events where ")) query2 = query2 + " eventDate <= '"+request.getParameter("toDate")+"'";
			else query2 = query2 + " and eventDate <= '"+request.getParameter("toDate")+"'";
		}
		ResultSet rs;
		if(query2.equals("select * from Events where ")){
			rs = stmt.executeQuery(query);
		}
		else{
			rs = stmt.executeQuery(query2 + " limit 5 offset "+(pageC-1)*5);
		}
		//System.out.println(query2);
		while(rs.next()){
			if(rs.getInt("availableSeats") > 0){
				
			%><div class="card mt-2" style="width: 18rem;">
			<div class="card-body">
		    <h5 class="card-title text-success"><%= rs.getString("eventName") %></h5>
		    <h6 class="card-subtitle mb-2 text-muted"><%= rs.getString("cityName") %></h6>
		    <p class="card-text"><%= rs.getString("eventDesc") %></p>
		    <ul class="list-group list-group-flush">
    <li class="list-group-item bg-success text-light">Date: <%= rs.getString("eventDate") %></li>
    <li class="list-group-item">Time: <%= rs.getString("eventTime") %></li>
    <li class="list-group-item bg-success text-light">Price: <%= rs.getDouble("ticketPrice") %></li>
    <li class="list-group-item">No of Tickets Available: <%= rs.getInt("availableSeats") %></li>
  </ul>
  	
  	<%
  		if(request.getSession(false).getAttribute("type") != null && request.getSession(false).getAttribute("type").equals("user")){
  			%>
  			<form name="bookForm" action="Book" method="post" >
		    <div class="input-group mb-3">
  <input type="number" class="form-control" placeholder="No of Tickets" name="ticketCount" min="1">
  <button class="btn btn-outline-success" type="submit" name="key" value="<%=rs.getString("eventCategory")+"!"+rs.getString("eventName")+"!"+rs.getString("cityName")%>">Book</button>
</div>
</form><%
  		}
  		if(request.getSession(false).getAttribute("type") != null && request.getSession(false).getAttribute("type").equals("admin")){
  			%>
  			<form action="DeleteEvent" method="get">
		    <div class="input-group mb-3">
  <button class="btn btn-outline-danger" name="key" type="submit" value="<%=rs.getString("eventCategory")+"!"+rs.getString("eventName")+"!"+rs.getString("cityName")%>">Delete Event</button>
</div>
</form><%
  		}
  	%>
  	
		  </div>
		</div>
			
		<%
		}
		}
		con.close();
		dbc.closeConnection();
	}
	catch(Exception exc){
		exc.printStackTrace();
	}
%>