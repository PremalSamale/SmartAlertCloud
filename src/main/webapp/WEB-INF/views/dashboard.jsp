<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*" %>
<%@page import="edu.sjsu.smartalertcloud.fusioncharts.FusionCharts" %>
<script type="text/javascript" src="src/main/webapp/resources/theme1/js/fusioncharts.charts.js"></script> 
<script type="text/javascript" src="src/main/webapp/resources/theme1/js/piechart.js"></script> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>Dashboard</title>
<style>
#chartdiv {
  width: 100%;
  height: 500px;
}
</style>

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>Web Analytics - Real Time</title>

	<!-- stylesheets -->
	<link href="resources/assets/fonts/font-roboto.css" rel="stylesheet">
	<link href="resources/assets/bootstrap/bootstrap4-alpha3.min.css" rel="stylesheet">
	<link href="resources/assets/font-awesome/css/font-awesome.min.css" rel="stylesheet">
	<link href="resources/assets/web-analytics/style.css" rel="stylesheet">

	<!-- scripts -->
	<script src="resources/assets/jquery/jquery-3.1.0.min.js"></script>
	<script src="resources/assets/tether/tether.min.js"></script>
	<script src="resources/assets/bootstrap/bootstrap4-alpha3.min.js"></script>
	<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
	<script src="resources/assets/web-analytics/real-time.js"></script>


<link href="../Styles/ChartSampleStyleSheet.css" rel="stylesheet" />


<script type="text/javascript" src="//cdn.fusioncharts.com/fusioncharts/latest/fusioncharts.js"></script>
 <script src="<c:url value="/resources/theme1/js/sidebar.js" />"></script>

<script type="text/javascript" src="//cdn.fusioncharts.com/fusioncharts/latest/themes/fusioncharts.theme.fusion.js"></script>

    <script src="<c:url value="/resources/theme1/js/jquery-ui.min.klpy.css" />"></script>

 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">  
 <link rel="stylesheet" href="../stylesheets/card.css">
<!--  <style>

  
   div.b {
  position: absolute;
  right: 40px;
  top: 470px;
  }
 
 </style>
  -->
 <style>
body {
  font-family: "Lato", sans-serif;
}

.sidenav {
  height: 100%;
  width: 180px;
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
  margin-left: 150px; /* Same as the width of the sidenav */
  font-size: 25px; /* Increased text to enable scrolling */
  padding: 0px 10px;
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}

</style>


</head>
<body>

 <div class="sidenav">
<!--  <h1 style="color: Orange;">Dashboard </h1> -->
  <a href="/dashboard">Real Time </a>
   <a href="/sensorDataReport">Temperature Sensor Analysis</a>
  <a href="/sensorData">Humidity & Wind Sensor Analysis</a> 
  <a href="/clusterLocationView">View on Map</a>
 <!-- <a href="/sensorMapView">Sensor view on Map</a> --> 
 
   
</div>

<div class="main">

  <nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
  
    <ul class="nav navbar-nav">
      <li class="active"><a href="/home">Home</a></li>
      <li class="active"><a href="/dashboard">Dashboard</a></li>
      <li class="active"><a href="/manageSensor">Manage Sensors</a></li>
       <li class="active"><a href="/manageCluster">Manage Cluster</a></li>
        <li class="active"><a href="/manageNode">Manage Nodes</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
       
	 <li class="active">  <a onclick="document.forms['logoutForm'].submit()"> <span class="glyphicon glyphicon-log-out"></span>Logout</a> </li>
	        	   	
	 
	  <form id="logoutForm" method="POST" action="${contextPath}/logout">
	  </form>
	  <!-- /container -->
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </ul>
  </div>
</nav> 

 
<!--  <nav class="navbar navbar-fixed-top" id="header">
		<div class="container-fluid">
			<div class="navbar-header">
				<div id="sidebar-toggle-button">
					<i class="fa fa-bars" aria-hidden="true"></i>
				</div>
				<div class="brand">
					<a href="web-analytics-real-time.html">
						<span class="hidden-xs-down m-r-3">Web Analytics </span><span class="lead">Real Time</span>
					</a>
				</div>

			</div>
		</div>
	</nav> -->
	<!-- /header -->

	<!-- sidebar -->
<!-- 	<div class="sidebar-toggle" id="sidebar">
		<ul class="nav nav-sidebar">
			<li>
				<a href="/dashboard" class="active">
					<i class="fa fa-clock-o fa-lg fa-fw" aria-hidden="true"></i>
					<span>Real Time</span>
				</a>
			</li>
			<li role="separator" class="divider"></li>

			
		</ul>
	</div> -->
	<!-- /sidebar -->

	<!-- page-content-wrapper -->
	<div class="page-content-toggle" id="page-content-wrapper">
		<div class="container-fluid">

			<!-- 1st row -->
			<div class="row m-b-2">
				<div class="col-lg-4">
					<div class="card card-block">
						<h4 class="card-title"> Active Sensors</h4>
						<div id="users-device-doughnut-chart"></div>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="card card-block">
						<h4 class="card-title">Active Nodes</h4>
						<div id="users-medium-pie-chart"></div>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="card card-block">
						<h4 class="card-title">Active Clusters</h4>
						<div id="users-category-pie-chart"></div>
					</div>
				</div>
			</div>
			<!-- /1st row -->

			<!-- 2nd row -->
			<div class="row">
				<div class="col-lg-6">
					<div class="card card-block">
						<h4 class="card-title m-b-2">Temperature Sensors status Per Minute</h4>
						<div id="page-views-per-minute-column-chart"></div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="card card-block">
						<h4 class="card-title m-b-2"> Node status Per Second</h4>
						<div id="page-views-per-second-column-chart"></div>
					</div>
				</div>
			</div>
			<!-- /2nd row -->

			<!-- 3rd row -->
			<div class="row">
				<div class="col-md-12">
					<div class="card card-block">
						<h4 class="card-title">Location wise status </h4>
						<div id="users-state-bar-chart"></div>
					</div>
				</div>
			</div>
			<!-- /3rd row -->

		</div>
		<!-- /.container-fluid -->

	</div>
	<!-- /page-content-wrapper -->
 </div>
</body>
</html>