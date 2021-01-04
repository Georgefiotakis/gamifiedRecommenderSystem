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

// Create chart
var chart = am4core.create("heatMap", am4charts.PieChart);
chart.hiddenState.properties.opacity = 0; // this creates initial fade-in

// var title = chart.titles.create();
// title.text = "HeatMap";
// title.fontSize = 24;
// title.marginBottom = 30;

chart.data = [
    {
        status: "Online Devices",
        value: 60
    },
    {
        status: "Offline Devices",
        value: 40
    }
];

var series = chart.series.push(new am4charts.PieSeries());
series.dataFields.value = "value";
series.dataFields.radiusValue = "value";
series.dataFields.category = "status";
// series.slices.template.cornerRadius = 6;
series.colors.step = 15;
series.colors.baseColor = am4core.color("#49ac03");

series.hiddenState.properties.endAngle = -90;
series.stroke = am4core.color("#4e4e4e");
series.tooltip.getFillFromObject = false;
series.tooltip.background.fill = am4core.color("#4e4e4e");
// chart.legend = new am4charts.Legend();

// Create a base filter effect (as if it's not there) for the hover to return to
var shadow = series.slices.template.filters.push(new am4core.DropShadowFilter);
shadow.opacity = 0;

// Create hover state
var hoverState = series.slices.template.states.getKey("hover"); // normally we have to create the hover state, in this case it already exists

var hoverShadow = hoverState.filters.push(new am4core.DropShadowFilter);
hoverShadow.opacity = 0.7;
hoverShadow.blur = 5;