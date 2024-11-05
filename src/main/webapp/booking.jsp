<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ page import="dbmsMiniProj.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Booking Tickets</title>
<link href="bootstrap.min.css" rel="stylesheet">
<link href="style.css" rel="stylesheet">
</head>
<body onload="showEventList(1)">
	<nav class="navbar navbar-expand-lg bg-success navbar-dark sticky-top">
		<div class="container">
			<a href="main.jsp" class="navbar-brand">Dhamaka Events</a>
			<div class="collapse navbar-collapse">
				<ul class="navbar-nav ms-auto">
					<%
					if (request.getSession(false) != null) {
					%><li class="nav-item"><a class="nav-link" href="Logout">Log
							Out</a></li>
					<%
					}
					%>
					<%
						if(request.getSession(false).getAttribute("type") != null && request.getSession(false).getAttribute("type").equals("admin")){
							%><li class="nav-item"><a class="nav-link" href="#addEvent" >Add Events</a></li><%
						}
					%>
					<li class="nav-item"><a class="nav-link" href="#contact">Contact</a>
					</li>
				</ul>
			</div>
		</div>

	</nav>

	<%
	String name = "User";
	if (request.getSession(false).getAttribute("name") != null) {
		name = (String) request.getSession().getAttribute("name");
	}
	%>
	<section class="bg-light text-danger">
		<div
			class="border border-danger text-center container m-1 m-md-5 p-2 p-md-5 text-decoration-underline fs-1 fw-bold">
			Welcome To the Event Booking Page,<%=name%></div>
	</section>
	<%
		if(request.getParameter("deleteMesg") != null){
			%><p class="text-center fs-3 fw-bold text-danger"><%=request.getParameter("deleteMesg")%></p><%
		}
	%>
	<p class="text-danger text-center fs-3 fw-bold" id="bookErr"></p>
	<section class="bg-success p-5 m-2">
		<div class="container bg-light p-4">
			<div class="row">
				<div class="col-6">
					<div class="input-group mb-3">
						<input type="text" class="form-control" placeholder="eventName"
							id="searchEvent">
						<button class="btn btn-outline-success" type="button"
							onclick="showEventList(1)">Search Event</button>
					</div>
				</div>
				<div class="col-6 text-center">
					<button class="btn btn-outline-success" type="button"
						data-bs-toggle="collapse" data-bs-target="#filter"
						aria-expanded="false" aria-controls="filter">Filter Menu
					</button>
				</div>
			</div>

			<div class="collapse" id="filter">
				<div class="card card-body">
					<!-- 					<form name="filterForm" class="row align-items-center" onsubmit="showEventList()"> -->
					<div class="row align-items-center">
						<div class="col-4" id="cate">
							Event Category: <select class="form-select mb-2"
								aria-label="eventCat" id="eventCategory">
								<option value="default" selected>Select Event Category</option>
								<option value="Sports">Sports</option>
								<option value="Conferences">Conferences</option>
								<option value="Expo">Expo</option>
								<option value="Concerts">Concerts</option>
								<option value="Community">Community</option>
								<option value="Performing Arts">Performing Arts</option>
								<option value="Comedy Shows">Comedy Shows</option>
								<option value="Kids">Kids</option>
							</select>
						</div>
						<div class="col-4 mb-2">
							Date: <br> from <input class="mb-2" type="date"
								id="fromDate"> <br>To <input type="date"
								id="toDate">
						</div>
						<div class="col-4 mb-2">
							Price: <select class="form-select mb-2" aria-label="price"
								id="eventPrice">
								<option value="default" selected>Select Price</option>
								<option value="100">Less than 100</option>
								<option value="500">Less than 500</option>
								<option value="2000">Less than 2000</option>
							</select>
						</div>
						<div class="col-4 mb-2">
							City: <select class="form-select mb-2" aria-label="eventCity"
								id="eventCity">
								<option value="default" selected>Select City</option>
								<option value="Hyderabad" onclick="showCate()">Hyderabad</option>
								<option value="Mumbai" onclick="showCate()">Mumbai</option>
								<option value="Goa" onclick="showCate()">Goa</option>
								<option value="Agra" onclick="showCate()">Agra</option>
								<option value="Kolkata" onclick="showCate()">Kolkata</option>
							</select>
						</div>

						<button class="btn btn-primary w-25" type="button"
							onclick="showEventList(1)">filter</button>
						<button class="btn btn-outline-success w-25" type="button"
							onclick="resetFilter()">Reset</button>
					</div>
				</div>
			</div>
			<div id="event-list"
				class="d-flex flex-wrap flex-row align-items-center justify-content-evenly">

			</div>
			<nav aria-label="Page navigation example">
				<div class="text-center">
					<ul class="pagination">
					<li class="page-item"><a class="page-link"
						aria-label="Previous" onclick="prevPage()">&laquo;
					</a></li>
					<li class="page-item"><a class="page-link" id="page">1</a></li>
					<li class="page-item"><a class="page-link"
						aria-label="Next"  onclick="nextPage()" >&raquo;</a></li>
				</ul>
				</div>
			</nav>
		</div>
	
	</section>
	
	<%
	if(request.getSession(false).getAttribute("type") != null && request.getSession(false).getAttribute("type").equals("admin")){
		%>
		<section class="bg-success bg-gradient m-2 text-light py-5" id="addEvent">
		<%
			if(request.getParameter("addEventMesg") != null){
				%><h3 class="text-center text-danger fw-bold"><%= request.getParameter("addEventMesg") %></h3><%			}
		%>
		<form class="row mx-5 my-2 g-3" method="post" action="AddEvent">
			<div class="col-6 mb-2">
				<label for="eventName" class="form-label">Event Name</label>
    <input type="text" class="form-control" name="eventName">
			</div>
			<div class="col-6 mb-2">
				<label for="city" class="form-label">City</label>
    			<select name="city" class="form-select">
      				<option value="Hyderabad" selected>Hyderabad</option>
      				<option value="Mumbai">Mumbai</option>
      				<option value="Goa">Goa</option>
      				<option value="Agra">Agra</option>
      				<option value="Kolkata">Kolkata</option>
    </select>
			</div>
			<div class="col-12">
				<label for="category" class="form-label">Event Category</label>
    			<select name="category" class="form-select">
      				<option value="default" selected>Select Event Category</option>
								<option value="Sports">Sports</option>
								<option value="Conferences">Conferences</option>
								<option value="Expo">Expo</option>
								<option value="Concerts">Concerts</option>
								<option value="Community">Community</option>
								<option value="Performing Arts">Performing Arts</option>
								<option value="Comedy Shows">Comedy Shows</option>
								<option value="Kids">Kids</option>
    			</select>
			</div>
			<div class="col-md-6">
    <label for="eventDate" class="form-label">Event Date</label>
    <input type="date" class="form-control" name="eventDate">
  </div>
  <div class="col-md-6">
    <label for="eventTime" class="form-label">Event Time</label>
    <input type="time" class="form-control" name="eventTime">
  </div>
  <div class="col-4">
  	<label for="totSeats" class="form-label">Total Seats</label>
  	<input type="number" class="form-control" name="totSeats">
  </div>
  <div class="col-4">
  	<label for="availableSeats" class="form-label">Available Seats</label>
  	<input type="number" class="form-control" name="availableSeats">
  </div>
  <div class="col-4">
  	<label for="price" class="form-label">Ticket Price</label>
  	<input type="text" class="form-control" name="price">
  </div>
  <div class="col-12 input-group">
  <span class="input-group-text">Event Description(short)</span>
  <textarea class="form-control" aria-label="With textarea" name="desc"></textarea>
</div>
	<button type="submit" class="btn btn-outline-dark">Add Event</button>
		</form>
	</section>
		<% 
		
	}
	%>
	
		<%@ include file="footer.html"%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>
	<script src="javaScript.js"></script>
	<script>
	function resetFilter(){
		document.getElementById('searchEvent').value = "";
		document.getElementById('eventCategory').value = "";
		document.getElementById('eventPrice').value = "";
		document.getElementById('eventCity').value = "";
		document.getElementById('fromDate').value = "";
		document.getElementById('toDate').value = "";
		location.reload();
	}
	function showCate() {
		let city = document.getElementById('eventCity').value;
		const xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				document.getElementById('cate').innerHTML = this.responseText;
			}
		};
		console.log('before sending');
		xhttp.open('get', "ShowCategeory?city="+city);
		xhttp.send();
		console.log('after sending');
	}
	function bookValidation(){
		let tc = Number(document.forms['bookForm']['ticketCount'].value);
		document.getElementById('bookErr').innerHTML = "";
		if(tc <= 0){
			document.getElementById('bookErr').innerHTML = "Invalid Ticket Count.";
			return false;
		}
		return true;
	}
	</script>
</body>
</html>