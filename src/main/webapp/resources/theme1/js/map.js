const dataSource = {
  chart: {
    caption: "Average Temperature of US States",
    subcaption: "1979 - 2000",
    entityfillhovercolor: "#F8F8E9",
    numbersuffix: "°F",
    showlabels: "1",
    borderthickness: "0.4",
    theme: "fusion",
    entitytooltext:
      "<b>$lname</b> has an average temperature of <b>$datavalue</b>"
  },
  colorrange: {
    minvalue: "20",
    code: "#00A971",
    gradient: "1",
    color: [
      {
        minvalue: "20",
        maxvalue: "40",
        code: "#EFD951"
      },
      {
        minvalue: "40",
        maxvalue: "60",
        code: "#FD8963"
      },
      {
        minvalue: "60",
        maxvalue: "80",
        code: "#D60100"
      }
    ]
  },
  data: [
    {
      id: "HI",
      value: "70.0"
    },
    {
      id: "DC",
      value: "52.3"
    },
    {
      id: "MD",
      value: "54.2"
    },
    {
      id: "DE",
      value: "55.3"
    },
    {
      id: "RI",
      value: "50.1"
    },
    {
      id: "WA",
      value: "48.3"
    },
    {
      id: "OR",
      value: "48.4"
    },
    {
      id: "CA",
      value: "59.4"
    },
    {
      id: "AK",
      value: "26.6"
    },
    {
      id: "ID",
      value: "44.4"
    },
    {
      id: "NV",
      value: "49.9"
    },
    {
      id: "AZ",
      value: "60.3"
    },
    {
      id: "MT",
      value: "42.7"
    },
    {
      id: "WY",
      value: "42.0"
    },
    {
      id: "UT",
      value: "48.6"
    },
    {
      id: "CO",
      value: "45.1"
    },
    {
      id: "NM",
      value: "53.4"
    },
    {
      id: "ND",
      value: "40.4"
    },
    {
      id: "SD",
      value: "45.2"
    },
    {
      id: "NE",
      value: "48.8"
    },
    {
      id: "KS",
      value: "54.3"
    },
    {
      id: "OK",
      value: "59.6"
    },
    {
      id: "TX",
      value: "64.8"
    },
    {
      id: "MN",
      value: "41.2"
    },
    {
      id: "IA",
      value: "47.8"
    },
    {
      id: "MO",
      value: "54.5"
    },
    {
      id: "AR",
      value: "60.4"
    },
    {
      id: "LA",
      value: "66.4"
    },
    {
      id: "WI",
      value: "43.1"
    },
    {
      id: "IL",
      value: "51.8"
    },
    {
      id: "KY",
      value: "55.6"
    },
    {
      id: "TN",
      value: "57.6"
    },
    {
      id: "MS",
      value: "63.4"
    },
    {
      id: "AL",
      value: "62.8"
    },
    {
      id: "GA",
      value: "63.5"
    },
    {
      id: "MI",
      value: "44.4"
    },
    {
      id: "IN",
      value: "51.7"
    },
    {
      id: "OH",
      value: "50.7"
    },
    {
      id: "PA",
      value: "48.8"
    },
    {
      id: "NY",
      value: "45.4"
    },
    {
      id: "VT",
      value: "42.9"
    },
    {
      id: "NH",
      value: "43.8"
    },
    {
      id: "ME",
      value: "41.0"
    },
    {
      id: "MA",
      value: "47.9"
    },
    {
      id: "CT",
      value: "49.0"
    },
    {
      id: "NJ",
      value: "52.7"
    },
    {
      id: "WV",
      value: "51.8"
    },
    {
      id: "VA",
      value: "55.1"
    },
    {
      id: "NC",
      value: "59.0"
    },
    {
      id: "SC",
      value: "62.4"
    },
    {
      id: "FL",
      value: "70.7"
    }
  ]
};

FusionCharts.ready(function() {
  var myChart = new FusionCharts({
    type: "usa",
    renderAt: "chart-container",
    width: "100%",
    height: "100%",
    dataFormat: "json",
    dataSource
  }).render();
});
