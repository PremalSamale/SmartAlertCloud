<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@ include file="/WEB-INF/views/includes.jsp" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

   <!--  <style>
        th, td, p, input {
            font:14px Verdana;
        }
        table, th, td 
        {
            border: solid 1px #DDD;
            border-collapse: collapse;
            padding: 2px 3px;
            text-align: center;
        }
        th {
            font-weight:bold;
        }
    </style> -->
    
    <title>Sensor Real Data</title>
      <link rel="stylesheet" href="../stylesheets/style.css">
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
      <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
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
      /*    body {
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
        .main {
         margin-left: 130px; /* Same as the width of the sidenav */
        /*  font-size: 25px;  *//* Increased text to enable scrolling */
         padding: 0px 10px;
         } 
         @media screen and (max-height: 450px) {
         .sidenav {padding-top: 15px;}
         .sidenav a {font-size: 18px;}
         }
      </style>
        <style>
        table 
        {
            width: 100%;
            font: 17px Calibri;
        }
        table, th, td 
        {
            border: solid 1px #DDD;
            border-collapse: collapse;
            padding: 8px 90px;
            text-align: center;
        }
      
        input[type='button'] 
        {
            font: 15px Calibri;
            cursor: pointer;
            border: none;
            color: #FFF;
        }
        
        input[type='text'], select 
        {
            font: 17px Calibri;
            text-align: center;
            border: solid 1px #CCC;
            width: auto;
            padding: 8px 3px;
        }
          #booksTable tr > *:nth-child(8) {
                display: none;
            }
              #booksTable tr > *:nth-child(2) {
                display: none;
            } 
    </style>
</head>
<body>
 <div class="sidenav">
         <h1 style="color: Orange;">Manage Sensor Data</h1>
          <a href="/getRealDataSensor">Humidity Sensors</a>
         <a href="/getRealDataTempSensor">Temperature Sensor</a>
         <a href="/getLast24hoursData">last 24 hours Data</a>
        
      </div>
      <div class="main">
    <%--     <nav class="navbar navbar-inverse">
             <div class="container-fluid">
               <ul class="nav navbar-nav">
                  <li ><a href="/home">Home</a></li>
                  <li><a href="/dashboard">Dashboard</a></li>
                  <li><a href="/manageCluster">Manage Cluster</a></li>
                  <li><a href="/manageNode">Manage Nodes</a></li>
                  <li ><a href="/manageSensor">Manage Sensors</a></li>
                   <li ><a href="/getRealDataSensor">Manage Sensor Data</a></li>
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
         </nav> --%>
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
<form action="getRealDataSensor" method="get">
			<!-- <h2 class="form-heading"> sensor Data</h2> -->
   <!--  <input type="button" onclick="CreateTableFromJSON()" value="Create Table From JSON" />
    <p id="showData"></p> -->
      <div id="container" style="width:700px;">
    </div>

		</form>
<!-- jQuery -->
	<script src="resources/js/jquery-1.11.3.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="resources/js/bootstrap.min.js"></script>

	<!-- IE10 viewport bug workaround -->
	<script src="resources/js/ie10-viewport-bug-workaround.js"></script>

	<!-- Placeholder Images -->
	<script src="resources/js/holder.min.js"></script>
</body>

<!-- <script>
    function CreateTableFromJSON() {
        var myBooks = ${sensorData};
        // EXTRACT VALUE FOR HTML HEADER. 
        // ('Book ID', 'Book Name', 'Category' and 'Price')
        var col = [];
        for (var i = 0; i < myBooks.length; i++) {
            for (var key in myBooks[i]) {
                if (col.indexOf(key) === -1) {
                    col.push(key);
                }
            }
        }

        // CREATE DYNAMIC TABLE.
        var table = document.createElement("table");

        // CREATE HTML TABLE HEADER ROW USING THE EXTRACTED HEADERS ABOVE.

        var tr = table.insertRow(-1);                   // TABLE ROW.

        for (var i = 0; i < col.length; i++) {
            var th = document.createElement("th");      // TABLE HEADER.
            th.innerHTML = col[i];
            tr.appendChild(th);
        }

        // ADD JSON DATA TO THE TABLE AS ROWS.
        for (var i = 0; i < myBooks.length; i++) {

            tr = table.insertRow(-1);

            for (var j = 0; j < col.length; j++) {
                var tabCell = tr.insertCell(-1);
                tabCell.innerHTML = myBooks[i][col[j]];
            }
        }

        // FINALLY ADD THE NEWLY CREATED TABLE WITH JSON DATA TO A CONTAINER.
        var divContainer = document.getElementById("showData");
        divContainer.innerHTML = "";
        divContainer.appendChild(table);
    }
</script> -->

<script>
    var crudApp = new function () {

        // AN ARRAY OF JSON OBJECTS WITH VALUES.
        this.myBooks = ${sensorData};

       this.category = ['Business', 'Computers', 'Programming', 'Science'];
        this.col = [];

        this.createTable = function () {

            // EXTRACT VALUE FOR TABLE HEADER.
            for (var i = 0; i < this.myBooks.length; i++) {
                for (var key in this.myBooks[i]) {
                    if (this.col.indexOf(key) === -1) {
                        this.col.push(key);
                    }
                }
            }

            // CREATE A TABLE.
            var table = document.createElement('table');
            table.setAttribute('id', 'booksTable');     // SET TABLE ID.
         
            var tr = table.insertRow(-1);               // CREATE A ROW (FOR HEADER).

            for (var h = 0; h < this.col.length; h++) {
                // ADD TABLE HEADER.
                var th = document.createElement('th');
                th.innerHTML = this.col[h].replace('_', ' ');
                tr.appendChild(th);
            }

            // ADD ROWS USING JSON DATA.
            for (var i = 0; i < this.myBooks.length; i++) {

                tr = table.insertRow(-1);           // CREATE A NEW ROW.

                for (var j = 0; j < this.col.length; j++) {
                    var tabCell = tr.insertCell(-1);
                    tabCell.innerHTML = this.myBooks[i][this.col[j]];
                }

                // DYNAMICALLY CREATE AND ADD ELEMENTS TO TABLE CELLS WITH EVENTS.

                this.td = document.createElement('td');

                // *** CANCEL OPTION.
                tr.appendChild(this.td);
                var lblCancel = document.createElement('label');
                lblCancel.innerHTML = '✖';
                lblCancel.setAttribute('onclick', 'crudApp.Cancel(this)');
                lblCancel.setAttribute('style', 'display:none;');
                lblCancel.setAttribute('title', 'Cancel');
                lblCancel.setAttribute('id', 'lbl' + i);
                this.td.appendChild(lblCancel);

                // *** SAVE.
                tr.appendChild(this.td);
                var btSave = document.createElement('input');

                btSave.setAttribute('type', 'button');      // SET ATTRIBUTES.
                btSave.setAttribute('value', 'Save');
                btSave.setAttribute('id', 'Save' + i);
                btSave.setAttribute('style', 'display:none;');
                btSave.setAttribute('onclick', 'crudApp.Save(this)');       // ADD THE BUTTON's 'onclick' EVENT.
                this.td.appendChild(btSave);

                // *** UPDATE.
                tr.appendChild(this.td);
                var btUpdate = document.createElement('input');

                btUpdate.setAttribute('type', 'button');    // SET ATTRIBUTES.
                btUpdate.setAttribute('value', 'Update');
                btUpdate.setAttribute('id', 'Edit' + i);
                btUpdate.setAttribute('style', 'background-color:#44CCEB;');
                btUpdate.setAttribute('onclick', 'crudApp.Update(this)');   // ADD THE BUTTON's 'onclick' EVENT.
                this.td.appendChild(btUpdate);

                // *** DELETE.
                this.td = document.createElement('th');
                tr.appendChild(this.td);
                var btDelete = document.createElement('input');
                btDelete.setAttribute('type', 'button');    // SET INPUT ATTRIBUTE.
                btDelete.setAttribute('value', 'Delete');
                btDelete.setAttribute('style', 'background-color:#ED5650;');
                btDelete.setAttribute('onclick', 'crudApp.Delete(this)');   // ADD THE BUTTON's 'onclick' EVENT.
                this.td.appendChild(btDelete);
            }


            // ADD A ROW AT THE END WITH BLANK TEXTBOXES AND A DROPDOWN LIST (FOR NEW ENTRY).

            tr = table.insertRow(-1);           // CREATE THE LAST ROW.

            for (var j = 0; j < this.col.length; j++) {
                var newCell = tr.insertCell(-1);
                if (j >= 1) {

                    if (j == 2) {   // WE'LL ADD A DROPDOWN LIST AT THE SECOND COLUMN (FOR Category).

                      var select = document.createElement('select');      // CREATE AND ADD A DROPDOWN LIST.
                        select.innerHTML = '<option value=""></option>';
                        for (k = 0; k < this.category.length; k++) {
                            select.innerHTML = select.innerHTML +
                                '<option value="' + this.category[k] + '">' + this.category[k] + '</option>';
                        } 
                    
                        newCell.appendChild(select);
                    }
                    else {
                        var tBox = document.createElement('input');          // CREATE AND ADD A TEXTBOX.
                        tBox.setAttribute('type', 'text');
                        tBox.setAttribute('value', '');
                        newCell.appendChild(tBox);
                    }
                }
            }

            this.td = document.createElement('td');
            tr.appendChild(this.td);

            var btNew = document.createElement('input');

            btNew.setAttribute('type', 'button');       // SET ATTRIBUTES.
            btNew.setAttribute('value', 'Create');
            btNew.setAttribute('id', 'New' + i);
            btNew.setAttribute('style', 'background-color:#207DD1;');
            btNew.setAttribute('onclick', 'crudApp.CreateNew(this)');       // ADD THE BUTTON's 'onclick' EVENT.
            this.td.appendChild(btNew);

            var div = document.getElementById('container');
            div.innerHTML = '';
            div.appendChild(table);    // ADD THE TABLE TO THE WEB PAGE.
        };

        // ****** OPERATIONS START.

        // CANCEL.
        this.Cancel = function (oButton) {

            // HIDE THIS BUTTON.
            oButton.setAttribute('style', 'display:none; float:none;');

            var activeRow = oButton.parentNode.parentNode.rowIndex;

            // HIDE THE SAVE BUTTON.
            var btSave = document.getElementById('Save' + (activeRow - 1));
            btSave.setAttribute('style', 'display:none;');

            // SHOW THE UPDATE BUTTON AGAIN.
            var btUpdate = document.getElementById('Edit' + (activeRow - 1));
            btUpdate.setAttribute('style', 'display:block; margin:0 auto; background-color:#44CCEB;');

            var tab = document.getElementById('booksTable').rows[activeRow];

            for (i = 0; i < this.col.length; i++) {
                var td = tab.getElementsByTagName("td")[i];
                td.innerHTML = this.myBooks[(activeRow - 1)][this.col[i]];
            }
        }


        // EDIT DATA.
        this.Update = function (oButton) {
            var activeRow = oButton.parentNode.parentNode.rowIndex;
            var tab = document.getElementById('booksTable').rows[activeRow];

            // SHOW A DROPDOWN LIST WITH A LIST OF CATEGORIES.
            for (i = 1; i < 4; i++) {
                if (i == 2) {
                    var td = tab.getElementsByTagName("td")[i];
                    var ele = document.createElement('select');      // DROPDOWN LIST.
                    ele.innerHTML = '<option value="' + td.innerText + '">' + td.innerText + '</option>';
                    for (k = 0; k < this.category.length; k++) {
                        ele.innerHTML = ele.innerHTML +
                            '<option value="' + this.category[k] + '">' + this.category[k] + '</option>';
                    }
                    td.innerText = '';
                    td.appendChild(ele);
                }
                else {
                    var td = tab.getElementsByTagName("td")[i];
                    var ele = document.createElement('input');      // TEXTBOX.
                    ele.setAttribute('type', 'text');
                    ele.setAttribute('value', td.innerText);
                    td.innerText = '';
                    td.appendChild(ele);
                }
            }

            var lblCancel = document.getElementById('lbl' + (activeRow - 1));
            lblCancel.setAttribute('style', 'cursor:pointer; display:block; width:20px; float:left; position: absolute;');

            var btSave = document.getElementById('Save' + (activeRow - 1));
            btSave.setAttribute('style', 'display:block; margin-left:30px; float:left; background-color:#2DBF64;');

            // HIDE THIS BUTTON.
            oButton.setAttribute('style', 'display:none;');
        };


        // DELETE DATA.
        this.Delete = function (oButton) {
            var activeRow = oButton.parentNode.parentNode.rowIndex;
            this.myBooks.splice((activeRow - 1), 1);    // DELETE THE ACTIVE ROW.
            this.createTable();                         // REFRESH THE TABLE.
        };

        // SAVE DATA.
        this.Save = function (oButton) {
            var activeRow = oButton.parentNode.parentNode.rowIndex;
            var tab = document.getElementById('booksTable').rows[activeRow];

            // UPDATE myBooks ARRAY WITH VALUES.
            for (i = 1; i < this.col.length; i++) {
                var td = tab.getElementsByTagName("td")[i];
                if (td.childNodes[0].getAttribute('type') == 'text' || td.childNodes[0].tagName == 'SELECT') {  // CHECK IF ELEMENT IS A TEXTBOX OR SELECT.
                    this.myBooks[(activeRow - 1)][this.col[i]] = td.childNodes[0].value;      // SAVE THE VALUE.
                }
            }
            this.createTable();     // REFRESH THE TABLE.
        }

        // CREATE NEW.
        this.CreateNew = function (oButton) {
            var activeRow = oButton.parentNode.parentNode.rowIndex;
            var tab = document.getElementById('booksTable').rows[activeRow];
            var obj = {};

            // ADD NEW VALUE TO myBooks ARRAY.
            for (i = 1; i < this.col.length; i++) {
                var td = tab.getElementsByTagName("td")[i];
                if (td.childNodes[0].getAttribute('type') == 'text' || td.childNodes[0].tagName == 'SELECT') {      // CHECK IF ELEMENT IS A TEXTBOX OR SELECT.
                    var txtVal = td.childNodes[0].value;
                    if (txtVal != '') {
                        obj[this.col[i]] = txtVal.trim();
                    }
                    else {
                        obj = '';
                        alert('all fields are compulsory');
                        break;
                    }
                }
            }
            obj[this.col[0]] = this.myBooks.length + 1;     // NEW ID.

            if (Object.keys(obj).length > 0) {      // CHECK IF OBJECT IS NOT EMPTY.
                this.myBooks.push(obj);             // PUSH (ADD) DATA TO THE JSON ARRAY.
                this.createTable();                 // REFRESH THE TABLE.
            }
        }

        // ****** OPERATIONS END.
    }

    crudApp.createTable();
</script>

</html>





