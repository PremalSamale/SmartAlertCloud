
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <title>Smart Alert Cloud</title>

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

</head>

<body>

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
                    <li class="active">
                        <a href="/">Home</a>
                    </li>
                    <li class="active">
                        <a href="/">About</a>
                    </li>

					<li class="dropdown active">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Services <span class="caret"></span></a>
						<ul class="dropdown-menu" aria-labelledby="about-us">
							<li><a href="#">Software as a Service</a></li>
							<li><a href="#">Platform as a Service</a></li>
							<li><a href="#">Infrastructure as a Service</a></li>
						</ul>
					</li>
				  
     			   <li class="active"><a href="/signup"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      			   <li class="active"><a href="/login"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
    			
					
                </ul>
       
				<!-- Search -->
				<form class="navbar-form navbar-right" role="search">
					<div class="form-group">
						<input type="text" class="form-control">
					</div>
					<button type="submit" class="btn btn-default">Search</button>
				</form>

            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

	<div class="jumbotron feature">
		<div class="container">
		
		<div id="feature-carousel" class="carousel slide" data-ride="carousel">
			<ol class="carousel-indicators">
			  <li data-target="#feature-carousel" data-slide-to="0" class="active"></li>
			  <li data-target="#feature-carousel" data-slide-to="1"></li>
			  <li data-target="#feature-carousel" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner" role="listbox">
				<div class="item active">
					<h1>Rapid Elasticity and Scalability:</h1>
					<p>Depending on need, additional resources are provisioned/de-provisioned for efficient performance.</p>
					<p><a class="btn btn-primary" href="/signup">Engage Now</a></p>
				</div>
				<div class="item">
					<h1>On-demand self-service</h1>
					<p>resources can be able to be configured in a very short time.</p>
					<p><a class="btn btn-primary" href="/signup">Register Now</a></p>
				</div>
				<div class="item">
					<h1>Multi-tenancy</h1>
					<p>The network can be shared across multiple users with varied roles.	</p>
					<p><a class="btn btn-primary" href="signup">Unleash Now</a></p>
				</div>			  
			</div>
			<a class="left carousel-control" href="#feature-carousel" role="button" data-slide="prev">
			  <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
			  <span class="sr-only">Previous</span>
			</a>
			<a class="right carousel-control" href="#feature-carousel" role="button" data-slide="next">
			  <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			  <span class="sr-only">Next</span>
			</a>
		  </div>

		</div>
	</div>



    <!-- Content -->
    <div class="container">

        <!-- Page Intro -->
        <div class="row page-intro">
            <div class="col-lg-12">
                <h1>SmartAlertCloud
                    <small>IOT-based smart emergency sensor system</small>
                </h1>
                <p>It supports large-scale on-demand IOT-based smart emergency sensor system infrastructure services for emergency agencies in different counties/cities. Each client could select, install and deploy one or more IOT emergency sensor networks for each city to support emergency alerts in diverse nature disasters, such as wildfires </p>
            </div>
        </div>
        <!-- /.row -->

        <!-- Feature Row -->
        <div class="row">
            <article class="col-md-4 article-intro">
                <a href="#">
                    <img class="img-responsive img-rounded" src="resources/theme1/images/smartNode.jpeg" alt="">
                </a>
                <h3>
                    <a href="#">Smart Node management</a>
                </h3>
                <p>It allows clients to add/update/delete/view smart nodes controlled by a cluster, and track node status.</p>
            </article>
            <article class="col-md-4 article-intro">
                <a href="#">
                    <img class="img-responsive img-rounded" src="resources/theme1/images/smartCluster.jpeg"" alt="">
                </a>
                <h3>
                    <a href="#">Smart Cluster Management</a>
                </h3>
                <p>It allows clients to add/update/delete/view smart clusters controlled by a satellite, and track cluster status</p>
            </article>

            <article class="col-md-4 article-intro">
                <a href="#">
                    <img class="img-responsive img-rounded" src="resources/theme1/images/smartSensors.jpeg" alt="">
                </a>
                <h3>
                    <a href="#">Smart Sensor Management</a>
                </h3>
                <p>It allows clients to add/update/delete/view smart sensor controlled by a node, and track sensor status</p>
            </article>
        </div>
        <!-- /.row -->

    </div>
    <!-- /.container -->
	
	<footer>
		<div class="footer-blurb">
			<div class="container">
				<div class="row">
					<div class="col-sm-4 footer-blurb-item">
						<img class="img-circle" src="resources/theme1/images/dashboard.png" alt="" width="100" height="100">
						<h3>Dashboard</h3>
						<p>It is important to properly monitor the network. System dispplays dashboard to see necessary parameters statistics.</p>
						<p><a class="btn btn-default" href="#">Engage</a></p>
					</div>
					<div class="col-sm-4 footer-blurb-item">
						<img class="img-circle" src="resources/theme1/images/mapView.png" alt="" width="100" height="100">
						<h3>View on Map</h3>
						<p>Cloud based solution shows locations of emergency stations, node and sensors on map. System displays satellite view and normal view tolocate and see the status of clusters.</p>
						<p><a class="btn btn-default" href="#">Unleash</a></p>
					</div>
					<div class="col-sm-4 footer-blurb-item">
						<img class="img-circle" src="resources/theme1/images/DataSensor.jpeg" alt="" width="100" height="100">
						<h3>Historic Sensor Data View</h3>
						<p>Sensor network-based data management supports reading data for sensors including sensor type, configured date</p>
						<p><a class="btn btn-default" href="#">Register</a></p>
					</div>

				</div>
				<!-- /.row -->	
			</div>
        </div>
        
        <div class="small-print">
        	<div class="container">
        		<p><a href="#">Terms &amp; Conditions</a> | <a href="#">Privacy Policy</a> | <a href="/">Contact</a></p>
        		<p>Copyright &copy; smartalertcloud.com 2019 </p>
        	</div>
        </div>
	</footer>

	
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
