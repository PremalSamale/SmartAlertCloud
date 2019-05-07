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
<!-- Bootstrap Core CSS -->
    <link href="resources/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS: You can use this stylesheet to override any Bootstrap styles and/or apply your own styles -->
    <link href="resources/css/custom.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
 
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
 
   .footer {
   position:fixed;
   text-align: center;
   bottom:0px;
} 
/* body {
  font-family: "Lato", sans-serif;
}
 */
.sidenav {
  height: 100%;
  width: 160px;
  position: fixed;
  z-index: 1;
  top: 3;
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

/* .main {
  margin-left: 130px; /* Same as the width of the sidenav */
  font-size: 25px; /* Increased text to enable scrolling */
  padding: 0px 10px;
} */

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

<%-- <nav class="navbar navbar-inverse">
  <div class="container-fluid">
  
    <ul class="nav navbar-nav">
      <li class="active"><a href="/home">Home</a></li>
      <li><a href="/dashboard">Dashboard</a></li>
       <li><a href="/manageCluster">Manage Cluster</a></li>
        <li><a href="/manageNode">Manage Nodes</a></li>
        <li><a href="/getRealDataSensor">Manage Sensor Data</a></li>
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
</nav> --%>



    <!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Logo and responsive toggle -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#"><span class="glyphicon glyphicon-fire"></span> S.A.C</a>
            </div>
            <!-- Navbar links -->
            <div class="collapse navbar-collapse" id="navbar">
                <ul class="nav navbar-nav">
                
                        <li class="active" ><a href="/home">Home</a></li>
      					<li class="active"><a href="/dashboard">Dashboard</a></li>
      					<li class="active"><a href="/manageSensor">Manage Sensors</a></li>
       					<li class="active"><a href="/manageCluster">Manage Cluster</a></li>
        				<li class="active"><a href="/manageNode">Manage Nodes</a></li>
         				<li class="active"><a href="/getRealDataSensor">Manage Sensor Data</a></li>

       			  
     		<ul class="nav navbar-nav navbar-right">	   
	   		<li class="active">	 <a onclick="document.forms['logoutForm'].submit()"> <span class="glyphicon glyphicon-log-out"></span>Logout</a></li>
		            	
				
	  			<form id="logoutForm" method="POST" action="${contextPath}/logout">
	  			</form>
	  			<!-- /container -->
	  			<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	  			<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	  			
	  		
    			</ul>
                </ul>


            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
         


 <div class="container">
			<h2 class="mt30 col-md-offset-1">Add Sensor</h2> 
			<form name="getLatitudeLongitudeSensor"
				action="getLatitudeLongitudeSensor" class="report-form"
				style="width: 100% !important" method="post">
				<div class="mt30 col-md-offset-1"
					style="width: 800px; margin: 0 auto;">
					<div class="form-group ${error != null ? 'has-error' : ''}">
						<span style="color: green">${getLatitudeLongitudeSensorMsg}</span>
						<span style="color: red">${getLatitudeLongitudeSensorErrMsg}</span>
						<div id="id01"></div>
					</div>
				</div>
				<div class="mt30 col-md-offset-1"
					style="width: 800px; margin: 0 auto;">
					<div class="form-group ${error != null ? 'has-error' : ''}">
						<span style="color: green">${addSensorMsg}</span> <span
							style="color: red">${addSensorErrMsg}</span>
						<div id="id01"></div>
					</div>
				</div>
				<div class="mt30 col-md-offset-1 form-group">
					<label class="m10s0">Sensor Address :</label> <input
						class="m5s0 box-format" id="address" type="text"
						value="${address}" name="address" required autofocus>
					<button class="btn btn-primary">Get Latitude, Longitude
						and City</button>
				</div>
			</form>
	<form name="addSensor" action="addSensor" class="report-form" style="width:100% !important"  method="post" > 
	<!-- <div style="width:800px; margin:0 auto;"> -->	
	<div class="mt30 col-md-offset-1 form-group">

  
       <div style="visibility: hidden">
			<label class="m10s0">Address :</label> <input
			class="m5s0 box-format" id="address" type="text"
			value="${address}" name="address">
	   </div>

		<div class="form-group">
			<label class="m10s0">Zip: </label> <input
			class="m5s0 box-format" id="zip" type="text" value="${zip}"
			name="zip" required autofocus>
		</div>
		<div class="form-group">
			<label class="m10s0">Latitude :</label> <input
			class="m5s0 box-format" id="latitude" type="text"
			value="${latitude}" name="latitude" required autofocus>
		</div>
		<div class="form-group">
			<label class="m10s0">longitude :</label> <input
			class="m5s0 box-format" id="longitude" type="text"
			value="${longitude}" name="longitude" required autofocus>
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

         <label class="m10s0">Select Sensor Status: </label> 
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
	</div>
	</div>	
	</form>
	     <footer class="footer" >
        
        <div class="small-print" >
        	<div class="container">
        		<center></center><p><a href="#">Terms &amp; Conditions</a> | <a href="#">Privacy Policy</a> | <a href="/">Contact</a></p></center>
        		<center><p>Copyright &copy; smartalertcloud.com 2019 </p></center>
        	</div>
        </div>
	</footer>   
	
</div>
    <!-- jQuery -->
    <script src="resources/js/jquery-1.11.3.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="resources/js/bootstrap.min.js"></script>
	
	<!-- IE10 viewport bug workaround -->
	<script src="resources/js/ie10-viewport-bug-workaround.js"></script>
	
	<!-- Placeholder Images -->
	<script src="resources/js/holder.min.js"></script> 
</body>
</html>