<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*" %>
<%@page import="edu.sjsu.smartalertcloud.fusioncharts.FusionCharts" %>
<script type="text/javascript" src="src/main/webapp/resources/theme1/js/fusioncharts.charts.js"></script> 
<script type="text/javascript" src="src/main/webapp/resources/theme1/js/piechart.js"></script> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>



  <script src="https://cdn.anychart.com/geodata/1.2.0/countries/united_states_of_america/united_states_of_america.js"></script>
  <script src="https://cdn.anychart.com/releases/v8/js/anychart-base.min.js?hcode=be5162d915534272a57d0bb781d27f2b"></script>
  <script src="https://cdn.anychart.com/releases/v8/js/anychart-ui.min.js?hcode=be5162d915534272a57d0bb781d27f2b"></script>
  <script src="https://cdn.anychart.com/releases/v8/js/anychart-exports.min.js?hcode=be5162d915534272a57d0bb781d27f2b"></script>
  <script src="https://cdn.anychart.com/releases/v8/js/anychart-circular-gauge.min.js?hcode=be5162d915534272a57d0bb781d27f2b"></script>
  <script src="https://cdn.anychart.com/releases/v8/js/anychart-map.min.js?hcode=be5162d915534272a57d0bb781d27f2b"></script>
  <script src="https://cdn.anychart.com/releases/v8/js/anychart-table.min.js?hcode=be5162d915534272a57d0bb781d27f2b"></script>
  <script src="https://cdn.anychart.com/releases/v8/js/anychart-data-adapter.min.js?hcode=be5162d915534272a57d0bb781d27f2b"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/proj4js/2.3.15/proj4.js"></script>
  <link href="https://cdn.anychart.com/playground-css/maps_in_dashboard/USA_dashboard_multiselect/style.css" type="text/css" rel="stylesheet">
  <link href="https://cdn.anychart.com/releases/v8/css/anychart-ui.min.css?hcode=be5162d915534272a57d0bb781d27f2b" type="text/css" rel="stylesheet">
  <link href="https://cdn.anychart.com/releases/v8/fonts/css/anychart-font.min.css?hcode=be5162d915534272a57d0bb781d27f2b" type="text/css" rel="stylesheet">
  <style type="text/css">
html, body, #container {
    width: 100%;
    height: 100%;
    margin: 0;
    padding: 0;
}
</style>

<link href="../Styles/ChartSampleStyleSheet.css" rel="stylesheet" />


<script type="text/javascript" src="//cdn.fusioncharts.com/fusioncharts/latest/fusioncharts.js"></script>
 <script src="<c:url value="/resources/theme1/js/sidebar.js" />"></script>

<script type="text/javascript" src="//cdn.fusioncharts.com/fusioncharts/latest/themes/fusioncharts.theme.fusion.js"></script>

    <script src="<c:url value="/resources/theme1/js/jquery-ui.min.klpy.css" />"></script>

 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">  
 <link rel="stylesheet" href="../stylesheets/card.css">
 <style>

  
   div.b {
  position: absolute;
  right: 40px;
  }
 
 </style>
 
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
<body>

 

<div class="sidenav">
 <h1 style="color: Orange;">Dashboard </h1>
  <a href="/dashboard">IOT </a>
  <a href="/mapView">Map View</a>
</div>

<div class="main">

 <nav class="navbar navbar-inverse">
  <div class="container-fluid">
   
    <ul class="nav navbar-nav">
      <li class="active"><a href="/">Home</a></li>
      <li><a href="/manageSensor">Manage Sensors</a></li>
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


<div id="container"></div>
  <script>
var mapSeries, mapChart, tableCharts;
var dataSet, tableChart, populationChart, areaChart, houseSeatsChart;

anychart.onDocumentReady(function () {
    // The data used in this sample can be obtained from the CDN
    // https://cdn.anychart.com/samples/maps-in-dashboard/states-of-united-states-dashboard-with-multi-select/data.json
    anychart.data.loadJsonFile('https://cdn.anychart.com/samples/maps-in-dashboard/states-of-united-states-dashboard-with-multi-select/data.json', function (data) {
        // pre-processing of the data
        for (var i = 0; i < data.length; i++) {
            data[i]['value'] = new Date(data[i].statehood).getUTCFullYear();
            data[i]['short'] = data[i]['id'];
            data[i]['id'] = data[i]['id'];
        }
        dataSet = anychart.data.set(data);
        tableChart = getTableChart();
        mapChart = drawMap();
        tableCharts = getTableCharts();

        // Setting layout table
        var layoutTable = anychart.standalones.table();
        layoutTable.cellBorder(null);
        layoutTable.container('container');
        layoutTable.draw();

        function getTableChart() {
            var table = anychart.standalones.table();
            table.cellBorder(null);
            table.fontSize(11).vAlign('middle').fontColor('#212121');
            table.getCell(0, 0).colSpan(8).fontSize(14).vAlign('bottom').border().bottom('1px #dedede').fontColor('#7c868e');
            table.useHtml(true).contents([
                ['Selected States Data'],
                [null, 'Name', 'Capital', 'Largest<br/>City', 'State<br/>Since', 'Population', 'Area', 'House<br/>Seats'],
                [null]
            ]);
            table.getRow(1).cellBorder().bottom('2px #dedede').fontColor('#7c868e');
            table.getRow(0).height(45).hAlign('center');
            table.getRow(1).height(35);
            table.getCol(0).width(25);
            table.getCol(1).hAlign('left');
            table.getCol(2).hAlign('left');
            table.getCol(3).hAlign('left');
            table.getCol(2).width(50);
            table.getCol(4).width(50);
            table.getCol(5).width(50);
            return table;
        }

        function solidChart(value) {
            var gauge = anychart.gauges.circular();
            gauge.data([value, 100]);
            gauge.padding(5);
            gauge.margin(0);
            var axis = gauge.axis().radius(100).width(1).fill(null);
            axis.scale()
                    .minimum(0)
                    .maximum(100)
                    .ticks({interval: 1})
                    .minorTicks({interval: 1});
            axis.labels().enabled(false);
            axis.ticks().enabled(false);
            axis.minorTicks().enabled(false);

            var stroke = '1 #e5e4e4';
            gauge.bar(0).dataIndex(0).radius(80).width(40).fill('#64b5f6').stroke(null).zIndex(5);
            gauge.bar(1).dataIndex(1).radius(80).width(40).fill('#F5F4F4').stroke(stroke).zIndex(4);
            gauge.label().width('50%').height('25%').adjustFontSize(true).hAlign('center').anchor('center');
            gauge.label()
                    .hAlign('center')
                    .anchor('center')
                    .padding(5, 10)
                    .zIndex(1);
            gauge.background().enabled(false);
            gauge.fill(null);
            gauge.stroke(null);
            return gauge
        }

        function getTableCharts() {
            var table = anychart.standalones.table(2, 3);
            table.cellBorder(null);
            table.getRow(0).height(45);
            table.getRow(1).height(25);
            table.fontSize(11).useHtml(true).hAlign('center');
            table.getCell(0, 0).colSpan(3).fontSize(14).vAlign('bottom').border().bottom('1px #dedede');
            table.getRow(1).cellBorder().bottom('2px #dedede');
            populationChart = solidChart(0);
            areaChart = solidChart(0);
            houseSeatsChart = solidChart(0);
            table.contents([
                ['Percentage of Total'],
                ['Population', 'Land Area', 'House Seats'],
                [populationChart, areaChart, houseSeatsChart]
            ]);
            return table;
        }

        function changeContent(ids) {
            var contents = [
                ['List of Selected States'],
                [null, 'Name', 'State<br/>Since', 'Population', 'Water<br/>Area', 'House<br/>Seats']];
            var population = 0;
            var area = 0;
            var seats = 0;
            for (var i = 0; i < ids.length; i++) {
                var data = getDataId(ids[i]);
                population += parseInt(data['population']);
                area += parseInt(data['area']);
                seats += parseInt(data['house_seats']);

                var label = anychart.standalones.label();
                label.width('100%').height('100%').text('').background().enabled(true).fill({
                    src: data['flag'],
                    mode: 'fit'
                });
                contents.push([
                    label, data['name'], data['value'], parseInt(data['population']).toLocaleString(), Math.round(parseInt(data['water_area']) * 100 / (parseInt(data['water_area']) + parseInt(data['land_area']))) + '%', data['house_seats']
                ]);
            }

            populationChart.data([(population * 100 / getDataSum('population')).toFixed(2), 100]);
            populationChart.label().text((population * 100 / getDataSum('population')).toFixed(2) + '%');

            areaChart.data([(area * 100 / getDataSum('area')).toFixed(2), 100]);
            areaChart.label().text((area * 100 / getDataSum('area')).toFixed(2) + '%');

            houseSeatsChart.data([(seats * 100 / getDataSum('house_seats')).toFixed(2), 100]);
            houseSeatsChart.label().text((seats * 100 / getDataSum('house_seats')).toFixed(2) + '%');

            tableChart.contents(contents);
            for (i = 0; i < ids.length; i++) {
                tableChart.getRow(i + 2).maxHeight(35);
            }
        }

        function drawMap() {
            var map = anychart.map();
            //set map title settings using html
            map.title().padding(10, 0, 10, 0).margin(0).useHtml(true);
            map.title('US States<br/>by the Year of Joining the Union' +
                    '<br/><span style="color:#212121; font-size: 11px;">Pick your state or a time period to see when chosen states joined</span>');
            map.padding([0, 0, 10, 0]);
            var credits = map.credits();
            credits.enabled(true);
            credits.url('https://en.wikipedia.org/wiki/List_of_states_and_territories_of_the_United_States');
            credits.text('Data source: https://en.wikipedia.org/wiki/List_of_states_and_territories_of_the_United_States');
            credits.logoSrc('https://en.wikipedia.org/static/favicon/wikipedia.ico');

            //set map Geo data
            map.geoData('anychart.maps.united_states_of_america');

            map.listen('pointsSelect', function (e) {
                var selected = [];
                var selectedPoints = e.seriesStatus[0].points;
                for (var i = 0; i < selectedPoints.length; i++) {
                    selected.push(selectedPoints[i].id);
                }
                changeContent(selected);
            });

            mapSeries = map.choropleth(dataSet);
            mapSeries.labels(null);
            mapSeries.tooltip().useHtml(true);
            mapSeries.tooltip().title().useHtml(true);
            mapSeries.tooltip().titleFormat(function () {
                var data = getDataId(this.id);
                return this.name + '<span style="font-size: 10px"> (since ' + data['statehood'] + ')</span>';
            });
            mapSeries.tooltip().format(function () {
                var data = getDataId(this.id);
                return '<span style="font-size: 12px; color: #b7b7b7">Capital: </span>' + data['capital'] + '<br/>' +
                        '<span style="font-size: 12px; color: #b7b7b7">Largest City: </span>' + data['largest_city'];
            });
            var scale = anychart.scales.ordinalColor([
                {less: 1790},
                {from: 1790, to: 1800},
                {from: 1800, to: 1820},
                {from: 1820, to: 1850},
                {from: 1850, to: 1875},
                {from: 1875, to: 1900},
                {greater: 1900}
            ]);
            scale.colors(['#81d4fa', '#4fc3f7', '#29b6f6', '#039be5', '#0288d1', '#0277bd', '#01579b']);
            mapSeries.hovered().fill('#f06292');
            mapSeries.selected()
                    .fill('#c2185b')
                    .stroke(anychart.color.darken('#c2185b'));
            mapSeries.colorScale(scale);

            mapSeries.stroke(function () {
                this.iterator.select(this.index);
                var pointValue = this.iterator.get(this.referenceValueNames[1]);
                var color = this.colorScale.valueToColor(pointValue);
                return anychart.color.darken(color);
            });

            var colorRange = map.colorRange();
            colorRange.enabled(true);
            colorRange.ticks().stroke('3 #ffffff').position('center').length(20).enabled(true);
            colorRange.colorLineSize(5);
            colorRange.labels().fontSize(11).padding(0, 0, 0, 0).format(function () {
                var range = this.colorRange;
                var name;
                if (isFinite(range.start + range.end)) {
                    name = range.start + ' - ' + range.end;
                } else if (isFinite(range.start)) {
                    name = 'After ' + range.start;
                } else {
                    name = 'Before ' + range.end;
                }
                return name
            });
            return map;
        }

        // Creates general layout table with two inside layout tables
        function fillInMainTable(flag) {
            if (flag == 'wide') {
                layoutTable.contents([
                    [mapChart, tableCharts],
                    [null, tableChart]
                ], true);
                layoutTable.getCell(0, 0).rowSpan(2);
                layoutTable.getRow(0).height(null);
                layoutTable.getRow(1).height(null);
            } else {
                layoutTable.contents([
                    [mapChart],
                    [tableCharts],
                    [tableChart]
                ], true);
                layoutTable.getRow(0).height(350);
                layoutTable.getRow(1).height(200);
                layoutTable.getRow(2).height(250);
            }
            layoutTable.draw();
        }

        if (window.innerWidth > 768)
            fillInMainTable('wide');
        else {
            fillInMainTable('slim');
        }
        mapSeries.select(12);
        mapSeries.select(13);
        mapSeries.select(14);
        mapSeries.select(16);
        changeContent(['US.IN', 'US.KY', 'US.IL', 'US.IA']);

        // On resize changing layout to mobile version or conversely
        window.onresize = function () {
            if (layoutTable.colsCount() == 1 && window.innerWidth > 767) {
                fillInMainTable('wide');
            } else if (layoutTable.colsCount() == 2 && window.innerWidth <= 767) {
                fillInMainTable('slim');
            }
        };

        function getDataId(id) {
            for (var i = 0; i < data.length; i++) {
                if (data[i].id == id) return data[i]
            }
        }

        function getDataSum(field) {
            var result = 0;
            for (var i = 0; i < data.length; i++) {
                result += parseInt(data[i][field])
            }
            return result
        }
    });
});
</script>  
 </div>
 
</body>
</html>