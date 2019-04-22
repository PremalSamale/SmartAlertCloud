<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<title>Sign Up</title>
<link rel="stylesheet" href="../stylesheets/style.css">
<link rel="stylesheet" href="../stylesheets/jquery-ui.min.klpy.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

 <!-- ying add ui widget accordian and AJAX tabs start hw4-->

	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
 <!-- ying add ui widget accordian and AJAX tabs end hw4-->

	
</head>
<body class="bck-body">
<nav class="navbar navbar-inverse">
	  <div class="container-fluid">
		<div class="navbar-header">
		  <a class="navbar-brand" href="/">Smart Cloud Alert</a>
		</div>
		<div class="collapse navbar-collapse" id="myNavbar">
		  <ul class="nav navbar-nav navbar-right">
		    <li class="active"><a href="/">Home</a></li>
			<li id="home"><a href="/login">Login</a></li>
		  </ul>
	 </div>
	  </div>
	</nav>

<div>


	<div class="col-md-4 form-horizontal pr30 ">
	<div id="id03"></div>
	<form name="signupForm" action="signup"  class="report-form" style="width:100% !important" method="post"   >  
 	
 	<div class="">
 	      <div class="form-group">
			<label class="m10s0 col-md-5 pr30">Officer Name :</label> 
			<input class="m5s0  col-md-7 box-format"	id="userName" type="text" name = "name"> <br />
			</div> 
		<div class="form-group">
			<label class="m10s0 col-md-5">Contact Number :</label> 
			<input class="m5s0 box-format col-md-7"	id="phoneNo" type="text" name = "phoneNo"> <br />
			</div> 
		<div class="form-group">
			<label class="m10s0 col-md-5">Officer Email :</label> 
			<input class="m5s0 box-format col-md-7"	id="email" type="text" name = "email"> <br />
			</div> 
 	    <div class="form-group">
			<label class="m10s0 col-md-5">Enter Password : </label> 
			<input class="m5s0 box-format col-md-7" id="password" type="password" name = "passWord"> <br /> 
			</div> 
		<div class="form-group">
			<label class="m10s0 col-md-5">Confirm Paswrd : </label> 
			<input class="m5s0 box-format col-md-7" id="conPswd" type="password" name = "conPswd"> <br /> 
			</div> 

 	      <div class="form-group">
 	       <div class="col-md-offset-3 col-md-2">
			<input type="submit" class="btn btn-primary mt30" value="Sign Up">
			<!--input class="m10s0" value="Signup" onclick="signup()"-->
		   </div>	
		</div> 
	</div>
	</form>
  </div>
 
</div>	




</body>

</html>