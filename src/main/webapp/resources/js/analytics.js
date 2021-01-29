$(document).ready(function () {

    $.ajax({
        type: "GET",
        url: "./analytics/recommendationAnalytics",
        success: function (data, status) {
            buildRecommendationsBarChart(data)
        },
        complete: function (data, status) {

        }
    });

    // $.ajax({
    //     type: "GET",
    //     url: "./analytics/countryAnalytics",
    //     success: function (data, status) {
    //         buildCountryBarChart(data);
    //     },
    //     complete: function (data, status) {
    //
    //     }
    // });

});

function buildCountryBarChart(data) {

    console.log("Data:" + data);
    am4core.useTheme(am4themes_animated);

    var chart = am4core.create("countryBarChart", am4charts.XYChart);
    chart.scrollbarX = new am4core.Scrollbar();

// Add data
    chart.data =
        [{
            "country": "Greece",
            "users": 12
        }, {
            "country": "Spain",
            "users": 22
        }, {
            "country": "England",
            "users": 35
        }, {
            "country": "Germany",
            "users": 6
        }, {
            "country": "Italy",
            "users": 18
        }, {
            "country": "France",
            "users": 28
        }];

// Create axes
    var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
    categoryAxis.dataFields.category = "country";
    categoryAxis.renderer.grid.template.location = 0;
    categoryAxis.renderer.minGridDistance = 30;
    categoryAxis.renderer.labels.template.horizontalCenter = "right";
    categoryAxis.renderer.labels.template.verticalCenter = "middle";
    categoryAxis.renderer.labels.template.rotation = 270;
    categoryAxis.tooltip.disabled = true;
    categoryAxis.renderer.minHeight = 110;

    var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
    valueAxis.renderer.minWidth = 50;

// Create series
    var series = chart.series.push(new am4charts.ColumnSeries());
    series.sequencedInterpolation = true;
    series.dataFields.valueY = "users";
    series.dataFields.categoryX = "country";
    series.tooltipText = "[{categoryX}: bold]{valueY}[/]";
    series.columns.template.strokeWidth = 0;

    series.tooltip.pointerOrientation = "vertical";

    series.columns.template.column.cornerRadiusTopLeft = 10;
    series.columns.template.column.cornerRadiusTopRight = 10;
    series.columns.template.column.fillOpacity = 0.8;

// on hover, make corner radiuses bigger
    var hoverState = series.columns.template.column.states.create("hover");
    hoverState.properties.cornerRadiusTopLeft = 0;
    hoverState.properties.cornerRadiusTopRight = 0;
    hoverState.properties.fillOpacity = 1;

    series.columns.template.adapter.add("fill", function (fill, target) {
        return chart.colors.getIndex(target.dataItem.index);
    });

// Cursor
    chart.cursor = new am4charts.XYCursor();
}
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////

function buildRecommendationsBarChart(data) {


    am4core.useTheme(am4themes_animated);

// Create chart instance
    var chart2 = am4core.create("userBarChart", am4charts.PieChart);
    var tempData = {};
    tempData['data'] = [];

    for (var j = 0; j < data.length; j++) {
        tempData["data"][j] = {};
        tempData.data[j]["title"] = data[j].title;
        tempData.data[j]["users"] = data[j].users;
    }

    console.log("Temp:" + tempData.data);
    chart2.data = data;
    console.log("Chart Data:" + chart2.data);
    // console.log("Data:" + data);
    // chart2.data = data;

// Add and configure Series
    var pieSeries = chart2.series.push(new am4charts.PieSeries());
    pieSeries.dataFields.value = "title";
    pieSeries.dataFields.category = "users";
    pieSeries.innerRadius = am4core.percent(50);
    pieSeries.ticks.template.disabled = true;
    pieSeries.labels.template.disabled = true;

    var rgm = new am4core.RadialGradientModifier();
    rgm.brightnesses.push(-0.8, -0.8, -0.5, 0, -0.5);
    pieSeries.slices.template.fillModifier = rgm;
    pieSeries.slices.template.strokeModifier = rgm;
    pieSeries.slices.template.strokeOpacity = 0.4;
    pieSeries.slices.template.strokeWidth = 0;

    chart2.legend = new am4charts.Legend();
    chart2.legend.position = "right";
}