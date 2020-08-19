<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>


<html>
<head>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="CSS/RideHistory.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Allerta+Stencil">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="JS/RideHistory.js"></script>
<title>Registered Drivers</title>
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
		
		<div id="main">
			<span style="font-size: 40px; cursor: pointer" onclick="openNav()">&#9776;</span>
		</div>

		</div>

		<div id="title" style="cursor: pointer" onclick="">
			<a href="AdminPage.jsp" style="color: white"><span
				class="glyphicon glyphicon-map-marker"></span>VCabs </a>
		</div>
		<hr>
	</header>
		<sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/sys" user="root"
		password="kalyan" />
	
	
  
	<sql:query dataSource="${dbsource}" var="result">
            SELECT * from Driver;
        </sql:query>
        
   	<center>
		<form>
			<table class="table-responsive table-dark table-bordered"
				border="" width="60%">
				<thead class="thead">
					<tr height="10%">
						<th>First Name</th>
						<th>Last Name</th>
						<th>Email Id</th>
						<th>Phone number</th>
						<th>DOB</th>
						<th>Cab number</th>
					
					</tr>
				</thead>
				<c:forEach var="row" items="${result.rows}">
					<tr>
						<td width="30%"><c:out value="${row.firstName}" /></td>
						<td width="30%"><c:out value="${row.lastName}" /></td>
						</td>
						<td width="30%"><c:out value="${row.emailId}" /></td>
						<td width="30%"><c:out value="${row.phoneNumber}" /></td>
						<td width="50%"><c:out value="${row.DOB}" /></td>
						<td width="30%"><c:out value="${row.cabNumber}" /></td>
						
						<td><c:out value="${row.bookingTime}" /></td>
						

					</tr>
				</c:forEach>
			</table>
		</form>
	</center>

	
	
</body>
</html>
