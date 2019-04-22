<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<div style="border: 1px solid #ccc; padding: 5px; margin-bottom: 20px;"/>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Header</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
	<body>
		<div class=page-header>
			<u><h2 style="color: red;">
	        	<a onclick="document.forms['logoutForm'].submit()">Logout</a>
	        	&nbsp;&nbsp;
	        	<a href="/home"> Home</a>
	        </h2></u>
	    	<form id="logoutForm" method="POST" action="${contextPath}/logout">
	    	</form>
			<!-- /container -->
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
			<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		</div>
	</body>
</html>