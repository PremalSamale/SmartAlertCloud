<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>Edit Cluster</title>
<link rel="stylesheet" href="../stylesheets/style.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
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
  <a href="/addCluster">Add Cluster</a>
  <a href="/manageCluster">Search Cluster</a>
  <a href="/editCluster">Update Cluster</a>
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


<div class="container">
	<div class="col-lg-12 col-md-12">
    	<h1>Edit or Delete Cluster</h1>
	</div>
</div>

 <div class="container">
	<div class="col-lg-12 col-md-12">
		<form action="searchClusterForEdit" method="post">
			<h2 class="form-heading">Cluster Search and Filter</h2>
			<div class="form-group ${error != null ? 'has-error' : ''}">
				<span style="color:green">${searchClusterMsg}</span>
				<span style="color:red">${searchClusterErrMsg}</span>
				<table class="col-lg-12 col-md-12">
					<tr>
						<td><input name="clusterID" type="text" class="form-control" placeholder="clusterID" autofocus="true"/></td>						
						<td>
							<select name="county" type="text" class="form-control" size="3" multiple autofocus="true">
								<option value="" disabled selected>County</option>
							 	<option value="ALAMEDA">Alameda </option>
			  					<option value="LOS_ANGELES">Los_Angeles </option>
			  					<option value="VENTURA">Ventura</option>
			  					<option value="SAN_BANITO">San_Benito</option>
			  					<option value="YOLO">Yolo</option>
							</select>
						</td>
					</tr>
					<tr>
						<td colspan='7'><button class="btn btn-lg btn-primary btn-block" type="submit">Search Cluster</button></td>
					</tr>
				</table>
			</div>
		</form>
	</div>
</div>
<br>


<div class="container">
	<div class="col-lg-12 col-md-12">
		<table class="table table-bordered table-striped table-hover col-md-1" border="1">
			<th>clusterID</th>
			<th>County </th>
			<th> Latitude </th>
			<th>Longitude </th>			
			<th>Edit Cluster</th>
			<th>Delete Cluster</th>
			<%-- <c:forEach items="${movieList}" var="movie"> --%>
			<c:forEach items="${ClusterList}" var="cluster"> 
				<tr>
					<form action="chooseClusterToEditOrDelete" method="post">
						<td><input name="clusterID" type="text" autofocus="true" value="${cluster.clusterID}"/></td>
						<td><input name="county" type="text" autofocus="true" value="${cluster.county}"/></td>
						<td><input name="latitude" type="text" autofocus="true" value="${cluster.latitude}"/></td>
				    	<td><input name="longitude" type="text" autofocus="true" value="${cluster.longitude}"/></td>					
						<td>
							<input type="submit" name="action" value="Edit"/>
						</td>
						<td>
							<input type="submit" name="action" value="Delete"/>
						</td>
					</form>
				</tr>
			</c:forEach>
		</table>
		<span style="color:green">${submitEditedClusterMsg}</span>
	</div>
</div>
<div style="${editClusterDivStyle}" class="container">
	<div class="col-md-12">
		<form action="submitEditedCluster" method="post">
			<h3 class="form-heading">Edit Cluster</h3>
			<div class="form-group ${error != null ? 'has-error' : ''}">
				<span style="color:green">${submitEditedClusterMsg}</span>
				<span style="color:red">${submitEditedClusterErrMsg}</span>
				<table class="col-lg-12 col-md-12">
					<tr><input name="clusterID" value="${clusterID}" required="required" type="hidden" class="form-control" placeholder="clusterID" autofocus="true"/></tr>	
					<tr>
						
						<td><label>County</label></td>
						<td>
							<select name="county" value="${county}" required="required" type="text" class="form-control" autofocus="true">
						        <option value="" disabled selected>County</option>
								 <option value="ALAMEDA">ALAMEDA </option>
			 					 <option value="LOS_ANGELES">LOS_ANGELES </option>
			  					 <option value="VENTURA">VENTURA</option>
			  					<option value="SAN_BANITO">SAN_BANITO</option>
			  					<option value="YOLO">YOLO</option>
							</select>
						</td>
					</tr>
				    <tr>
						<td><label>latitude</label></td>
						<td><input name="latitude" value="${latitude}" required="required" type="text" class="col-lg-6 col-md-6 form-control" placeholder="latitude" autofocus="true"/></td>
					</tr>
					
					<tr>
						<td><label>longitude</label></td>
						<td><input name="longitude" value="${longitude}" required="required" type="text" class="col-lg-6 col-md-6 form-control" placeholder="logitude" autofocus="true"/></td>
					</tr>
					
					<tr>
						<td colspan='2'><button class="btn btn-lg btn-primary btn-block" type="submit">Edit Cluster</button></td>
					</tr>
				</table>
			</div>
		</form>
	</div>
</div>	
</div>
</body>
</html>