<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Add Cluster</title>
<link rel="stylesheet" href="../stylesheets/style.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
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


<style>
.footer {
	position: fixed;
	text-align: center;
	/*    left:0px; */
	bottom: 0px;
	/*   height:30px;
   width:100%;
   background:#999; */
}
/*  body {
         font-family: "Lato", sans-serif;
         } */
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
/*    .main {
         margin-left: 130px; /* Same as the width of the sidenav */
font-size
:
 
25
px
; /* Increased text to enable scrolling */

         
padding
:
 
0
px
 
10
px
;

         
}
*
/

         
@media screen and (max-height: 450px) {
	.sidenav {
		padding-top: 15px;
	}
	.sidenav a {
		font-size: 18px;
	}
}
</style>
</head>
<body>
	<div class="sidenav">
		<h1 style="color: Orange;">Manage Cluster</h1>
		<a href="/addCluster">Add Cluster</a> <a href="/manageCluster">Search
			Cluster</a> <a href="/editCluster">Update Cluster</a>
	</div>
	<div class="main">
		<%--      <nav class="navbar navbar-inverse">
            <div class="container-fluid">
               <ul class="nav navbar-nav">
                  <li class="active"><a href="/home">Home</a></li>
                  <li><a href="#">Dashboard</a></li>
                  <li><a href="/manageSensor">Manage Sensor</a></li>
                  <li><a href="/manageNode">Manage Nodes</a></li>
                  <li ><a href="/getRealDataSensor">Manage Sensor Data</a></li>
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
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#navbar">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#"><span
						class="glyphicon glyphicon-fire"></span> S.A.C</a>
				</div>
				<!-- Navbar links -->
				<div class="collapse navbar-collapse" id="navbar">
					<ul class="nav navbar-nav">

						<li class="active"><a href="/home">Home</a></li>
						<li class="active"><a href="/dashboard">Dashboard</a></li>
						<li class="active"><a href="/manageSensor">Manage Sensors</a></li>
						<li class="active"><a href="/manageCluster">Manage
								Cluster</a></li>
						<li class="active"><a href="/manageNode">Manage Nodes</a></li>
						<li class="active"><a href="/getRealDataSensor">Manage
								Sensor Data</a></li>


						<ul class="nav navbar-nav navbar-right">
							<li class="active"><a
								onclick="document.forms['logoutForm'].submit()"> <span
									class="glyphicon glyphicon-log-out"></span>Logout
							</a></li>


							<form id="logoutForm" method="POST"
								action="${contextPath}/logout"></form>
							<!-- /container -->
							<script
								src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
							<script
								src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


						</ul>
					</ul>


				</div>
				<!-- /.navbar-collapse -->
			</div>
			<!-- /.container -->
		</nav>





		<div class="container">
			<h2 class="mt30 col-md-offset-1">Add Cluster</h2>
			<form name="getLatitudeLongitudeCounty"
				action="getLatitudeLongitudeCounty" class="report-form"
				style="width: 100% !important" method="post">
				<div class="mt30 col-md-offset-1"
					style="width: 800px; margin: 0 auto;">
					<div class="form-group ${error != null ? 'has-error' : ''}">
						<span style="color: green">${getLatitudeLongitudeCountyMsg}</span>
						<span style="color: red">${getLatitudeLongitudeCountyErrMsg}</span>
						<div id="id01"></div>
					</div>
				</div>
				<div class="mt30 col-md-offset-1"
					style="width: 800px; margin: 0 auto;">
					<div class="form-group ${error != null ? 'has-error' : ''}">
						<span style="color: green">${addClusterMsg}</span> <span
							style="color: red">${addClusterErrMsg}</span>
						<div id="id01"></div>
					</div>
				</div>
				<div class="mt30 col-md-offset-1 form-group">
					<label class="m10s0">Cluster Address :</label> <input
						class="m5s0 box-format" id="address" type="text"
						value="${address}" name="address" required autofocus>
					<button class="btn btn-primary">Get Latitude, Longitude
						and County</button>
				</div>
			</form>
			<form name="addCluster" action="addCluster" class="report-form"
				style="width: 100% !important" method="post">
				<div class="mt30 col-md-offset-1 form-group">
					<div style="visibility: hidden">
						<label class="m10s0">Address :</label> <input
							class="m5s0 box-format" id="address" type="text"
							value="${address}" name="address">
					</div>
					<div class="form-group">
						<label class="m10s0">Name :</label> <input class="m5s0 box-format"
							id="name" type="text" name="name" required autofocus>
					</div>
					<div class="form-group">
						<label class="m10s0">County: </label> <input
							class="m5s0 box-format" id="county" type="text" value="${county}"
							name="county" required autofocus>
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
					<div class="m10s0">
						<h4></h4>
						<label>Terms and Conditions:<br />The above entered
							information is correct
						</label> <br />
						<div class="ml-120">
							<input type="checkbox" name="agree" value="agree" required
								autofocus> I agree</input><br>
						</div>
					</div>
					<button onclick="validateForm(this.form)" class="btn btn-primary">Submit</button>
				</div>
			</form>
		</div>
	</div>
	<footer class="footer">

		<div class="small-print">
			<div class="container">
				<center></center>
				<p>
					<a href="#">Terms &amp; Conditions</a> | <a href="#">Privacy
						Policy</a> | <a href="/">Contact</a>
				</p>
				</center>
				<center>
					<p>Copyright &copy; smartalertcloud.com 2019</p>
				</center>
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