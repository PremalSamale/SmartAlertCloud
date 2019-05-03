<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Add Sensor</title>
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
  <script>
       window.addEventListener("DOMContentLoaded", function() {
        ["94604","94608","94501","94502"].forEach( function(item) { 
        var o = document.createElement("option");
        o.text = item;
        o.value = item;
        document.getElementById("zip").appendChild(o);
        });

            ["ON","OFF","MAINTENANCE"].forEach( function(item) { 
            var o = document.createElement("option");
            o.text = item;
            o.value = item;
            document.getElementById("status").appendChild(o);
            });

            ["THERMAL","SMOKE","HUMIDITY"].forEach( function(item) { 
            var o = document.createElement("option");
            o.text = item;
            o.value = item;
            document.getElementById("type").appendChild(o);
            });

    
    }, false);

    $('select[name="zip"]').change(function(){

        if ($(this).val() == "94608"){
            document.getElementById("lat").innerHTML = "34";
            document.getElementById("long").innerHTML = "35";
        }        
});

  </script>

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
  <a href="/addSensor">Add Sensor</a>
  <a href="/manageSensor">Search Sensor</a>
  <a href="/editSensor">Update Sensor</a>
</div>

<div class="main">

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
  
    <ul class="nav navbar-nav">
      <li class="active"><a href="/home">Home</a></li>
      <li><a href="#">Dashboard</a></li>
       <li><a href="/manageCluster">Manage Cluster</a></li>
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

 
	<form name="addSensor" action="addSensor" class="report-form" style="width:100% !important"  method="post" > 
	<div style="width:800px; margin:0 auto;">	
	<h2 class="mt30 col-md-offset-1">Add Sensor</h2>
	<div class="form-group ${error != null ? 'has-error' : ''}">
				<span style="color:green">${addSensorMsg}</span>
				<span style="color:red">${addSensorErrMsg}</span>
	<div id="id01"></div>

        

		<label class="m10s0">Select Zip: </label> 
		<div  class="form-group">
			<select name="zip" id="zip" required>
			<option value="NA" disabled selected hidden>Select Zip</option>
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

      
        <label class="m10s0">Select Sensor Type: </label> 
        <div  class="form-group">
			<select name="type" id="type" required>
			<option value="NA" disabled selected hidden>Select Type</option>
			</select>
        </div>
        <br/>

        <div class="form-group">
			<label class="m10s0">Latitude :</label> 
			<input class="m5s0 box-format"	id="lat" type="text" name = "lat"> <br />
			</div> 
		 <br/>
		 <div class="form-group">
			<label class="m10s0">Longitude :</label> 
			<input class="m5s0 box-format"	id="long" type="text" name = "long" > <br />
        </div> 
        <br/>
        
        <div  class="form-group">
			<select name="status" id="status" required>
			<option value="NA" disabled selected hidden>Select Status</option>
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