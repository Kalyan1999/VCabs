<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<title>HomePage</title>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="CSS/Home_Page.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Allerta+Stencil">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="JS/Home_Page.js"></script>

</head>

<body>
	
	<div id="mySidenav" class="sidenav">
		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
		<br> <a href="UserProfile.jsp"><span
			class="glyphicon glyphicon-user"
			style="font-size: 30px; color: white;"></span>&ensp; Your Account</a> <a></a>
		<a href="HomePage.jsp"><span class="glyphicon glyphicon-star-empty"
			style="font-size: 29px; color: white;"></span>&ensp; Your Ride</a> <a></a>
		
			
			
		<a href="RideHistory.jsp"><span class="glyphicon glyphicon-list"
			style="font-size: 30px; color: white;"></span>&ensp; Rides History</a> <a></a>
		<a href="index.html"><span class="glyphicon glyphicon-off"
			style="font-size: 30px; color: white;"></span>&ensp; Log Out</a>
	</div>
	
	
	
	<div id="main">
		<span style="font-size: 40px; cursor: pointer" onclick="openNav()">&#9776;</span>
	</div>

	<div id="title" style="cursor: pointer" onclick="">
			<a href="SelectionPage.jsp" style="color:white"><span class="glyphicon glyphicon-map-marker"></span>VCabs
		</a>
		</div>
	<hr>
	
	

	<div id="map"></div>
     <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAVH7kZSu55QAuYXlXzCKJguGqdPfOJ1T4&callback=initMap"
     type="text/javascript"></script>
	
	 <div class="d-flex flex-row-reverse">
		<div class="heading">Take a Ride</div>
		<div class="row">
			<form role="form" action="RideController" method="post">
				<div class="col-md-offset-6">
					<div>
						<br> &ensp;
						<h>Source:</h>
						<br>
						&nbsp;
						&nbsp;
						&nbsp;
						
						<span class="tab-space"></span> <input name="source"  id ="source" class="control"
							type="text" placeholder="Your Source" required title="Enter Source"><br> &ensp;
						<h>Destination:</h>
						<br>
						&nbsp;
						&nbsp;
						&nbsp;
						
						<span class="tab-space"></span> <input name="destination" id="destination"
							class="control" type="text" placeholder="Your Destination" title="Enter Destination">
						<br> &ensp;
						<br>
						&nbsp;
						<h>Car Type:</h>
						&ensp;&ensp; <select class="selectpicker show-tick"
							data-style="btn-primary" id="type" name="type">
							<option value=6>Micro</option>
							<option value=8>Mini</option>
							<option value=18>SUV</option>
						</select> <br> <br> <span class="tab-space"></span>
						&ensp; <br> <br> &ensp;
						<h> Distance :</h>
						<br>
						&nbsp;
						&nbsp;
						&nbsp;
						<input id="distanceEstimate"  name="distanceEstimate" class="control" type="text"
							placeholder="" required title="Click Estimate Ride"><br> &ensp;
						<h> Ride Cost :(in Rs.)</h>
						<br>
						&nbsp;
						&nbsp;
						&nbsp;
						<input id="costEstimate"  name="costEstimate" class="control" type="text"
							placeholder="" required title="Click Estimate Ride"><br> &ensp;
						<h> Ride Time :(in hrs)</h>
						<br>
						&nbsp;
						&nbsp;
						&nbsp;
						
						<input id="timeEstimate" class="control" type="text"
							placeholder="" required title="Click Estimate Ride"> &ensp; <br> <span class="tab-space"></span>
						<br>
						
						<center><button type="submit" class="btn btn-default submit">
							Confirm Your Ride</button></center>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>
