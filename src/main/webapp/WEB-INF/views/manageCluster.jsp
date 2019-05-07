<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes.jsp" %>
<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<title>Manage Cluster</title>
<link rel="stylesheet" href="../stylesheets/style.css"> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>

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
   position:fixed;
   text-align: center;
/*    left:0px; */
   bottom:0px;
 /*   height:30px;
   width:100%;
   background:#999; */
} 
/* body {
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
<%-- <jsp:include page="header.jsp" /> --%>
<body >

  
  <div class="sidenav">
  <h1 style="color: Orange;">Manage Cluster</h1>
  <a href="/addCluster">Add Cluster</a>
  <a href="/manageCluster">Search Cluster</a>
  <a href="/editCluster">Update Cluster</a>
   
</div>

<div class="main">

<%-- <nav class="navbar navbar-inverse">
  <div class="container-fluid">
  
    <ul class="nav navbar-nav">
      <li class="active" ><a href="/home">Home</a></li>
      <li class="active"><a href="/dashboard">Dashboard</a></li>
      <li class="active"><a href="/manageSensor">Manage Sensors</a></li>
       <li class="active"><a href="/manageCluster">Manage Cluster</a></li>
        <li class="active"><a href="/manageNode">Manage Nodes</a></li>
         <li class="active"><a href="/getRealDataSensor">Manage Sensor Data</a></li>
    </ul>
     <ul class="nav navbar-nav navbar-right">
    
     
	<li class="active">   <a onclick="document.forms['logoutForm'].submit()"> <span class="glyphicon glyphicon-log-out"></span>Logout</a></li>
	        	
	
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
        			</li>

       			  
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
	<div class="col-lg-12 col-md-12">
		<form action="searchClusterForAdmin" method="post">
			<h2 class="form-heading">Cluster Search and Filter</h2>
			<div class="form-group ${error != null ? 'has-error' : ''}">
				<span style="color:green">${searchClusterMsg}</span>
				<span style="color:red">${searchClusterErrMsg}</span>
			</div>
			<div class="col-md-6">
			    <label class="m10s0">County :</label>
                <input class="m5s0 box-format" id="county" type="text" value="${county}" name = "county"><br>
                <button class="btn btn-lg btn-primary btn-block" type="submit">Search Cluster</button><br>
			</div>
		</form>
	</div>
</div>
<br>
<div class="container">
	<div class="col-lg-12 col-md-12">
		<table class="table table-bordered table-striped table-hover col-md-1" border="1">
			<th>Cluster ID</th>
			<th>Name</th>
			<th>Address</th>
			<th>County</th>
			<th>Latitude</th>
			<th>Longitude</th>
			<c:forEach items="${ClusterList}" var="cluster"> 
			
				<tr>
					<td>${cluster.clusterID}</td>
					<td>${cluster.name}</td>
					<td>${cluster.address}</td>
					<td>${cluster.county}</td>
				    <td>${cluster.latitude}</td>
					<td>${cluster.longitude}</td>
				</tr>
		
			</c:forEach>
		</table>
	</div>
</div>

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