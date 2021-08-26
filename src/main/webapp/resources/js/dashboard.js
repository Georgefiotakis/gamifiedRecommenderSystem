$(document).ready(function () {

    var userXP = $(".hiddenUserXP").attr('value');
    var userLevel = $(".hiddenUserLevel").attr('value');

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
        url: "./getUserCategoryOneLessons",
        success: function (data, status) {
            console.log("Lessons retrieved for category one");

            var lessonOneValue = data["lessonOne"];
            var lessonTwoValue = data["lessonTwo"];
            var lessonThreeValue = data["lessonThree"];

            if (lessonOneValue === 1) {
                enableNext(categoryOneDiv);
                enableNext(catOneQuizOne);
                enableNext(catOneQuizTwo);
            }

            if (lessonOneValue === 1 && lessonTwoValue === 1) {
                // enableNext(categoryOneDiv);
                // enableNext(catOneQuizOne);
                // enableNext(catOneQuizTwo);
                enableNext(catOneQuizThree);
            }

            if (lessonOneValue === 1 && lessonTwoValue === 1 && lessonThreeValue === 1 && userXP > 100 && parseInt(userLevel,10) === 1) {
                raiseStars();
            }

            if (parseInt(userLevel,10) === 2 ) {
                enableNext(categoryTwoDiv);
                enableNext(catTwoQuizOne);
            }

            var h6 = document.createElement('h6');
            if (lessonOneValue === 0 && lessonTwoValue === 0 && lessonThreeValue === 0) {
                h6.innerHTML = "Quiz Completed : 0 / 3";
            }
            if (lessonOneValue === 1 && lessonTwoValue === 0 && lessonThreeValue === 0) {
                h6.innerHTML = "Quiz Completed : 1 / 3";
            }
            if (lessonOneValue === 1 && lessonTwoValue === 1 && lessonThreeValue === 0) {
                h6.innerHTML = "Quiz Completed : 2 / 3";
            }
            if (lessonOneValue === 1 && lessonTwoValue === 1 && lessonThreeValue === 1) {
                h6.innerHTML = "Quiz Completed : 3 / 3";
            }
            $('.categoryOneFooter').append(h6);
        }
    });

    $.ajax({
        type: "GET",
        url: "./getUserCategoryTwoLessons",
        success: function (data, status) {
            console.log("Lessons retrieved for category two");

            var lessonOneValue = data["lessonOne"];
            var lessonTwoValue = data["lessonTwo"];
            var lessonThreeValue = data["lessonThree"];

            if (lessonOneValue === 1 ) {
                enableNext(categoryTwoDiv);
                enableNext(catTwoQuizOne);
                enableNext(catTwoQuizTwo);
            }

            if (lessonOneValue === 1 && lessonTwoValue === 1) {
                // enableNext(categoryTwoDiv);
                // enableNext(catTwoQuizOne);
                // enableNext(catTwoQuizTwo);
                enableNext(catTwoQuizThree)
            }

            if (lessonOneValue === 1 && lessonTwoValue === 1 && lessonThreeValue === 1 && userXP > 200 && parseInt(userLevel,10) === 2) {
                raiseStars();
            }

            if (parseInt(userLevel,10) === 3 ) {
                enableNext(categoryThreeDiv);
                enableNext(catThreeQuizOne);
            }

            var h6 = document.createElement('h6');
            if (lessonOneValue === 0 && lessonTwoValue === 0 && lessonThreeValue === 0) {
                h6.innerHTML = "Quiz Completed : 0 / 3";
            }
            if (lessonOneValue === 1 && lessonTwoValue === 0 && lessonThreeValue === 0) {
                h6.innerHTML = "Quiz Completed : 1 / 3";
            }
            if (lessonOneValue === 1 && lessonTwoValue === 1 && lessonThreeValue === 0) {
                h6.innerHTML = "Quiz Completed : 2 / 3";
            }
            if (lessonOneValue === 1 && lessonTwoValue === 1 && lessonThreeValue === 1) {
                h6.innerHTML = "Quiz Completed : 3 / 3";
            }
            $('.categoryTwoFooter').append(h6);
        }
    });

    $.ajax({
        type: "GET",
        url: "./getUserCategoryThreeLessons",
        success: function (data, status) {
            console.log("Lessons retrieved for category three");

            var lessonOneValue = data["lessonOne"];
            var lessonTwoValue = data["lessonTwo"];
            var lessonThreeValue = data["lessonThree"];

            if (lessonOneValue === 1 ) {
                enableNext(categoryThreeDiv);
                enableNext(catThreeQuizOne);
                enableNext(catThreeQuizTwo);
            }

            if (lessonOneValue === 1 && lessonTwoValue === 1) {
                enableNext(categoryThreeDiv);
                enableNext(catThreeQuizOne);
                enableNext(catThreeQuizTwo);
                enableNext(catThreeQuizThree)
            }

            if (lessonOneValue === 1 && lessonTwoValue === 1 && lessonThreeValue === 1 && userXP > 300 && parseInt(userLevel,10) === 3) {
                raiseStars();
            }

            if (parseInt(userLevel,10) === 4 ) {
                enableNext(categoryFourDiv);
                enableNext(catFourQuizOne);
            }

            var h6 = document.createElement('h6');
            if (lessonOneValue === 0 && lessonTwoValue === 0 && lessonThreeValue === 0) {
                h6.innerHTML = "Quiz Completed : 0 / 3";
            }
            if (lessonOneValue === 1 && lessonTwoValue === 0 && lessonThreeValue === 0) {
                h6.innerHTML = "Quiz Completed : 1 / 3";
            }
            if (lessonOneValue === 1 && lessonTwoValue === 1 && lessonThreeValue === 0) {
                h6.innerHTML = "Quiz Completed : 2 / 3";
            }
            if (lessonOneValue === 1 && lessonTwoValue === 1 && lessonThreeValue === 1) {
                h6.innerHTML = "Quiz Completed : 3 / 3";
            }
            $('.categoryThreeFooter').append(h6);
        }
    });

    $.ajax({
        type: "GET",
        url: "./getUserCategoryFourLessons",
        success: function (data, status) {
            console.log("Lessons retrieved for category four");

            var lessonOneValue = data["lessonOne"];
            var lessonTwoValue = data["lessonTwo"];
            var lessonThreeVlue = data["lessonThree"];

            if (lessonOneValue === 1 ) {
                enableNext(categoryFourDiv);
                enableNext(catFourQuizOne);
                enableNext(catFourQuizTwo);
            }

            if (lessonOneValue === 1 && lessonTwoValue === 1) {
                enableNext(categoryFourDiv);
                enableNext(catFourQuizOne);
                enableNext(catFourQuizTwo);
                enableNext(catFourQuizThree)
            }

            var h6 = document.createElement('h6');
            if (lessonOneValue === 0 && lessonTwoValue === 0 && lessonThreeVlue === 0) {
                h6.innerHTML = "Quiz Completed : 0 / 3";
            }
            if (lessonOneValue === 1 && lessonTwoValue === 0 && lessonThreeVlue === 0) {
                h6.innerHTML = "Quiz Completed : 1 / 3";
            }
            if (lessonOneValue === 1 && lessonTwoValue === 1 && lessonThreeVlue === 0) {
                h6.innerHTML = "Quiz Completed : 2 / 3";
            }
            if (lessonOneValue === 1 && lessonTwoValue === 1 && lessonThreeVlue === 1) {
                h6.innerHTML = "Quiz Completed : 3 / 3";
            }
            $('.categoryFourFooter').append(h6);
        }
    });

    $('#Myimg').click(function(){
        $('#Mymodal').modal('show')
    });

});

function raiseStars() {
    $.ajax({
        type: "GET",
        url: "./raiseUserStars",
        success: function (data, status) {
            console.log("Star raised successfully");
            location.replace("./dashboard");
        }
    });
}

function openCity(evt, cityName) {
    var i, x, tablinks;
    x = document.getElementsByClassName("city");
    for (i = 0; i < x.length; i++) {
        x[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tablink");
    for (i = 0; i < x.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" w3-border-red", "");
    }
    document.getElementById(cityName).style.display = "block";
    evt.currentTarget.firstElementChild.className += " w3-border-red";
}

function enableNext(element) {

    var idName = element.id;
    console.log("idName:" + idName);
    document.getElementById(idName).style.opacity = "1";
    document.getElementById(idName).style.pointerEvents = "all";
}

function createLeaderboard(data) {

// Themes begin
    console.log("Data:" + data);
    am4core.useTheme(am4themes_animated);
    am4core.options.autoSetClassName = true;
// Themes end

    /**
     * Chart design taken from Samsung health app
     */

    var chart = am4core.create("userLeaderboardDiv", am4charts.XYChart);
    chart.hiddenState.properties.opacity = 0; // this creates initial fade-in

    chart.paddingRight = 40;

    var tempData2 = {};
    tempData2['data'] = [];

    for (var j = 0; j < data.length; j++) {
        tempData2["data"][j] = {};
        tempData2.data[j]["points"] = data[j].points;
        tempData2.data[j]["userName"] = data[j].userName;
        tempData2.data[j]["href"] = data[j].href;
    }

    chart.data = tempData2.data;

    var categoryAxis = chart.yAxes.push(new am4charts.CategoryAxis());
    categoryAxis.dataFields.category = "userName";
    categoryAxis.renderer.grid.template.strokeOpacity = 0;
    categoryAxis.renderer.minGridDistance = 10;
    categoryAxis.renderer.labels.template.dx = -40;
    categoryAxis.renderer.minWidth = 120;
    categoryAxis.renderer.tooltip.dx = -40;

    var valueAxis = chart.xAxes.push(new am4charts.ValueAxis());
    valueAxis.renderer.inside = true;
    valueAxis.renderer.labels.template.fillOpacity = 0.3;
    valueAxis.renderer.grid.template.strokeOpacity = 0;
    valueAxis.min = 0;
    valueAxis.cursorTooltipEnabled = false;
    valueAxis.renderer.baseGrid.strokeOpacity = 0;
    valueAxis.renderer.labels.template.dy = 20;

    var series = chart.series.push(new am4charts.ColumnSeries);
    series.dataFields.valueX = "points";
    series.dataFields.categoryY = "userName";
    series.tooltipText = "{valueX.value}";
    series.tooltip.pointerOrientation = "vertical";
    series.tooltip.dy = - 30;
    series.columnsContainer.zIndex = 100;

    var columnTemplate = series.columns.template;
    columnTemplate.height = am4core.percent(50);
    columnTemplate.maxHeight = 50;
    columnTemplate.column.cornerRadius(60, 10, 60, 10);
    columnTemplate.strokeOpacity = 0;

    series.heatRules.push({ target: columnTemplate, property: "fill", dataField: "valueX", min: am4core.color("#c633ff"), max: am4core.color("#5425ff") });
    series.mainContainer.mask = undefined;

    var cursor = new am4charts.XYCursor();
    chart.cursor = cursor;
    cursor.lineX.disabled = true;
    cursor.lineY.disabled = true;
    cursor.behavior = "none";

    var bullet = columnTemplate.createChild(am4charts.CircleBullet);
    bullet.circle.radius = 30;
    bullet.valign = "middle";
    bullet.align = "left";
    bullet.isMeasured = true;
    bullet.interactionsEnabled = false;
    bullet.horizontalCenter = "right";
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
                hs.properties.dx = dataItem.column.pixelWidth;
                bullet.isHover = true;

                previousBullet = bullet;
            }
        }
    })
}