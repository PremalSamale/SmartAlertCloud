<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%@ include file="/WEB-INF/views/includes.jsp" %>
<!DOCTYPE html><%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
	<head>
		<title>Update Node</title>
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
				<style> 
    input[type=grey_input] {
      background-color: rgb(233, 230, 230);
      color: black;
    }
   

.blank_row
{
    height: 10px !important; /* overwrites any other rules */
    background-color: #FFFFFF;
}
   </style>
				<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script><script>
 $(document).ready(function(){
   $("#mydropdownlist").val("thevalue");
});
 </script> -->
				<body >
					<div class="sidenav">
						<h1 style="color: Orange;">Manage Node</h1>
						<a href="/addSensor">Add Sensor</a>
						<a href="/manageNode">Search Node</a>
						<a href="/editNode">Update Node</a>
					</div>
					<div class="main">
						<nav class="navbar navbar-inverse">
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
						</nav>
						<div class="container">
							<div class="col-lg-12 col-md-12">
								<form action="searchNodeForUpdate" method="get">
									<h2 class="form-heading">Search Filter</h2>
									<div class="form-group ${error != null ? 'has-error' : ''}">
										<span style="color:green">${searchClusterMsg}</span>
										<span style="color:red">${searchClusterErrMsg}</span>
										<table class="col-lg-12 col-md-12">
											<tr>
												<td>
													<select name="city" type="text" class="form-control" size="3" multiple autofocus="true">
														<option value="OAKLAND"  disabled>City </option>
														<option value="OAKLAND" >OAKLAND </option>
														<option value="FREEMONT">FREEMONT </option>
														<option value="LONG_BEACH">LONG_BEACH</option>
														<option value="MALIBU">MALIBU</option>
														<option value="CAMARILLO">CAMARILLO</option>
														<option value="PIRU">PIRU</option>
														<option value="RIDGEMARK">RIDGEMARK</option>
														<option value="HOLLISTER">HOLLISTER</option>
														<option value="DAVIS">DAVIS</option>
														<option value="MADISON">MADISON</option>
													</select>
												</td>
                                 </tr>
                                 <tr>
                                       <td colspan='7' class="blank_row">
                                            
                                          </td>
                                 </tr>
											<tr>
												<td colspan='7'>
													<button class="btn btn-lg btn-primary btn-block" type="submit">Search Node</button>
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
									<table class="table table-bordered table-striped table-hover col-md-1" border="1" width="100%" border="0" cellspacing="0" cellpadding="0">
										<th>Node ID</th>
										<th>City </th>
										<th> Name </th>
										<th>Description </th>
										<th>Status </th>
										<th>Edit Node</th>
										<th>Delete Node</th>
										<c:forEach items="${NodeList}" var="node">
											<tr>
												<form action="editNode" method="post">
													<td>
														<input type="grey_input" name="nodeID" type="text" readonly value="${node.getNodeId()}"/>
													</td>
													<td>
														<input type="grey_input" name="city" readonly type="text" value="${node.city}"/>
													</td>
													<!-- <td><select name="city" required="required" type="text" class="form-control" autofocus="true"><option value="OAKLAND" disabled>City </option><option value="OAKLAND" >OAKLAND </option><option value="FREEMONT">FREEMONT </option><option value="LONG_BEACH">LONG_BEACH</option><option value="MALIBU">MALIBU</option><option value="CAMARILLO">CAMARILLO</option><option value="PIRU">PIRU</option><option value="RIDGEMARK">RIDGEMARK</option><option value="HOLLISTER">HOLLISTER</option><option value="DAVIS">DAVIS</option><option value="MADISON">MADISON</option></select></td> -->
													<td>
														<input name="name" type="text" autofocus="true" value="${node.name}"/>
													</td>
													<td>
														<input name="description" type="text" autofocus="true" value="${node.description}"/>
													</td>
													<td>
														<input name="status" type="text" autofocus="true" value="${node.status}"/>
													</td>
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
									<span style="color:green">${editNodeResponse}</span>
								</div>
							</div>
						</div>
					</body>
				</html>
