<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes.jsp" %>
<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>

   <head>
      <title>Manage Sensor</title>
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

					

	 
	 }, false);

	 </script>
   <body >
      <div class="sidenav">
         <h1 style="color: Orange;">Manage Sensor</h1>
         <a href="/addSensor">Add Sensor</a>
         <a href="/manageSensor">Search Sensor</a>
         <a href="/editSensor">Update Sensor</a>
      </div>
      <div class="main">
         <nav class="navbar navbar-inverse">
            <div class="container-fluid">
               <ul class="nav navbar-nav">
                  <li ><a href="/home">Home</a></li>
                  <li><a href="/dashboard">Dashboard</a></li>
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
         <div class="container">
            <div class="col-lg-12 col-md-12">
               <form action="getSensor" method="get">
                  <h2 class="form-heading">Search Filter</h2>
                  <div class="form-group ${error != null ? 'has-error' : ''}">
                     <span style="color:green">${searchSensorMsg}</span>
                     <span style="color:red">${searchSensorErrMsg}</span>
                     <table class="col-lg-12 col-md-12">
                        <tr>
                           <td>
                              <select name="zip" type="text" class="form-control" size="3" multiple autofocus="true" id="zip">
                               
                              </select>
                           </td>
                        </tr>
                        <tr>
                           <td colspan='7'><button class="btn btn-lg btn-primary btn-block" type="submit">Search Sensor</button></td>
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
                  <th>Sensor ID</th>
                  <th>Zip </th>
                  <th> Name </th>
									<th>Description </th>
									<th>Latitude </th>
									<th>Longitude </th>
									<th>Sensor Type </th>
									<th>Status</th>
                  <c:forEach items="${SensorList}" var="sensor">
                     <tr>
                        <td>${sensor.getSensorId()}</td>
                        <td>${sensor.zip}</td>
                        <td>${sensor.name}</td>
												<td>${sensor.description}</td>
												<td>${sensor.latitude}</td>
												<td>${sensor.longitude}</td>
												<td>${sensor.type}</td>
                        <td>${sensor.status}</td>
                     </tr>
                  </c:forEach>
               </table>
            </div>
         </div>
      </div>
   </body>

</html>