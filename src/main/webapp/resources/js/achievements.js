var catOneLesOneCompletion;
var catOneLesTwoCompletion;
var catOneLesThreeCompletion;
var catTwoLesOneCompletion;
var catTwoLesTwoCompletion;
var catTwoLesThreeCompletion;
var catThreeLesOneCompletion;
var catThreeLesTwoCompletion;
var catThreeLesThreeCompletion;
var catFourLesOneCompletion;
var catFourLesTwoCompletion;
var catFourLesThreeCompletion;

$(document).ready(function () {

    $.ajax({
        type: "GET",
        url: "./getUsersLeaderboard",
        success: function (data, status) {
            // console.log(data);
            createLeaderboard(data)
        }
    });

    $.ajax({
        type: "GET",
        url: "./analytics/userPerGender",
        success: function (data, status) {
            buildUsersPerGenderBarChart(data);
        }
    });


    $.ajax({
        type: "GET",
        url: "./getUserCategoryOneLessons",
        success: function (data, status) {
            // console.log("Lessons retrieved for category one");

            var lessonOneValue = data["lessonOne"];
            var lessonTwoValue = data["lessonTwo"];
            var lessonThreeValue = data["lessonThree"];

            catOneLesOneCompletion = lessonOneValue;
            catOneLesTwoCompletion = lessonTwoValue;
            catOneLesThreeCompletion = lessonThreeValue;

            // console.log(catOneLesOneCompletion);
            // console.log(catOneLesTwoCompletion);
            // console.log(catOneLesThreeCompletion);

        }, complete: function () {
            getUserCategoryTwoLessons();
        }
    });
});

function buildUsersPerGenderBarChart(data) {
// Themes begin
    am4core.useTheme(am4themes_animated);
    am4core.options.autoSetClassName = true;
// Themes end

// Create chart instance
    var chart = am4core.create("userLeaderboardDiv", am4charts.XYChart);

    var tempData2 = {};
    tempData2['data'] = [];

    for (var j = 0; j < data.length; j++) {
        tempData2["data"][j] = {};
        tempData2.data[j]["gender"] = data[j].gender;
        tempData2.data[j]["users"] = data[j].users;
        tempData2.data[j]["bullet"] = data[j].bullet;
        tempData2.data[j]["color"] = data[j].color;
    }

    chart.data = tempData2.data;

// Add data
//     chart.data = [{
//         "name": "Female",
//         "points": 30,
//         "bullet": "https://www.amcharts.com/lib/images/faces/A04.png"
//     }, {
//         "name": "Male",
//         "points": 20,
//         "bullet": "https://www.amcharts.com/lib/images/faces/C02.png"
//     }];

// Create axes
    var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
    categoryAxis.dataFields.category = "gender";
    categoryAxis.renderer.grid.template.disabled = true;
    categoryAxis.renderer.minGridDistance = 30;
    categoryAxis.renderer.inside = true;
    categoryAxis.renderer.labels.template.fill = am4core.color("#fff");
    categoryAxis.renderer.labels.template.fontSize = 20;

    var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
    valueAxis.renderer.grid.template.strokeDasharray = "4,4";
    valueAxis.renderer.labels.template.disabled = true;
    valueAxis.min = 0;

// Do not crop bullets
    chart.maskBullets = false;

// Remove padding
    chart.paddingBottom = 0;

// Create series
    var series = chart.series.push(new am4charts.ColumnSeries());
    series.dataFields.valueY = "users";
    series.dataFields.categoryX = "gender";
    series.columns.template.propertyFields.fill = "color";
    series.columns.template.propertyFields.stroke = "color";
    series.columns.template.column.cornerRadiusTopLeft = 15;
    series.columns.template.column.cornerRadiusTopRight = 15;
    series.columns.template.tooltipText = "{categoryX}: [bold]{valueY}[/b]";

// Add bullets
    var bullet = series.bullets.push(new am4charts.Bullet());
    var image = bullet.createChild(am4core.Image);
    image.horizontalCenter = "middle";
    image.verticalCenter = "bottom";
    image.dy = 20;
    image.y = am4core.percent(100);
    image.propertyFields.href = "bullet";
    image.tooltipText = series.columns.template.tooltipText;
    image.propertyFields.fill = "color";
    image.filters.push(new am4core.DropShadowFilter());
}

function getUserCategoryTwoLessons() {
    $.ajax({
        type: "GET",
        url: "./getUserCategoryTwoLessons",
        success: function (data, status) {
            // console.log("Lessons retrieved for category two");

            var lessonOneValue = data["lessonOne"];
            var lessonTwoValue = data["lessonTwo"];
            var lessonThreeValue = data["lessonThree"];

            catTwoLesOneCompletion = lessonOneValue;
            catTwoLesTwoCompletion = lessonTwoValue;
            catTwoLesThreeCompletion = lessonThreeValue;

            // console.log(catTwoLesOneCompletion);
            // console.log(catTwoLesTwoCompletion);
            // console.log(catTwoLesThreeCompletion);

        }, complete: function () {
            getUserCategoryThreeLessons();
        }
    });
}

function getUserCategoryThreeLessons() {
    $.ajax({
        type: "GET",
        url: "./getUserCategoryThreeLessons",
        success: function (data, status) {
            // console.log("Lessons retrieved for category three");

            var lessonOneValue = data["lessonOne"];
            var lessonTwoValue = data["lessonTwo"];
            var lessonThreeValue = data["lessonThree"];

            catThreeLesOneCompletion = lessonOneValue;
            catThreeLesTwoCompletion = lessonTwoValue;
            catThreeLesThreeCompletion = lessonThreeValue;

            // console.log(catThreeLesOneCompletion);
            // console.log(catThreeLesTwoCompletion);
            // console.log(catThreeLesThreeCompletion);

        },complete: function () {
            getUserCategoryFourLessons();
        }
    });
}

function getUserCategoryFourLessons() {
    $.ajax({
        type: "GET",
        url: "./getUserCategoryFourLessons",
        success: function (data, status) {
            // console.log("Lessons retrieved for category four");

            var lessonOneValue = data["lessonOne"];
            var lessonTwoValue = data["lessonTwo"];
            var lessonThreeValue = data["lessonThree"];

            catFourLesOneCompletion = lessonOneValue;
            catFourLesTwoCompletion = lessonTwoValue;
            catFourLesThreeCompletion = lessonThreeValue;

            // console.log(catFourLesOneCompletion);
            // console.log(catFourLesTwoCompletion);
            // console.log(catFourLesThreeCompletion);

        }, complete: function () {
            createProgressBars();
        }
    });
}

function createProgressBars() {

    //Category One
    if (catOneLesOneCompletion === 1 && catOneLesTwoCompletion === 0 && catOneLesThreeCompletion === 0) {
        $('#ctBar').css("width","33%");
        $('#ctBar').html("33%");
        $('#overallCategoriesBar').css("width","8%");
        $('#overallCategoriesBar').html("8%");
    }
    if (catOneLesOneCompletion === 1 && catOneLesTwoCompletion === 1 && catOneLesThreeCompletion === 0) {
        $('#ctBar').css("width","66%");
        $('#ctBar').html("66%");
        $('#overallCategoriesBar').css("width","16%");
        $('#overallCategoriesBar').html("16%");
    }
    if (catOneLesOneCompletion === 1 && catOneLesTwoCompletion === 1 && catOneLesThreeCompletion === 1) {
        // $('#ctBar').css("width","100%");
        // $('#ctBar').html("100%");
        $('#ctBar').css("width","100%");
        $('#ctBar').css("background-color","green");
        $('#ctBar').html("100% Completed &#10004");
        $('#overallCategoriesBar').css("width","25%");
        $('#overallCategoriesBar').html("25%");
    }

    //Category Two
    if (catTwoLesOneCompletion === 1 && catTwoLesTwoCompletion === 0 && catTwoLesThreeCompletion === 0) {
        $('#smBar').css("width","33%");
        $('#smBar').html("33%");
        $('#overallCategoriesBar').css("width","33%");
        $('#overallCategoriesBar').html("33%");
    }
    if (catTwoLesOneCompletion === 1 && catTwoLesTwoCompletion === 1 && catTwoLesThreeCompletion === 0) {
        $('#smBar').css("width","66%");
        $('#smBar').html("66%");
        $('#overallCategoriesBar').css("width","41%");
        $('#overallCategoriesBar').html("41%");
    }
    if (catTwoLesOneCompletion === 1 && catTwoLesTwoCompletion === 1 && catTwoLesThreeCompletion === 1) {
        $('#smBar').css("width","100%");
        $('#smBar').css("background-color","green");
        $('#smBar').html("100% Completed &#10004");
        $('#overallCategoriesBar').css("width","50%");
        $('#overallCategoriesBar').html("50%");
    }

    //Category Three
    if (catThreeLesOneCompletion === 1 && catThreeLesTwoCompletion === 0 && catThreeLesThreeCompletion === 0) {
        $('#imBar').css("width","33%");
        $('#imBar').html("33%");
        $('#overallCategoriesBar').css("width","58%");
        $('#overallCategoriesBar').html("58%");
    }
    if (catThreeLesOneCompletion === 1 && catThreeLesTwoCompletion === 1 && catThreeLesThreeCompletion === 0) {
        $('#imBar').css("width","66%");
        $('#imBar').html("66%");
        $('#overallCategoriesBar').css("width","66%");
        $('#overallCategoriesBar').html("66%");
    }
    if (catThreeLesOneCompletion === 1 && catThreeLesTwoCompletion === 1 && catThreeLesThreeCompletion === 1) {
        $('#imBar').css("width","100%");
        $('#imBar').css("background-color","green");
        $('#imBar').html("100% Completed &#10004");
        $('#overallCategoriesBar').css("width","75%");
        $('#overallCategoriesBar').html("75%");
    }

    //Category Four
    if (catFourLesOneCompletion === 1 && catFourLesTwoCompletion === 0 && catFourLesThreeCompletion === 0) {
        $('#crtBar').css("width","33%");
        $('#crtBar').html("33%");
        $('#overallCategoriesBar').css("width","83%");
        $('#overallCategoriesBar').html("83%");
    }
    if (catFourLesOneCompletion === 1 && catFourLesTwoCompletion === 1 && catFourLesThreeCompletion === 0) {
        $('#crtBar').css("width","66%");
        $('#crtBar').html("66%");
        $('#overallCategoriesBar').css("width","91%");
        $('#overallCategoriesBar').html("91%");
    }
    if (catFourLesOneCompletion === 1 && catFourLesTwoCompletion === 1 && catFourLesThreeCompletion === 1) {
        $('#crtBar').css("width","100%");
        $('#crtBar').css("background-color","green");
        $('#crtBar').html("100% Completed &#10004");

        $('#overallCategoriesBar').css("width","100%");
        $('#overallCategoriesBar').css("background-color","green");
        $('#overallCategoriesBar').html("100% Completed &#10004");
    }
}

// function createLeaderboard(data) {
//
// // Themes begin
// //     console.log("Data:" + data);
//     am4core.useTheme(am4themes_animated);
//     am4core.options.autoSetClassName = true;
// // Themes end
//
//     /**
//      * Chart design taken from Samsung health app
//      */
//
//     var chart = am4core.create("userLeaderboardDiv", am4charts.XYChart);
//     chart.hiddenState.properties.opacity = 0; // this creates initial fade-in
//
//     chart.paddingRight = 40;
//
//     var tempData2 = {};
//     tempData2['data'] = [];
//
//     for (var j = 0; j < data.length; j++) {
//         tempData2["data"][j] = {};
//         tempData2.data[j]["points"] = data[j].points;
//         tempData2.data[j]["userName"] = data[j].userName;
//         tempData2.data[j]["href"] = data[j].href;
//     }
//
//     chart.data = tempData2.data;
//
//     var categoryAxis = chart.yAxes.push(new am4charts.CategoryAxis());
//     categoryAxis.dataFields.category = "userName";
//     categoryAxis.renderer.grid.template.strokeOpacity = 0;
//     categoryAxis.renderer.minGridDistance = 10;
//     categoryAxis.renderer.labels.template.dx = -40;
//     categoryAxis.renderer.minWidth = 120;
//     categoryAxis.renderer.tooltip.dx = -40;
//
//     var valueAxis = chart.xAxes.push(new am4charts.ValueAxis());
//     valueAxis.renderer.inside = true;
//     valueAxis.renderer.labels.template.fillOpacity = 0.3;
//     valueAxis.renderer.grid.template.strokeOpacity = 0;
//     valueAxis.min = 0;
//     valueAxis.cursorTooltipEnabled = false;
//     valueAxis.renderer.baseGrid.strokeOpacity = 0;
//     valueAxis.renderer.labels.template.dy = 20;
//
//     var series = chart.series.push(new am4charts.ColumnSeries);
//     series.dataFields.valueX = "points";
//     series.dataFields.categoryY = "userName";
//     series.tooltipText = "{valueX.value}";
//     series.tooltip.pointerOrientation = "vertical";
//     series.tooltip.dy = - 30;
//     series.columnsContainer.zIndex = 100;
//
//     var columnTemplate = series.columns.template;
//     columnTemplate.height = am4core.percent(50);
//     columnTemplate.maxHeight = 50;
//     columnTemplate.column.cornerRadius(60, 10, 60, 10);
//     columnTemplate.strokeOpacity = 0;
//
//     series.heatRules.push({ target: columnTemplate, property: "fill", dataField: "valueX", min: am4core.color("#c633ff"), max: am4core.color("#5425ff") });
//     series.mainContainer.mask = undefined;
//
//     var cursor = new am4charts.XYCursor();
//     chart.cursor = cursor;
//     cursor.lineX.disabled = true;
//     cursor.lineY.disabled = true;
//     cursor.behavior = "none";
//
//     var bullet = columnTemplate.createChild(am4charts.CircleBullet);
//     bullet.circle.radius = 30;
//     bullet.valign = "middle";
//     bullet.align = "left";
//     bullet.isMeasured = true;
//     bullet.interactionsEnabled = false;
//     bullet.horizontalCenter = "right";
//     bullet.interactionsEnabled = false;
//
//     var hoverState = bullet.states.create("hover");
//     var outlineCircle = bullet.createChild(am4core.Circle);
//     outlineCircle.adapter.add("radius", function (radius, target) {
//         var circleBullet = target.parent;
//         return circleBullet.circle.pixelRadius + 10;
//     })
//
//     var image = bullet.createChild(am4core.Image);
//     image.width = 60;
//     image.height = 60;
//     image.horizontalCenter = "middle";
//     image.verticalCenter = "middle";
//     image.propertyFields.href = "href";
//
//     image.adapter.add("mask", function (mask, target) {
//         var circleBullet = target.parent;
//         return circleBullet.circle;
//     })
//
//     var previousBullet;
//     chart.cursor.events.on("cursorpositionchanged", function (event) {
//         var dataItem = series.tooltipDataItem;
//
//         if (dataItem.column) {
//             var bullet = dataItem.column.children.getIndex(1);
//
//             if (previousBullet && previousBullet != bullet) {
//                 previousBullet.isHover = false;
//             }
//
//             if (previousBullet != bullet) {
//
//                 var hs = bullet.states.getKey("hover");
//                 hs.properties.dx = dataItem.column.pixelWidth;
//                 bullet.isHover = true;
//
//                 previousBullet = bullet;
//             }
//         }
//     })
// }