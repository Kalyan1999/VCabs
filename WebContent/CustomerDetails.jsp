<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>


<html>
<head>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<meta charset="utf-8">
<link rel="stylesheet" type="text/css"
	href="CSS/ConfirmBookingPage.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Allerta+Stencil">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Ubuntu" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	
<style>
.bgimg{
    background-image: url('CSS/Images/backgroundcar.jpg');
	min-height: 100%;
	background-position: center;
	background-size: cover;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="JS/RideHistory.js"></script>
<title>Booking Confirmed</title>
<script>
	function confirmGo(m, u) {
		if (confirm(m)) {
			window.location = u;
		}
	}
</script>
</head>
<body>
	<header>
		<div id="mySidenav" class="sidenav">
			<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
			<br> <a href="UserProfile.jsp"><span
				class="glyphicon glyphicon-user"
				style="font-size: 30px; color: white;"></span>&ensp; Your Account</a> <a></a>
				<a href="index.html"><span class="glyphicon glyphicon-off"
				style="font-size: 30px; color: white;"></span>&ensp; Log Out</a>
		</div>

		<div id="main">
			<span style="font-size: 40px; cursor: pointer" onclick="openNav()">&#9776;</span>
		</div>

		<div id="title" style="cursor: pointer" onclick="DriverSelectionPage.jsp">
			<span class="glyphicon glyphicon-map-marker"></span>VCabs
		</div>
		<hr>
	</header>
	<center>
		<h>You got a booking! </h>
		<p>Here are your customer's details:</p>
	</center>
	
	<sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/sys" user="root"
		password="kalyan" />
	
	<sql:query dataSource="${dbsource}" var="result">
         select customerId,source,destination,bookingTime from Ride where driverId = (select driverId from Ride order by bookingTime desc limit 1)order by bookingTime desc limit 1;
         
    </sql:query>
    
    <sql:query dataSource="${dbsource}" var="result1">
       select firstName from Customer where phoneNumber= (select customerId from Ride order by bookingTime desc limit 1);
    </sql:query>
        
	<section class="bgimg">
	<div class="container">
		<br>
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<div class="well well-sm">
					<div class="row">
						<div class="col-sm-6 col-md-4">
							<img src="http://placehold.it/380x500" alt=""
								class="img-rounded img-responsive" />
						</div>
						<div class="col-sm-6 col-md-8">
						    <c:forEach var="row1" items="${result1.rows}">
								<p><u>Customer Name</u></p>
								<p><c:out value="${row1.firstName}" /></p> <br>
								</p1>
							</c:forEach>
						
						    <c:forEach var="row" items="${result.rows}">
								<p><u>Phone number</u></p>
								<p><c:out value="${row.customerId}" /></p> <br>
								<p><u>Source</u></p>
								<p><c:out value="${row.source}" /></p> <br>
								<p><u>Destination</u></p>
								<p><c:out value="${row.destination}" /> </p><br>
								<p><u>Booking Time</u></p>
								<p><c:out value="${row.bookingTime}" /> </p><br>
								
								</p1>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
		<br>
		<center>
			<p>Enjoy your ride!</p>
		</center>
		</div>
		</section>
		
</body>
</html>
