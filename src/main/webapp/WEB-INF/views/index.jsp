<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> 
<head>
	<title>Welcome to Smart Alert Cloud </title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1 maximum-scale=1.0, user-scalable=no" />
    <link href="<c:url value="/resources/theme1/css/style.css" />" rel="stylesheet">
    <script src="<c:url value="/resources/theme1/js/jquery-ui.min.klpy.css" />"></script>

 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">  
</head>
<body class="bck-body">
  <nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="/">Smart Cloud Alert</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="/">Home</a></li>
      <li><a href="/dashboard">Dashboard</a></li>
      <li><a href="/manageSensor">Manage Sensors</a></li>
       <li><a href="/manageCluster">Manage Cluster</a></li>
        <li><a href="/manageNode">Manage Nodes</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="/signup"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li><a href="/login"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
    </ul>
  </div>
</nav>




</body>
</html>