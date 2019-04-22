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

<style>
  .main-overview {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(265px, 1fr)); /* Where the magic happens */
    grid-auto-rows: 200px;
    grid-gap: 20px;
    margin: 20px;
  }
  
  .overviewcard {
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 20px;
    font-size: 40px;
    background-color: #d3d3;
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
  top: 470px;
  }
 
 </style>
 
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
 <h1 style="color: Orange;">Dashboard </h1>
  <a href="/dashboard">IOT </a>
  <a href="/mapView">Map View</a>
</div>

<div class="main">

  <nav class="navbar navbar-inverse">
  <div class="container-fluid">
  
    <ul class="nav navbar-nav">
      <li ><a href="/home">Home</a></li>
      <li><a href="/manageSensor">Manage Sensors</a></li>
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


 
 <div class="main-overview">
 
<div class="overviewcard">
    <div class="overviewcard__icon">Number of Sensors</div>
    <div class="overviewcard__info">400</div>
  </div>
 
 
  <div class="overviewcard">
    <div class="overviewcard__icon">Number of Nodes</div>
    <div class="overviewcard__info">100</div>
  </div> 
  
   <div class="overviewcard">
    <div class="overviewcard__icon">Number of Clusters</div>
    <div class="overviewcard__info">20</div>
  </div>
 
</div>  

 <div style = "position:relative; left:10px; top:300px;" id="chart" ></div>
<div class= "b" id="chart-container"></div> 
 

 <%
 
 // store chart config name-config value pair
 Map<String, String> chartConfig = new HashMap<String, String>();
/*  chartConfig.put("caption", "Regions With Most Wildfire Alerts [2017-18]");
 chartConfig.put("subCaption", "In MMbbl = One Million barrels");
 chartConfig.put("xAxisName", "Country");
 chartConfig.put("yAxisName", "Reserves (MMbbl)");
 chartConfig.put("numberSuffix", "k");
 chartConfig.put("theme", "fusion") ;*/
 chartConfig.put("caption", "Sensor status");
 chartConfig.put("subCaption", "In MMbbl = One Million barrels");
 chartConfig.put("xAxisName", "Country");
 chartConfig.put("yAxisName", "Reserves (MMbbl)");
 chartConfig.put("numberSuffix", "k");
 chartConfig.put("theme", "fusion");
 
 //store label-value pair
 Map<String, Integer> dataValuePair = new HashMap<String, Integer>();
 dataValuePair.put("Maintanance", 20);
 dataValuePair.put("Turn off", 5);
 dataValuePair.put("Turn On", 200);
 dataValuePair.put("Active", 140);
/*  dataValuePair.put("Central Coast", 115);
 dataValuePair.put("South Coast", 100);
 dataValuePair.put("Shasta Cascade", 30);
 dataValuePair.put("NOrth Coast", 30); */
 
  StringBuilder jsonData = new StringBuilder();
  StringBuilder data = new StringBuilder();
  // json data to use as chart data source
  jsonData.append("{'chart':{");
  for(Map.Entry conf:chartConfig.entrySet())
  {
      jsonData.append("'" + conf.getKey()+"':'"+conf.getValue() + "',");
  }
 
  jsonData.replace(jsonData.length() - 1, jsonData.length() ,"},");

  // build  data object from label-value pair
  data.append("'data':[");

  for(Map.Entry pair:dataValuePair.entrySet())
  {
      data.append("{'label':'" + pair.getKey() + "','value':'" + pair.getValue() +"'},");
  }
  data.replace(data.length() - 1, data.length(),"]");

  jsonData.append(data.toString());
  jsonData.append("}");
  
  
//Create chart instance
  // charttype, chartID, width, height,containerid, data format, data
  FusionCharts firstChart = new FusionCharts(
		  "column2d", 
		  "first_chart", 
		  "800",
		  "330", 
		  "chart",
		  "json", 
		  jsonData.toString()
 );
  FusionCharts piechart = new FusionCharts(
		  "pie2d", 
		  "piechart", 
		  "800",
		  "500", 
		  "chart-container",
		  "json", 
		  jsonData.toString()
 );

 %>
 <%= firstChart.render() %> 
  <%= piechart.render() %>



   
 </div>
 <footer style = "position:relative; left:10px; top:250px; class="footer">
  <div class="footer__copyright">&copy; 2018 MTH</div>
  <div class="footer__signature">Made by SJSU Students</div>
</footer>
</body>
</html>