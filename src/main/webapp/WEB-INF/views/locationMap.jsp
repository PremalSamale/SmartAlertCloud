                     
<html>
<head>
  <script src="https://cdn.anychart.com/releases/v8/js/anychart-base.min.js?hcode=be5162d915534272a57d0bb781d27f2b"></script>
  <script src="https://cdn.anychart.com/releases/v8/js/anychart-ui.min.js?hcode=be5162d915534272a57d0bb781d27f2b"></script>
  <script src="https://cdn.anychart.com/releases/v8/js/anychart-exports.min.js?hcode=be5162d915534272a57d0bb781d27f2b"></script>
  <script src="https://cdn.anychart.com/releases/v8/js/anychart-map.min.js?hcode=be5162d915534272a57d0bb781d27f2b"></script>
  <script src="https://cdn.anychart.com/releases/v8/js/anychart-data-adapter.min.js?hcode=be5162d915534272a57d0bb781d27f2b"></script>
  <script src="https://cdn.anychart.com/geodata/1.2.0/countries/united_states_of_america/united_states_of_america.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/proj4js/2.3.15/proj4.js"></script>
  <script src="https://cdn.anychart.com/releases/v8/themes/morning.min.js"></script>
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
</head>
<body>
  <div id="container"></div>
  <script>
anychart.onDocumentReady(function () {
	// set chart theme
anychart.theme('morning');
    // The data used in this sample can be obtained from the CDN
    // https://cdn.anychart.com/samples/maps-point-maps-dot-maps/usa-airports/data.json
    anychart.data.loadJsonFile('https://cdn.anychart.com/samples/maps-point-maps-dot-maps/usa-airports/data.json', function (data) {
        // creates map chart
        var map = anychart.map();
        map.credits()
                .enabled(true)
                .url('https://opendata.socrata.com/dataset/Airport-Codes-mapped-to-Latitude-Longitude-in-the-/rxrh-4cxm')
                .text('Data source: https://opendata.socrata.com')
                .logoSrc('https://opendata.socrata.com/stylesheets/images/common/favicon.ico');

        map.unboundRegions()
                .enabled(true)
                .fill('#E1E1E1')
                .stroke('#D2D2D2');

        // sets geodata
        map.geoData('anychart.maps.united_states_of_america');

        // sets Chart Title
        map.title()
                .enabled(true)
                .useHtml(true)
                .padding([0, 0, 10, 0])
                .text('Airports in the United States<br/><span style="color:#929292; font-size: 12px;">' +
                        'According to opendata.socrata.com<br/>Cities and names were collected from Wikipedia.org</span>');

        // sets marker series for airports
        var series = map.marker(anychart.data.set(data));

        // sets Tooltip for series
        series.tooltip()
                .useHtml(true)
                .padding([8, 13, 10, 13])
                .title(false)
                .separator(false)
                .fontSize(14)
                .format(function () {
                    return '<span>' + this.getData('name') + '</span><br/>' +
                            '<span style="font-size: 12px; color: #E1E1E1">City: ' +
                            this.getData('city') + '</span>';
                });

        // sets settings for marker-airports series
        series.size(5)
                .labels(false)
                .stroke(null)
                .stroke('2 #E1E1E1')
                .fill('#1976d2')
                .selectionMode('none');

        // create zoom controls
        var zoomController = anychart.ui.zoom();
        zoomController.render(map);

        // sets container id for the chart
        map.container('container');
        // initiates chart drawing
        map.draw();
    });
});
</script>
</body>
</html>

                