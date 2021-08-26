$(document).ready(function () {

    $.ajax({
        type: "GET",
        url: "./getUsersLeaderboard",
        success: function (data, status) {
            leaderboardChart(data)
        }
    });

});

function leaderboardChart(data) {

// Themes begin
    console.log("Data:" + data);
    am4core.useTheme(am4themes_animated);
    am4core.options.autoSetClassName = true;
// Themes end

    /**
     * Chart design taken from Samsung health app
     */

    var chart = am4core.create("leaderboardHorizontal", am4charts.XYChart);
    chart.hiddenState.properties.opacity = 0; // this creates initial fade-in

    chart.paddingBottom = 30;

    var tempData2 = {};
    tempData2['data'] = [];

    for (var j = 0; j < data.length; j++) {
        tempData2["data"][j] = {};
        tempData2.data[j]["points"] = data[j].points;
        tempData2.data[j]["userName"] = data[j].userName;
        tempData2.data[j]["href"] = data[j].href;
    }

    chart.data = tempData2.data;

    // chart.data = [{
    //     "name": "Monica",
    //     "steps": 45688,
    //     "href": "https://www.amcharts.com/wp-content/uploads/2019/04/monica.jpg"
    // }, {
    //     "name": "Joey",
    //     "steps": 35781,
    //     "href": "https://www.amcharts.com/wp-content/uploads/2019/04/joey.jpg"
    // }, {
    //     "name": "Ross",
    //     "steps": 25464,
    //     "href": "https://www.amcharts.com/wp-content/uploads/2019/04/ross.jpg"
    // }, {
    //     "name": "Phoebe",
    //     "steps": 18788,
    //     "href": "https://www.amcharts.com/wp-content/uploads/2019/04/phoebe.jpg"
    // }, {
    //     "name": "Rachel",
    //     "steps": 15465,
    //     "href": "https://www.amcharts.com/wp-content/uploads/2019/04/rachel.jpg"
    // }, {
    //     "name": "Chandler",
    //     "steps": 11561,
    //     "href": "https://www.amcharts.com/wp-content/uploads/2019/04/chandler.jpg"
    // }];

    var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
    categoryAxis.dataFields.category = "userName";
    categoryAxis.renderer.grid.template.strokeOpacity = 0;
    categoryAxis.renderer.minGridDistance = 10;
    categoryAxis.renderer.labels.template.dy = 35;
    categoryAxis.renderer.tooltip.dy = 35;

    var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
    valueAxis.renderer.inside = true;
    valueAxis.renderer.labels.template.fillOpacity = 0.3;
    valueAxis.renderer.grid.template.strokeOpacity = 0;
    valueAxis.min = 0;
    valueAxis.cursorTooltipEnabled = false;
    valueAxis.renderer.baseGrid.strokeOpacity = 0;

    var series = chart.series.push(new am4charts.ColumnSeries);
    series.dataFields.valueY = "points";
    series.dataFields.categoryX = "userName";
    series.tooltipText = "{valueY.value}";
    series.tooltip.pointerOrientation = "vertical";
    series.tooltip.dy = - 6;
    series.columnsContainer.zIndex = 100;

    var columnTemplate = series.columns.template;
    columnTemplate.width = am4core.percent(50);
    columnTemplate.maxWidth = 66;
    columnTemplate.column.cornerRadius(60, 60, 10, 10);
    columnTemplate.strokeOpacity = 0;

    series.heatRules.push({ target: columnTemplate, property: "fill", dataField: "valueY", min: am4core.color("#e5dc36"), max: am4core.color("#5faa46") });
    series.mainContainer.mask = undefined;

    var cursor = new am4charts.XYCursor();
    chart.cursor = cursor;
    cursor.lineX.disabled = true;
    cursor.lineY.disabled = true;
    cursor.behavior = "none";

    var bullet = columnTemplate.createChild(am4charts.CircleBullet);
    bullet.circle.radius = 30;
    bullet.valign = "bottom";
    bullet.align = "center";
    bullet.isMeasured = true;
    bullet.mouseEnabled = false;
    bullet.verticalCenter = "bottom";
    bullet.interactionsEnabled = false;

    var hoverState = bullet.states.create("hover");
    var outlineCircle = bullet.createChild(am4core.Circle);
    outlineCircle.adapter.add("radius", function (radius, target) {
        var circleBullet = target.parent;
        return circleBullet.circle.pixelRadius + 10;
    })

    var image = bullet.createChild(am4core.Image);
    image.width = 60;
    image.height = 60;
    image.horizontalCenter = "middle";
    image.verticalCenter = "middle";
    image.propertyFields.href = "href";

    image.adapter.add("mask", function (mask, target) {
        var circleBullet = target.parent;
        return circleBullet.circle;
    })

    var previousBullet;
    chart.cursor.events.on("cursorpositionchanged", function (event) {
        var dataItem = series.tooltipDataItem;

        if (dataItem.column) {
            var bullet = dataItem.column.children.getIndex(1);

            if (previousBullet && previousBullet != bullet) {
                previousBullet.isHover = false;
            }

            if (previousBullet != bullet) {

                var hs = bullet.states.getKey("hover");
                hs.properties.dy = -bullet.parent.pixelHeight + 30;
                bullet.isHover = true;

                previousBullet = bullet;
            }
        }
    })

}