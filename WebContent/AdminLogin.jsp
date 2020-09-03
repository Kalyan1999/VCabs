<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>VCabs</title>

<link rel="stylesheet" href="CSS/WelcomePage.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Allerta+Stencil">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">

window.onbeforeload = function(){
	window.location.replace("Welcome.html");
}
</script>
<style>
.bgimg{
    background-image: url('CSS/Images/backgroundcar.jpg');
	min-height: 100%;
	background-position: center;
	background-size: cover;
}
</style>
</head>
<body>
<section class="bgimg">
 <section  id="myModal" role="dialog">
		<section class="modal-dialog">

			<!-- Modal content-->
			<section class="modal-content">
				<section class="modal-header" style="padding: 35px 50px;">
					<h4>
						<span class="glyphicon glyphicon-lock"></span> Login
					</h4>
				</section>

				<section class="modal-body" style="padding: 40px 50px;">
		      			<form role="form" action="AdminPage.jsp" method="post">
						<section class="form-group">
							<label for="phonenum"><span
								class="glyphicon glyphicon-user"></span> Phone number</label> <input
								type="tel" class="form-control" name="phoneNumber"
								placeholder="Enter phone number" maxlength="10" required>
						</section>
						
						<section class="form-group">
							<label for="psw"><span
								class="glyphicon glyphicon-eye-open"></span> Password</label> <input
								type="password" class="form-control" name="password"
								placeholder="Enter password" required>
						</section>

						<section class="checkbox">
							<label><input type="checkbox" value="">Remember
								me</label>
						</section>

						<button type="submit" class="btn btn-basic btn-block" >
							<span class="glyphicon glyphicon-off"></span> Login
						</button>

					</form>
				</section>

				<section class="modal-footer">
					<button type="submit" class="btn btn-danger btn-default pull-left"
						onclick="check()" data-dismiss="modal">
						<span class="glyphicon glyphicon-remove"></span> Cancel
					</button>
					<p>
						Not a member? <a href="DriverRegister.jsp">Sign Up</a>
					</p>
					<p>
						<a href="ForgetPassword.jsp">Forgot Password?</a>
					</p>
				</section>
			</section>

		</section>
	</section>
	</section>
   
</body>
</html>