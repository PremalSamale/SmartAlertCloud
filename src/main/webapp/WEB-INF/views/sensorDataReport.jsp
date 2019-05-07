<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*" %>
<%@page import="edu.sjsu.smartalertcloud.fusioncharts.FusionCharts" %>
<script type="text/javascript" src="src/main/webapp/resources/theme1/js/fusioncharts.charts.js"></script> 
<script type="text/javascript" src="src/main/webapp/resources/theme1/js/piechart.js"></script> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>



  <script src="https://cdn.anychart.com/geodata/1.2.0/countries/united_states_of_america/united_states_of_america.js"></script>
  <script src="https://cdn.anychart.com/releases/v8/js/anychart-base.min.js?hcode=be5162d915534272a57d0bb781d27f2b"></script>
  <script src="https://cdn.anychart.com/releases/v8/js/anychart-ui.min.js?hcode=be5162d915534272a57d0bb781d27f2b"></script>
  <script src="https://cdn.anychart.com/releases/v8/js/anychart-exports.min.js?hcode=be5162d915534272a57d0bb781d27f2b"></script>
  <script src="https://cdn.anychart.com/releases/v8/js/anychart-circular-gauge.min.js?hcode=be5162d915534272a57d0bb781d27f2b"></script>
  <script src="https://cdn.anychart.com/releases/v8/js/anychart-map.min.js?hcode=be5162d915534272a57d0bb781d27f2b"></script>
  <script src="https://cdn.anychart.com/releases/v8/js/anychart-table.min.js?hcode=be5162d915534272a57d0bb781d27f2b"></script>
  <script src="https://cdn.anychart.com/releases/v8/js/anychart-data-adapter.min.js?hcode=be5162d915534272a57d0bb781d27f2b"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/proj4js/2.3.15/proj4.js"></script>
  <link href="https://cdn.anychart.com/playground-css/maps_in_dashboard/USA_dashboard_multiselect/style.css" type="text/css" rel="stylesheet">
  <link href="https://cdn.anychart.com/releases/v8/css/anychart-ui.min.css?hcode=be5162d915534272a57d0bb781d27f2b" type="text/css" rel="stylesheet">
  <link href="https://cdn.anychart.com/releases/v8/fonts/css/anychart-font.min.css?hcode=be5162d915534272a57d0bb781d27f2b" type="text/css" rel="stylesheet">
  <style type="text/css">
html, body, #container {
    width: 100%;
    height: 100%;
    margin: 0;
    padding: 0;
}
</style>

<link href="../Styles/ChartSampleStyleSheet.css" rel="stylesheet" />


<script type="text/javascript" src="//cdn.fusioncharts.com/fusioncharts/latest/fusioncharts.js"></script>
 <script src="<c:url value="/resources/theme1/js/sidebar.js" />"></script>

<script type="text/javascript" src="//cdn.fusioncharts.com/fusioncharts/latest/themes/fusioncharts.theme.fusion.js"></script>

    <script src="<c:url value="/resources/theme1/js/jquery-ui.min.klpy.css" />"></script>

 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">  
 <link rel="stylesheet" href="../stylesheets/card.css">
 <style>

  
   div.b {
  position: absolute;
  right: 40px;
  }
 
 </style>
 
 <style>
/* body {
  font-family: "Lato", sans-serif;
} */

.sidenav {
  height: 100%;
  width: 180px;
  position: fixed;
  z-index: 1;
  top: 35;
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
 /*  font-size: 25px; */ /* Increased text to enable scrolling */
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
    <a href="/dashboard">Dashboard</a>
   <a href="/sensorDataReport">Temperature Sensor Analysis</a>
  <a href="/sensorData">Humidity & Wind Sensor Analysis</a> 
  <a href="/clusterLocationView">View on Map</a>
   <a href="/sensorMapView"> Network view on Map</a> 
</div>

<div class="main">
<%-- 
 <nav class="navbar navbar-inverse">
  <div class="container-fluid">
   
    <ul class="nav navbar-nav">
      <li class="active"><a href="/home">Home</a></li>
      <li class="active"><a href="/manageSensor">Manage Sensors</a></li>
       <li class="active"><a href="/manageCluster">Manage Cluster</a></li>
        <li class="active"><a href="/manageNode">Manage Nodes</a></li>
         <li class="active"><a href="/getRealDataSensor">Manage Sensor Data</a></li>
    </ul>
     <ul class="nav navbar-nav navbar-right">
     
	   <li class="active"><a onclick="document.forms['logoutForm'].submit()"> <span class="glyphicon glyphicon-log-out"></span>Logout</a></li>
	        	   	
	  
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

<div style = "position:relative; left:100px; top:40px;">
<div class='tableauPlaceholder' id='viz1556077888802' style='position: relative'><noscript><a href='#'><img alt=' ' src='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;Re&#47;ReportFoTemperatureDatafinal3&#47;Dashboard2&#47;1_rss.png' style='border: none' /></a></noscript><object class='tableauViz'  style='display:none;'><param name='host_url' value='https%3A%2F%2Fpublic.tableau.com%2F' /> <param name='embed_code_version' value='3' /> <param name='site_root' value='' /><param name='name' value='ReportFoTemperatureDatafinal3&#47;Dashboard2' /><param name='tabs' value='no' /><param name='toolbar' value='yes' /><param name='static_image' value='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;Re&#47;ReportFoTemperatureDatafinal3&#47;Dashboard2&#47;1.png' /> <param name='animate_transition' value='yes' /><param name='display_static_image' value='yes' /><param name='display_spinner' value='yes' /><param name='display_overlay' value='yes' /><param name='display_count' value='yes' /><param name='filter' value='publish=yes' /></object></div>                <script type='text/javascript'>                    var divElement = document.getElementById('viz1556077888802');                    var vizElement = divElement.getElementsByTagName('object')[0];                    vizElement.style.width='980px';vizElement.style.height='887px';                    var scriptElement = document.createElement('script');                    scriptElement.src = 'https://public.tableau.com/javascripts/api/viz_v1.js';                    vizElement.parentNode.insertBefore(scriptElement, vizElement);                </script> 
 </div>
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