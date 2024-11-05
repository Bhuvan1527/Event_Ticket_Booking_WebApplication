<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<title>Events</title>
<link href="bootstrap.min.css" rel="stylesheet">

<!-- <link href="/home/bhuvan/uoh/sem5/dbms/html/bootstrap-5.2.2-dist/css/bootstrap.min.css" > -->
<link href="style.css" rel="stylesheet">


<link href='https://fonts.googleapis.com/css?family=Alegreya'
	rel='stylesheet'>
</head>

<body>
	<nav class="navbar navbar-expand-lg bg-success navbar-dark sticky-top">
		<div class="container">
			<a href="main.jsp" class="navbar-brand">Dhamaka Events</a>
			<div class="collapse navbar-collapse">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item"><a href="#" class="nav-link">Home</a></li>
					<li class="nav-item"><a href="#aboutus" class="nav-link">About
							us</a></li>
					<li class="nav-item"><a href="#login" class="nav-link">Login</a>
					</li>
					<li class="nav-item"><a href="#signup" class="nav-link">SignUp</a>
					</li>
					<li class="nav-item"><a href="booking.jsp" class="nav-link">Events</a>
					</li>
					<li class="nav-item"><a href="#contact" class="nav-link">contact</a>
					</li>
				</ul>
			</div>
		</div>

	</nav>

	<section>
		<div class="container text-center ">
			<span
				class="text-success fs-1 fw-bold pt-3 text-decoration-underline">WELCOME
				TO EVENTS</span>
			<div class="container pt-3 w-10 lead">We started the event
				management system very recently. Here the admins(we) will update the
				events that are held in the following cities. And the users can book
				the tickets for any event.</div>
		</div>
	</section>
	<section class="bg-success">
		<div
			class="container d-flex flex-column d-lg-flex flex-lg-row justify-content-between align-items-center my-5 p-5 bg-dark">
			<img class="p-2" src="./images/hyd.png"> <img class="p-2"
				src="./images/mumbai.webp"> <img class="p-2"
				src="./images/goa.png">
		</div>
		<div
			class="container d-flex flex-column d-lg-flex flex-lg-row  justify-content-between align-items-center p-5 bg-dark">

			<img class="p-2" src="./images/kolkata.png"> <img class="p-2"
				src="./images/agra.png">
		</div>
	</section>

	<section id="aboutus" class="bg-light bg-gradient p-4">
		<div class="container">
			<div class="text-center text-decoration-underline fs-2 text-success">About
				us</div>
			<div class="row align-items-center bg-success text-light m-1">
				<div class="col-4 text-right">
					<img class="img-fluid ml-2" src="images/shanks.jpeg">
				</div>
				<div class="col-8 text-wrap">
					FOUNDER OF THE COMPANY<br>Lorem ipsum dolor sit amet
					consectetur adipisicing elit. Quam, aspernatur odit modi aliquam
					vel natus nemo quas dicta quidem iusto vitae eaque, illo tenetur
					quos eligendi. Quo hic aut nemo.
				</div>
			</div>
			<div class="row align-items-center bg-dark text-success m-1">
				<div class="col-8">
					CO-FOUNDER OF THE COMPANY<br>Lorem ipsum dolor sit amet
					consectetur adipisicing elit. Quam, aspernatur odit modi aliquam
					vel natus nemo quas dicta quidem iusto vitae eaque, illo tenetur
					quos eligendi. Quo hic aut nemo.
				</div>
				<div class="col-4 text-left">
					<img class="img-fluid" src="images/cofounder.jpeg">
				</div>
			</div>
			<div class="row align-items-center bg-success text-light m-1">
				<div class="col-4 text-right">
					<img class="img-fluid ml-2" src="images/ContentEditor.jpeg">
				</div>
				<div class="col-8">Lorem ipsum dolor sit amet consectetur
					adipisicing elit. Quam, aspernatur odit modi aliquam vel natus nemo
					quas dicta quidem iusto vitae eaque, illo tenetur quos eligendi.
					Quo hic aut nemo.</div>
			</div>
			<div class="row align-items-center bg-dark text-success m-1">
				<div class="col-8">Lorem ipsum dolor sit amet consectetur
					adipisicing elit. Quam, aspernatur odit modi aliquam vel natus nemo
					quas dicta quidem iusto vitae eaque, illo tenetur quos eligendi.
					Quo hic aut nemo.</div>
				<div class="col-4 text-left">
					<img class="img-fluid" src="images/sanji.jpeg">
				</div>
			</div>
		</div>
	</section>
	<section id="signup">
		<div class="container">
			<div class="fs-1 text-decoration-underline text-center text-success">Sign
				Up</div>
				
				<%
					
					if(request.getParameter("sue") != null){
						%><div class="text-danger text-center"><%= request.getParameter("sue").toString() %></div><%
					}
				%>
			<form class="border border-light p-5 bg-light text-success" name="signupForm" onsubmit="return signupValidate()" accept-charset=utf-8 action="SignUp" method="post">
			
				<div class="row align-items-center mb-1 mb-md-3">
					<div class="col-12 col-md-2">Name:</div>
					<div class="col-12 col-md-4">
						<input type="text" class="form-control" name="name"
							placeholder="Please donot insert special characters">
					</div>
				</div>
				<div class="row align-items-center mb-1 mb-md-3">
					<div class="col-12 col-md-2">Email ID:</div>
					<div class="col-12 col-md-4">
						<input type="email" class="form-control" name="emailID"
							placeholder="example@gmail.com">
					</div>
				</div>
				<div class="row align-items-center mb-1 mb-md-3">
					<div class="col-12 col-md-2">Phone Number:</div>
					<div class="col-12 col-md-4">
						<input type="text" class="form-control" name="phno"
							placeholder="Only numbers of length 10">
					</div>
				</div>
				<div class="row align-items-center mb-1 mb-md-3">
					<div class="col-12 col-md-2">User Name:</div>
					<div class="col-12 col-md-4">
						<input type="text" class="form-control" name="usrname"
							placeholder="starts with alphabet or underScore">
					</div>
				</div>
				<div class="row align-items-center mb-1 mb-md-3">
					<div class="col-12 col-md-2">Password</div>
					<div class="col-12 col-md-4">
						<input type="password" class="form-control" name="passwd"
							placeholder="starts with alphabet or underScore">
					</div>
				</div>
				<span class="text-danger fs-3 fw-bold" id="signupErr"></span><br>
				<input type="submit" value="Sign Up">
			</form>
		</div>
	</section>
	<section id="login" class="mb-5">
		<div class="container">
			<div class="fs-1 text-decoration-underline text-center text-success">Login</div>
			<%
					
					if(request.getParameter("loginError") != null){
						%><div class="text-danger text-center"><%= request.getParameter("loginError") %></div><%
					}
				%>
			<form class="border border-dark p-5 bg-success text-light"
				onsubmit="return loginValidate()" name="loginForm" accept-charset=utf-8 action="Login" method="post">
				<div class="row align-items-center mb-1 mb-md-3">
					<div class="col-12 col-md-2">User Name:</div>
					<div class="col-12 col-md-4">
						<input type="text" class="form-control" name="usrname"
							placeholder="starts with alphabet or underScore">
					</div>
				</div>
				<div class="row align-items-center mb-1 mb-md-3">
					<div class="col-12 col-md-2">Password</div>
					<div class="col-12 col-md-4">
						<input type="password" class="form-control" name="passwd"
							placeholder="starts with alphabet or underScore">
					</div>
				</div>
				<div class="row align-items-center mb-1 mb-md-3">
					<div class="col-12">Who are you?</div>
					<div class="col-12 col-sm-1">
						<div class="form-check">
							<input class="form-check-input" type="radio" name="usrType"
								id="flexRadioDefault1" value="user"> <label
								class="form-check-label" for="flexRadioDefault1"> User </label>
						</div>


					</div>
					<div class="col-12 col-sm-1">
						<div class="form-check">
							<input class="form-check-input" type="radio" name="usrType"
								id="flexRadioDefault2" value="admin"> <label
								class="form-check-label" for="flexRadioDefault2"> Admin
							</label>
						</div>

					</div>
				</div>
				<span class="text-warning fs-3 fw-bold" id="loginErr"></span><br>
				<input type="submit" value="Login">
			</form>
		</div>
	</section>
	
	<%@ include file="footer.html" %>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>
	<script src="javaScript.js"></script>
</body>

</html>