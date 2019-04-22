<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Manage Sensor</title>
<link rel="stylesheet" href="../stylesheets/style.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<!--link rel="stylesheet" type="text/css" href="css/jquery-ui-lightness/jquery-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="css/dragdrop.css" />
    <script type="text/javascript" src="js/jquery.js">
    </script>
    <script type="text/javascript" src="js/jquery-ui-lightness/jquery-ui.min.js">
    </script>
    <script type="text/javascript" src="js/dragdrop.js">
    </script-->

 
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 <style>
body {
  background-color: #FFFFFF;
}

</style>



 <style>
body {
  font-family: "Lato", sans-serif;
}

.sidenav {
  height: 100%;
  width: 160px;
  position: fixed;
  z-index: 1;
  top: 0;
  left: 0;
  background-color: #111;
  overflow-x: hidden;
  padding-top: 20px;
}

.sidenav a {
  padding: 6px 8px 6px 16px;
  text-decoration: none;
  font-size: 25px;
  color: #f1f1f1;
  display: block;
}

.sidenav a:hover {
  color: #23e0e0;
}

.main {
  margin-left: 130px; /* Same as the width of the sidenav */
  font-size: 25px; /* Increased text to enable scrolling */
  padding: 0px 10px;
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}

</style>
</head>
<body >

 
	
 <div class="sidenav">
 <h1 style="color: Orange;">Manage Sensor</h1>
  <a href="/manageSensor">Add Sensor</a>
  <a href="/manageSensor">Search Sensor</a>
  <a href="/manageSensor">Update Sensor</a>
</div>

<div class="main">
 <nav class="navbar navbar-inverse">
  <div class="container-fluid">
    
    <ul class="nav navbar-nav">
      <li class="active"><a href="/home">Home</a></li>
      <li><a href="/dashoard">Dashboard</a></li>
       <li><a href="/manageCluster">Manage Cluster</a></li>
        <li><a href="/manageNodes">Manage Nodes</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
       <u>
	   <a onclick="document.forms['logoutForm'].submit()"> <span class="glyphicon glyphicon-log-out"></span>Logout</a>
	        	&nbsp;&nbsp;     	
	  </u>
	  <form id="logoutForm" method="POST" action="${contextPath}/logout">
	  </form>
	  <!-- /container -->
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </ul>
  </div>
</nav>


	<form name="manageSensor" action="manageSensor" class="report-form"  style="width:100% "  method="post" > 
	<div style="width:800px; margin:0 auto;">	
	<h2 >Add Sensor</h2>
	<div id="id01"></div>
		<label  >Select Sensor Type: </label> 
		<div>
			<select name="Sensor Types" required>
			  <option value="NA" disabled selected hidden>Select Type</option>
			  <option value="Temperature">Temperature Sensor</option>
			  <option value="Light Sensor">Light Sensor</option>
			  <option value="Smoke, Gas Sensor">Smoke, Gas Sensor</option>
			  <option value="Humidity">Humidity Sensor</option>
			</select>
		</div>
		 <br/>
		<label >Select Node: </label> 
		<div>
			<select name="Node" required>
			<option value="NA" disabled selected hidden>Select Node</option>
			  <option value="Node 1">Burger</option>
			  <option value="Node 2">Pizza</option>
			  <option value="Node 3">Salad</option>
			  <option value="Node 4">Rice and Vegetables</option>
			</select>
		</div>
		 <br/>
			<label >Select Cluster: </label> 
		<div>
			<select name="Cluster" required>
			<option value="NA" disabled selected hidden>Select Cluster</option>
			  <option value="Cluster 1">Burger</option>
			  <option value="Cluster 2">Pizza</option>
			  <option value="Cluster 3">Salad</option>
			  <option value="Cluster 4">Rice and Vegetables</option>
			</select>
		</div>
		 <br/>
		 <div>
		 <div class="form-group">
			<label class="m10s0">Latitude :</label> 
			
			<input class="m5s0 box-format"	id="Latitude" type="text" name = "Latitude"> <br />
		
			</div> 
		 <br/>
		 <div class="form-group">
			<label class="m10s0">longitude :</label> 
		
			<input class="m5s0 box-format"	id="longitude" type="text" name = "longitude"> <br />
			
			</div> 
			
		</div>
		<div class="m10s0">
			<h4></h4>
			<label>Terms and Conditions:<br/>The above entered information is correct</label> <br/>
			<div class="ml-120">
			<input type="checkbox" name="agree" value="agree" required autofocus> I agree</input><br>
			</div>
		</div>
		<button onclick="validateForm(this.form)"  class="btn btn-primary">Submit</button>
	</div>	
	</form>

	</div>

	<br/>
	<br/>
	</div>

</div>

</body>
</html>