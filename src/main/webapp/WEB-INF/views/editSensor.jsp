<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ include file="/WEB-INF/views/includes.jsp"%>
<!DOCTYPE html><%@ taglib prefix="spring"
	uri="http://www.springframework.org/tags"%>
<html>
<head>
<title>Update Node</title>
<link rel="stylesheet" href="../stylesheets/style.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

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

/*   body {
         font-family: "Lato", sans-serif;
         }  */
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
/*   .main {
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
<style>
input[type=grey_input] {
	background-color: rgb(233, 230, 230);
	color: black;
}

.blank_row {
	height: 10px !important; /* overwrites any other rules */
	background-color: #FFFFFF;
}
</style>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script><script>
 $(document).ready(function(){
   $("#mydropdownlist").val("thevalue");
});
 </script> -->
<body>
	<div class="sidenav">
		<h1 style="color: Orange;">Manage Sensor</h1>
		<a href="/addSensor">Add Sensor</a> <a href="/manageSensor">Search
			Sensor</a> <a href="/editSensor">Update Sensor</a>
	</div>
	<div class="main">
		<%-- 		 <nav class="navbar navbar-inverse">
							<div class="container-fluid">
								<ul class="nav navbar-nav">
									<li >
										<a href="/home">Home</a>
									</li>
									<li>
										<a href="/dashboard">Dashboard</a>
									</li>
									<li>
										<a href="/manageCluster">Manage Cluster</a>
									</li>
									<li>
										<a href="/manageSensor">Manage Sensors</a>
									</li>
									 <li><a href="/getRealDataSensor">Manage Sensor Data</a></li>
								</ul>
								<ul class="nav navbar-nav navbar-right">
									<u>
										<a onclick="document.forms['logoutForm'].submit()">
											<span class="glyphicon glyphicon-log-out"></span>Logout
										</a>
                  &nbsp;&nbsp;     	
                  
									</u>
									<form id="logoutForm" method="POST" action="${contextPath}/logout"></form>
									<!-- /container -->
									<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
									<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
								</ul>
							</div>
						</nav>  --%>
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
			<div class="col-lg-12 col-md-12">
				<form action="searchNodeForUpdate" method="get">
					<h2 class="form-heading">Search Filter</h2>
					<div class="form-group ${error != null ? 'has-error' : ''}">
						<span style="color: green">${searchClusterMsg}</span> <span
							style="color: red">${searchClusterErrMsg}</span>
						<table class="col-lg-12 col-md-12">
							<tr>
								<td><select name="city" type="text" class="form-control"
									size="3" multiple autofocus="true">
										<option value="OAKLAND" disabled>City</option>
										<option value="OAKLAND">OAKLAND</option>
										<option value="FREEMONT">FREEMONT</option>
										<option value="LONG_BEACH">LONG_BEACH</option>
										<option value="MALIBU">MALIBU</option>
										<option value="CAMARILLO">CAMARILLO</option>
										<option value="PIRU">PIRU</option>
										<option value="RIDGEMARK">RIDGEMARK</option>
										<option value="HOLLISTER">HOLLISTER</option>
										<option value="DAVIS">DAVIS</option>
										<option value="MADISON">MADISON</option>
								</select></td>
							</tr>
							<tr>
								<td colspan='7' class="blank_row"></td>
							</tr>
							<tr>
								<td colspan='7'>
									<button class="btn btn-lg btn-primary btn-block" type="submit">Search
										Node</button>
								</td>
							</tr>
						</table>
					</div>
				</form>
			</div>
		</div>
		<br>
		<div class="container">
			<div class="col-lg-12 col-md-12">
				<table
					class="table table-bordered table-striped table-hover col-md-1"
					border="1" width="100%" border="0" cellspacing="0" cellpadding="0">
					<th>Node ID</th>
					<th>City</th>
					<th>Name</th>
					<th>Description</th>
					<th>Status</th>
					<th>Edit Node</th>
					<th>Delete Node</th>
					<c:forEach items="${NodeList}" var="node">
						<tr>
							<form action="editNode" method="post">
								<td><input type="grey_input" name="nodeID" type="text"
									readonly value="${node.getNodeId()}" /></td>
								<td><input type="grey_input" name="city" readonly
									type="text" value="${node.city}" /></td>
								<!-- <td><select name="city" required="required" type="text" class="form-control" autofocus="true"><option value="OAKLAND" disabled>City </option><option value="OAKLAND" >OAKLAND </option><option value="FREEMONT">FREEMONT </option><option value="LONG_BEACH">LONG_BEACH</option><option value="MALIBU">MALIBU</option><option value="CAMARILLO">CAMARILLO</option><option value="PIRU">PIRU</option><option value="RIDGEMARK">RIDGEMARK</option><option value="HOLLISTER">HOLLISTER</option><option value="DAVIS">DAVIS</option><option value="MADISON">MADISON</option></select></td> -->
								<td><input name="name" type="text" autofocus="true"
									value="${node.name}" /></td>
								<td><input name="description" type="text" autofocus="true"
									value="${node.description}" /></td>
								<td><input name="status" type="text" autofocus="true"
									value="${node.status}" /></td>
								<td><input type="submit" name="action" value="Edit" /></td>
								<td><input type="submit" name="action" value="Delete" /></td>
							</form>
						</tr>
					</c:forEach>
				</table>
				<span style="color: green">${editNodeResponse}</span>
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

<!-- 	IE10 viewport bug workaround -->
	<script src="resources/js/ie10-viewport-bug-workaround.js"></script>

<!-- 	Placeholder Images -->
	<script src="resources/js/holder.min.js"></script>
</body>
</html>
