<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>VCabs Registration</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Allerta+Stencil">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" 	href="CSS/Register_.css">
<script
	src="JS/Register.js"></script>

</head>

<body>

	<section class="bgimg w3-display-container w3-text-black "> <br>
	<br>
	<br>
	<section class="container"> <section class="container-header"
		style="padding:35px 50px;">
	<h4>
		<span class="glyphicon glyphicon-pencil"></span>Driver Registration
	</h4>
	</section> <section class="container-body" style="padding:40px 50px;">
	<form role="form" action="CreateDriver" method="post">
		<section class="form-group"> <label for="firstName"><span
			class="glyphicon glyphicon-user"></span> First Name</label> <input
			type="text" class="form-control" name="firstName" required=""
			placeholder="Enter First Name"> </section>

		<section class="form-group"> <label for="lastName"><span
			class="glyphicon glyphicon-user"></span> Last Name</label> <input type="text"
			class="form-control" name="lastName" required=""
			placeholder="Enter Last Name"> </section>

		<section class="form-group"> <label for="emailID"><span
			class="glyphicon glyphicon-envelope"></span> Email ID</label> <input
			type="email" class="form-control" name="emailID" required=""
			placeholder="Enter Email ID"> </section>

		<section class="form-group"> <label for="gender"><span
			class="glyphicon glyphicon-user"></span> Gender</label> <br>
		<label class="radio-inline"> <input type="radio" name="gender"
			value="M"> Male
		</label> <label class="radio-inline"> <input type="radio"
			name="gender" value="F"> Female
		</label> </section>

		<section class="form-group"> <label for="dateOfBirth"><span
			class="glyphicon glyphicon-calendar"></span> Date Of Birth</label> <input
			type="date" class="form-control" name="dateOfBirth" required=""
			placeholder="Enter Date of Birth"> </section>

		<section class="form-group"> <label for="phoneNumber"><span
			class="glyphicon glyphicon-phone"></span> Phone numer</label> <input
			type="tel" class="form-control" name="mobileNumber" maxlength="10"
			required="" placeholder="Enter Phone Number"> </section>

		<section class="form-group"> <label for="password"><span
			class="glyphicon glyphicon-eye-open"></span> Password</label> <input
			type="password" class="form-control" name="password" id = "password" required=""
			placeholder="Enter Password"> </section>

		<section class="form-group"> <label for="reEnterPassword"><span
			class="glyphicon glyphicon-eye-open"></span> Re-enter Password</label> <input
			type="password" class="form-control" name="reEnterPassword"
			required="" id="reEnterPassword" placeholder="Re-enter Password"> </section>
			
		<section class="form-group"> <label for="cabNumber"><span
		class="glyphicon glyphicon-scale">
		</span> Cab Number</label> <input type="text"
			class="form-control" name="cabNumber" required=""
			placeholder="Enter Cab Number"> </section>
		

		<button type="submit" class="btn btn-basic btn-block" >
			<span class="glyphicon glyphicon-ok"></span> Sign Up
		</button>

	</form>
	</section> <section class="container-footer">
	<p align="center">
		Already a member? <a href="index.html">Login</a>
	</p>
	</section> </section> </section>



</body>
</html>

