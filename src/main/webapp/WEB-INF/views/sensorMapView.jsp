

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
       /* Set the size of the div element that contains the map */
      #map {
        height: 800px;  /* The height is 400 pixels */
        width: 100%;  /* The width is the width of the web page */
       }
    </style>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="resources/maps/data.js"></script>
  
  
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
  /* font-size: 25px; */ /* Increased text to enable scrolling */
  padding: 0px 10px;
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}

.map-responsive{
    overflow:hidden;
    padding-bottom:56.25%;
    position:relative;
    height:0;
}
.map-responsive iframe{
    left:0;
    top:0;
    height:100%;
    width:100%;
    position:absolute;
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
</div>

<div class="main">

<%--  <nav class="navbar navbar-inverse">
  <div class="container-fluid">
   
    <ul class="nav navbar-nav">
      <li class="active"><a href="/home">Home</a></li>
      <li class="active"><a href="/manageSensor">Manage Sensors</a></li>
       <li class="active"><a href="/manageCluster">Manage Cluster</a></li>
        <li class="active"><a href="/manageNode">Manage Nodes</a></li>
         <li class="active"><a href="/getRealDataSensor">Manage Sensor Data</a></li>
    </ul>
     <ul class="nav navbar-nav navbar-right">
       
	 <li class="active">  <a onclick="document.forms['logoutForm'].submit()"> <span class="glyphicon glyphicon-log-out"></span>Logout</a></li>
	        	   	
	 
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

<div id="map"></div>
    <script>
      // Initialize and add the map
      function initMap() {
          // The map, centered at mean of all locations in the bay area
          var length = data.locations['location'].length;
          var total_latitude = 0;
          var total_longitude = 0
          data.locations['location'].forEach(function (location) {
            total_latitude += location.latitude ;
            total_longitude += location.longitude;

          });
          latitude = total_latitude / length;
          longitude = total_longitude /length;
          var location = {
              lat: latitude,
              lng: longitude
          };
          var map = new google.maps.Map(
              document.getElementById('map'), {
                  zoom: 8,
                  center: location
              });


          data.locations['location'].forEach(function(obj) {
              // console.log(obj.id);
              var mkr = {
                  lat: obj.latitude,
                  lng: obj.longitude
              };
              var marker = new google.maps.Marker({
                  position: mkr,
                  map: map,
                  title: obj.type
              });
              if (obj.type == "ActiveSensor") {
                  marker.setIcon(markerIcon("#009900"));
              } else if (obj.type == "DeactiveSensor") {
                  marker.setIcon(markerIcon("#ff0000"));
              } else if (obj.type == "EmergencyStation") {
                  marker.setIcon(markerIcon("#FFF"));
              } else if (obj.type == "Node") {
                  marker.setIcon(markerIcon("#0000cc"));
              }

              if (obj.type == "ActiveSensor") {
                var center = {
                  lat: obj.latitude,
                  lng: obj.longitude
              };
              // Add the circle for this retail location to the map.
              var retailCircle = new google.maps.Circle({
                strokeColor: '#FF0000',
                strokeOpacity: 0.8,
                strokeWeight: 2,
                fillColor: '#FF0000',
                fillOpacity: 0.35,
                map: map,
                center: center,
                radius: Math.sqrt(obj.$revenue)
              });
            }

          })


      }

      function markerIcon(color) {
          return {
              path: 'M11.462 1c-1.363 0-2.462 1.127-2.462 2.526v42.946c0 1.262 1.231 2.527 2.462 2.527 1.23 0 2.461-1.266 2.461-2.527v-25.894c.841-.367 1.659-.632 2.462-.632 4.923 0 12.185 6.317 17.231 6.317 2.151 0 5.231-.871 7.384-2.527v-17.684c-2.442 1.879-4.916 3.79-7.384 3.79-4.923 0-12.291-6.316-17.231-6.316-.83 0-1.64.152-2.462.316v-.316c0-1.399-1.099-2.526-2.461-2.526z',
              fillColor: color,
              fillOpacity: 1,
              strokeColor: '#000',
              strokeWeight: 2,
              scale: 1,
          };
      }
    </script>
    <!--Load the API from the specified URL
    * The async attribute allows the browser to render the page while the API loads
    * The key parameter will contain your own API key (which is not needed for this tutorial)
    * The callback parameter executes the initMap() function
    -->
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDqLVPiBpMi6JRtKC7r5gFm97gAYmM-A8s&callback=initMap">
    </script>
<!-- <div class="map-responsive">

<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d423286.2817406297!2d-118.69259902630395!3d34.020159765904246!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x80c2c75ddc27da13%3A0xe22fdf6f254608f4!2sLos+Angeles%2C+CA!5e0!3m2!1sen!2sus!4v1556234792835!5m2!1sen!2sus" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>

<!-- </div> --> 
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