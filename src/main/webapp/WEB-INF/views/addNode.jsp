<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Add Node</title>
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
  <h1 style="color: Orange;">Manage Cluster</h1>
  <a href="/addNode">Add Node</a>
  <a href="/manageNode">Search Node</a>
  <a href="/editNode">Update Node</a>
</div>

<div class="main">

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
  
    <ul class="nav navbar-nav">
      <li class="active"><a href="/home">Home</a></li>
      <li><a href="#">Dashboard</a></li>
       <li><a href="/manageSensor">Manage Sensor</a></li>
        <li><a href="/manageNode">Manage Nodes</a></li>
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

 
	<form name="addNode" action="addNode" class="report-form" style="width:100% !important"  method="post" > 
	<div style="width:800px; margin:0 auto;">	
	<h2 class="mt30 col-md-offset-1">Add Node</h2>
	<div class="form-group ${error != null ? 'has-error' : ''}">
				<span style="color:green">${addNodeMsg}</span>
				<span style="color:red">${addNodeErrMsg}</span>
	<div id="id01"></div>
	
		
	<!-- 	 <div class="form-group">
			<label class="m10s0">Last Date Of Maintenance :</label> 
			<input class="m5s0 box-format"	id="lastDateOfMaintainnance" type="datetime" name = "lastDateOfMaintainnance"> <br />
		</div> 
		
		
		 <div class="form-group">
			<label class="m10s0">Date Of Deployment :</label> 
			<input class="m5s0 box-format"	id="dateOfDeployment" type="datetime" name = "dateOfDeployment"> <br />
        </div>  -->
        

		<label class="m10s0">Select City: </label> 
		<div  class="form-group">
			<select name="city" required>
			<option value="NA" disabled selected hidden>Select City</option>
			  <option value="OAKLAND">OAKLAND </option>
			  <option value="FREEMONT">FREEMONT </option>
			  <option value="LONG_BEACH">LONG_BEACH</option>
			  <option value="MALIBU">MALIBU</option>
              <option value="CAMARILLO">CAMARILLO</option>
              <option value="PIRU">PIRU</option>
              <option value="RIDGEMARK">RIDGEMARK</option>
              <option value="HOLLISTER">HOLLISTER</option>
              <option value="DAVIS">DAVIS</option>
              <option value="MADISON">MADISON</option>
			</select>
		</div>
		
		 <div class="form-group">
			<label class="m10s0">Name :</label> 
			<input class="m5s0 box-format"	id="name" type="text" name = "name"> <br />
			</div> 
		 <br/>
		 <div class="form-group">
			<label class="m10s0">Description :</label> 
			<input class="m5s0 box-format"	id="description" type="text" name = "description"> <br />
        </div> 
        <br/>
        
        <div  class="form-group">
			<select name="status" required>
			<option value="NA" disabled selected hidden>Select Status</option>
              <option value="ON">ON </option>
              <option value="OFF">OFF </option>
              <option value="MAINTENANCE">MAINTENANCE </option>
			 
			</select>
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
	</div>	
	</form>
</div>
</body>
</html>