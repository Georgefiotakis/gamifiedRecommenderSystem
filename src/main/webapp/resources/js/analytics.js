/**
 * ---------------------------------------
 * This demo was created using amCharts 4.
 *
 * For more information visit:
 * https://www.amcharts.com/
 *
 * Documentation is available at:
 * https://www.amcharts.com/docs/v4/
 * ---------------------------------------
 */

// Themes begin
am4core.useTheme(am4themes_animated);
// Themes end

// Create chart instance
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

series.columns.template.adapter.add("fill", function(fill, target) {
    return chart.colors.getIndex(target.dataItem.index);
});

// Cursor
chart.cursor = new am4charts.XYCursor();

////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////

am4core.useTheme(am4themes_animated);

// Create chart instance
var chart2 = am4core.create("userBarChart", am4charts.PieChart);

// Add data
chart2.data = [{
    "title": "Network Engineering",
    "users": 34
}, {
    "title": "Software Engineering",
    "users": 23
}, {
    "title": "Data Science",
    "users": 15
}, {
    "title": "Game Development",
    "users": 40
}, {
    "title": "UI/UX",
    "users": 9
}];

// Add and configure Series
var pieSeries = chart2.series.push(new am4charts.PieSeries());
pieSeries.dataFields.value = "users";
pieSeries.dataFields.category = "title";
pieSeries.innerRadius = am4core.percent(50);
pieSeries.ticks.template.disabled = true;
pieSeries.labels.template.disabled = true;

var rgm = new am4core.RadialGradientModifier();
rgm.brightnesses.push(-0.8, -0.8, -0.5, 0, - 0.5);
pieSeries.slices.template.fillModifier = rgm;
pieSeries.slices.template.strokeModifier = rgm;
pieSeries.slices.template.strokeOpacity = 0.4;
pieSeries.slices.template.strokeWidth = 0;

chart2.legend = new am4charts.Legend();
chart2.legend.position = "right";