

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
	<head>
	    <meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	    <meta name="description" content="">
	    <meta name="author" content="">
	
	    <title>Log in with your account</title>
	
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	     <link href="<c:url value="/resources/theme1/css/style.css" />" rel="stylesheet">
    <script src="<c:url value="/resources/theme1/js/jquery-ui.min.klpy.css" />"></script>

 
<style>
a {
  text-decoration: none;
  display: inline-block;
  padding: 8px 16px;
}

a:hover {
  background-color: #ddd;
  color: black;
}

.previous {
  background-color: #f1f1f1;
  color: black;
}

.next {
  background-color: #4CAF50;
  color: white;
}

.round {
  border-radius: 50%;
}
</style>
	    
	  <style>
body {font-family: Arial, Helvetica, sans-serif; }
form {border: 3px solid #f1f1f1;}

input[type=text], input[type=password] {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}


button {
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
}

button:hover {
  opacity: 0.8;
}

.cancelbtn {
  width: auto;
  padding: 10px 18px;
  background-color: #f44336;
}

.imgcontainer {
  text-align: center;
  margin: 24px 0 12px 0;
}

img.avatar {
  width: 40%;
  border-radius: 50%;
}

.container {
  padding: 16px;
}

span.psw {
  float: right;
  padding-top: 16px;
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
  span.psw {
     display: block;
     float: none;
  }
  .cancelbtn {
     width: 100%;
  }

}
</style>

	</head>
	
	<body  class="bck-body">
	    
	    
		
		   <div style="width:800px; margin:0 auto;">
		  <div class="container"> 
		
		 <div class="col-md-6"> 
           
		    <div><span><a href="/" class="previous"> &laquo;Go Back </a></span></div>
		    <form method="POST" action="login" class="form-signin">
		 
		          <h2 class="form-heading"  >Login</h2>
		         <div class="imgcontainer">
   				 <img src="http://www.exactax.com/track/img/hr.png" alt="Avatar" class="avatar">
  				</div>
		
		        <div class="form-group ${error != null ? 'has-error' : ''}">
		            <span>${msg}</span>
		             <!--  <label for="username"><b>Email address</b></label> -->
		            <input name="username" type="text" class="form-control" placeholder="Enter Email address"
		                   autofocus="true"/>
		            <!--  <label for="password"><b>Password</b></label> -->
		            <input name="password" type="password" class="form-control" placeholder="Enter Password"/>
		            <span>${errorMsg}</span>
		
		            <button  type="submit">LogIn</button>
		            
		        </div>
	        
  </div>

 
</form>
		
		   
	</div>
		 </div>
		</div> 
		<!-- /container -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	</body>
</html>