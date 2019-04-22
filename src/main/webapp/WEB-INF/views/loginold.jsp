<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Home</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1 maximum-scale=1.0, user-scalable=no" />
    <link href="<c:url value="/resources/theme1/css/style.css"/>">
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"> 
    <script src="<c:url value="/resources/theme1/js/jquery-ui.min.klpy.css" />"></script>

 
</head>

<body class="bck-body">
  <nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="/">Smart Cloud Alert</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="/">Home</a></li>
      <li><a href="#">Dashboard</a></li>
      <li><a href="/manageSensor">Manage Sensors</a></li>
       <li><a href="#">Manage Cluster</a></li>
        <li><a href="#">Manage Nodes</a></li>
        <li id="home"><a href="/signup">Sign up</a></li>
    </ul>
  </div>
  </nav>
 <div class="col-md-3 form-horizontal bck-body">
	<form name="loginForm" action="loginApp"  class="report-form" style="width:100% !important" method="post"   >  
 	
 	<div class="">
 	      <div class="form-group">
			<label class="m10s0">UserName :</label> 
			<input class="m5s0 box-format"	id="userName" type="text" name = "userName"> <br />
			</div> 
 	      <div class="form-group">
			<label class="m10s0">Password : </label> 
			<input class="m5s0 box-format" id="userName" type="password" name = "passWord"> <br /> 
			</div> 

 	      <div class="form-group">
 	       <div class="col-md-offset-3 col-md-2">
			<input type="submit" class="btn btn-primary mt30" value="Login">
			<!--input class="m10s0" value="Signup" onclick="signup()"-->
		   </div>	
		</div> 
	</div>
	</form>
 </div>
</body>
</html>