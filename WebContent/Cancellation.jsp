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
			<a href="HomePage.jsp"><span
				class="glyphicon glyphicon-star-empty"
				style="font-size: 30px; color: white;"></span>&ensp; Your Ride</a> <a></a>
			<a href="RideCompleted.jsp"><span class="glyphicon glyphicon-credit-card"
				style="font-size: 30px; color: white;"></span>&ensp; Payment</a> <a></a>
			<a href="RideHistory.jsp"><span class="glyphicon glyphicon-list"
				style="font-size: 30px; color: white;"></span>&ensp; Rides History</a> <a></a>
			<a href="index.html"><span class="glyphicon glyphicon-off"
				style="font-size: 30px; color: white;"></span>&ensp; Log Out</a>
		</div>
		
	<sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/sys" user="root"
		password="kalyan" />
		
		
	    
        <sql:update dataSource="${dbsource}" var="result1">
    
        update driver set status='Available' where phoneNumber=(select driverId from Ride where customerId= <%=session.getAttribute("customerID")%>
        order by bookingTime desc limit 1);
        </sql:update>
        
        <sql:update dataSource="${dbsource}" var="result2">
    
          update Ride set status="Cancelled" order by bookingTime desc limit 1;
       </sql:update>
  
  
		<div id="main">
			<span style="font-size: 40px; cursor: pointer" onclick="openNav()">&#9776;</span>
		</div>

		<div id="title" style="cursor: pointer" onclick="HomePage.jsp">
			<span class="glyphicon glyphicon-map-marker"></span>VCabs
		</div>
		<hr>
	</header>
	<center>
		<h>Your Booking has been Cancelled!! </h>
		<center>
			</center>
		<form action="HomePage.jsp">
		    <input type="submit" class="btn btn-default submit" value="Book a Cab" />
		</form>
	
</body>
</html>
