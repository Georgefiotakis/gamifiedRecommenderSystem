/**
 * Created by pandriopoulos on 6/3/15.
 */
//$(document).ready(function() {
////    var windowHeight = $(window).innerHeight();
////    $('#timeSeriesChart').css('height', windowHeight);
//});
//
//window.onload = function () {
//<<<<<<< HEAD
//function buildTimeSeriesChart(metric, metricLabel) {
//    var $containerWidth = $('#myTabContent'),
//        width = $containerWidth.width();
//    var $containerHeight = $('#timeSeriesChart'),
//        height = $containerHeight.height() - 50;
//
////    var main_margin = {top: 20, right: 80, bottom: 100, left: 40},
//    
//    /* Define margins for main and brush frame */
//    var main_margin = {top: 20, right: 80, bottom: 100, left: 80},
//        mini_margin = {top: 480, right: 80, bottom: 20, left: 80},
//        main_width = width - main_margin.left - main_margin.right,
//        main_height = height - main_margin.top - main_margin.bottom,
//        mini_height = height - mini_margin.top - mini_margin.bottom;
//
////    //CHANGE below
//    
//    /* Format x-axis values (dates) */
//    var formatDate = d3.time.format("%m-%d %H:%M"),
//        formatNum = d3.format(".1f"),
//        parseDate = formatDate.parse,
//        bisectDate = d3.bisector(function (d) {
//            return d[0];
//        }).left,
//        formatOutput0 = function (d) {
//            return formatDate(d[0]) + " [ " + formatNum(d[1]) + " ]";
//        },
//        formatOutput1 = function (d) {
//            return formatDate(d[0]) + " [ " + formatNum(d[1]) + " ]";
//        };
//
////    formatOutput0 = function(d) { return formatDate(d[0]) + " - " + d.Durchschn + " ms"; },
////        formatOutput1 = function(d) { return formatDate(d.Uhrzeit) + " - " + d.Anz; };
//
//    var minDate = new Date(),
//        maxDate = new Date();
//
//    /* Scale axes appropriately (according to their frame's width/height) */
//    var main_x = d3.time.scale()
//            .range([0, main_width]),
//        mini_x = d3.time.scale()
//            .range([0, main_width]);
//
//    var main_y0 = d3.scale.sqrt()
//            .range([main_height, 0]),
//        main_y1 = d3.scale.sqrt()
//            .range([main_height, 0]),
//        mini_y0 = d3.scale.sqrt()
//            .range([mini_height, 0]),
//        mini_y1 = d3.scale.sqrt()
//            .range([mini_height, 0]);
//
//    /* Create axes with above settings */
//    var main_xAxis = d3.svg.axis()
//            .scale(main_x)
//            .tickFormat(d3.time.format("%H:%M"))
//            .orient("bottom"),
//        mini_xAxis = d3.svg.axis()
//            .scale(mini_x)
//            .tickFormat(d3.time.format("%H:%M"))
//            .orient("bottom");
//
//    var main_yAxisLeft = d3.svg.axis()
//            .scale(main_y0)
//            .orient("left"),
//        main_yAxisRight = d3.svg.axis()
//            .scale(main_y1)
//            .orient("right");
//
//    /* Create brush */
//    var brush = d3.svg.brush()
//        .x(mini_x)
//        .on("brush", brush);
////
//    /* Define the way data are going to be shown (interpolate between points chosen here) */
//    var main_line0 = d3.svg.line()
//        .interpolate("monotone")
////        .interpolate("cardinal")
//        .x(function (d) {
////            console.log("x: "+ d[0]);
//            return main_x(d[0]);
//        })
//        .y(function (d) {
////            console.log("y: "+ d[1]);
//            return main_y0(d[1]);
//        });
//
//    var main_line1 = d3.svg.line()
//        .interpolate("monotone")
//        .x(function (d) {
//            return main_x(d[0]);
//        })
//        .y(function (d) {
//            return main_y1(d[1]);
//        });
//
//    var mini_line0 = d3.svg.line()
//        .x(function (d) {
//            return mini_x(d[0]);
//        })
//        .y(function (d) {
//            return mini_y0(d[1]);
//        });
//
//    var mini_line1 = d3.svg.line()
//        .x(function (d) {
//            return mini_x(d[0]);
//        })
//        .y(function (d) {
//            return mini_y1(d[1]);
//        });
//
//    /* Clean any previous svgs so that to prepare a new one */
//    if(d3.selectAll("svg")){
//        d3.selectAll("#timeSeriesChart svg").remove();
//    }
//    
//    /* Prepare a new svg */
//    var svg = d3.select("#timeSeriesChart").append("svg")
//        .attr("width", main_width + main_margin.left + main_margin.right)
//        .attr("height", main_height + main_margin.top + main_margin.bottom);
//
//    /* clipPath is the path from point to point */
//    svg.append("defs").append("clipPath")
//        .attr("id", "clip")
//        .append("rect")
//        .attr("width", main_width)
//        .attr("height", main_height);
//
//    /* Create groups to act upon collectively */
//    var main = svg.append("g")
//        .attr("transform", "translate(" + main_margin.left + "," + main_margin.top + ")");
//    /* Mini group (bottom brush) */
//    var mini = svg.append("g")
//        .attr("transform", "translate(" + mini_margin.left + "," + mini_margin.top + ")");
//
//    /* Retrieve temperature data from controller */
//    var timeSeriesURL = 'sensorDataForAsset';
//
//    /* All the magic happens here */
//    d3.json(timeSeriesURL, function (error, response) {
//        var data = response;
////        var beforeUTCmin = new Date(data.calendarList[0]);
////        minDate = new Date(beforeUTCmin.getTime() + beforeUTCmin.getTimezoneOffset() * 60000);
//        
//        /* Define min and max Dates */
//        var beforeUTCmin = new Date(data.assetsMetricTimeseries[0].metricTimeseries[0].timestamp);
//        minDate = new Date(beforeUTCmin.getTime() + beforeUTCmin.getTimezoneOffset() * 60000);
//
////        console.log(data.calendarList.length - 1);
//
////        var beforeUTCmax = new Date(data.calendarList[data.calendarList.length - 1]);
////        maxDate = new Date(beforeUTCmax.getTime() + beforeUTCmax.getTimezoneOffset() * 60000);
//        var metricTimeseriesLength = data.assetsMetricTimeseries[0].metricTimeseries.length;
//        var beforeUTCmax = new Date(data.assetsMetricTimeseries[0].metricTimeseries[metricTimeseriesLength - 1].timestamp);
//        maxDate = new Date(beforeUTCmax.getTime() + beforeUTCmax.getTimezoneOffset() * 60000);
//        
////        var yAxisType = data.metricTimeseriesResults[0].metricType;
//        var yAxisType = data.assetsMetricTimeseries[0].metricType;
//
//        /* Label y-axes. This requires a more intuitive approach for multidimensional data */
//        var yAxisLabel="";
//        if(yAxisType=="TEMPERATURE"){
//            yAxisLabel="Temperature (oC)";
//        }else{
//            yAxisLabel="Relative Humidity (%)";
//        }
//        
//        var yAxisLabel2 = "Relative Humidity (%)";
//        
////            var utc = new Date(minDate.getTime() + minDate.getTimezoneOffset() * 60000)
//        console.log(beforeUTCmin);
//        console.log(beforeUTCmax);
//
//        /* Format data accordingly; in a way that d3 and this implementation expects it */
//        var dataChartLeft = [];
//        $.each(data.assetsMetricTimeseries[0].metricTimeseries, function (index, value) {
////            console.log(value);
//            var beforeUTC = new Date(value.timestamp);
//            dataChartLeft.push([new Date(beforeUTC.getTime() + beforeUTC.getTimezoneOffset() * 60000), value.value]);
////            console.log(value.value);
//
//        });
//        
////        $.each(data.metricTimeseriesResults[0].entityMetricTimeseries[0].values, function (index, value) {
////            var beforeUTC = new Date(data.calendarList[index]);
////            dataChartLeft.push([new Date(beforeUTC.getTime() + beforeUTC.getTimezoneOffset() * 60000), value]);
////        });
//
//        //find metrictimeseries per type
////        var dataRightInit = data.metricTimeseriesResults[1];
////        $.each(data.metricTimeseriesResults, function(ind,value){
////            if(metric==value.metricType){
////                console.log(value.metricType);
////                dataRightInit = value;
////                return true;
////            }
////        });
//
//        var dataChartRight = [];
////        $.each(dataRightInit.entityMetricTimeseries[0].values, function (index, value) {
////            var beforeUTC = new Date(data.calendarList[index]);
////            dataChartRight.push([new Date(beforeUTC.getTime() + beforeUTC.getTimezoneOffset() * 60000), value]);
////        });
//
//        $.each(data.assetsMetricTimeseries[1].metricTimeseries, function (index, value) {
//            var beforeUTC = new Date(value.timestamp);
//            dataChartRight.push([new Date(beforeUTC.getTime() + beforeUTC.getTimezoneOffset() * 60000), value.value]);
////            console.log(value.value);
//=======

//function buildTimeSeriesChart(metric, metricLabel, starting, ending) {
function buildTimeSeriesChart() {
    var $containerWidth = $('#myTabContent'),
        width = $containerWidth.width();
    var $containerHeight = $('#timeSeriesChart'),
        height = $containerHeight.height() - 50;

//    var main_margin = {top: 20, right: 80, bottom: 100, left: 40},
    
    /* Define margins for main and brush frame */
    var main_margin = {top: 20, right: 80, bottom: 100, left: 80},
        mini_margin = {top: 480, right: 80, bottom: 20, left: 80},
        main_width = width - main_margin.left - main_margin.right,
        main_height = height - main_margin.top - main_margin.bottom,
        mini_height = height - mini_margin.top - mini_margin.bottom;

//    //CHANGE below
    
    /* Format x-axis values (dates) */
    var formatDate = d3.time.format("%m-%d %H:%M"),
        formatNum = d3.format(".1f"),
        parseDate = formatDate.parse,
        bisectDate = d3.bisector(function (d) {
            return d[0];
        }).left,
        formatOutput0 = function (d) {
            return formatDate(d[0]) + " [ " + formatNum(d[1]) + " ]";
        },
        formatOutput1 = function (d) {
            return formatDate(d[0]) + " [ " + formatNum(d[1]) + " ]";
        };

//    formatOutput0 = function(d) { return formatDate(d[0]) + " - " + d.Durchschn + " ms"; },
//        formatOutput1 = function(d) { return formatDate(d.Uhrzeit) + " - " + d.Anz; };

    var minDate = new Date(),
        maxDate = new Date();

    /* Scale axes appropriately (according to their frame's width/height) */
    var main_x = d3.time.scale()
            .range([0, main_width]),
        mini_x = d3.time.scale()
            .range([0, main_width]);

    var main_y0 = d3.scale.sqrt()
            .range([main_height, 0]),
        main_y1 = d3.scale.sqrt()
            .range([main_height, 0]),
        mini_y0 = d3.scale.sqrt()
            .range([mini_height, 0]),
        mini_y1 = d3.scale.sqrt()
            .range([mini_height, 0]);
    var main_y0 = d3.scale.sqrt()
    		.range([main_height, 0]),
		mini_y0 = d3.scale.sqrt()
		    .range([mini_height, 0]);

    
    /* Create axes with above settings */
    var main_xAxis = d3.svg.axis()
            .scale(main_x)
            .tickFormat(d3.time.format("%H:%M"))
            .orient("bottom"),
        mini_xAxis = d3.svg.axis()
            .scale(mini_x)
            .tickFormat(d3.time.format("%H:%M"))
            .orient("bottom");

    var main_yAxisLeft = d3.svg.axis()
            .scale(main_y0)
            .orient("left"),
        main_yAxisRight = d3.svg.axis()
            .scale(main_y1)
            .orient("right");
    var main_yAxisLeft = d3.svg.axis()
		    .scale(main_y0)
		    .orient("left");
    
    /* Create brush */
    var brush = d3.svg.brush()
        .x(mini_x)
        .on("brush", brush);
//
    /* Define the way data are going to be shown (interpolate between points chosen here) */
    var main_line0 = d3.svg.line()
        .interpolate("monotone")
//        .interpolate("cardinal")
        .x(function (d) {
//            console.log("x: "+ d[0]);
            return main_x(d[0]);
        })
        .y(function (d) {
//            console.log("y: "+ d[1]);
            return main_y0(d[1]);
        });

    var main_line1 = d3.svg.line()
        .interpolate("monotone")
        .x(function (d) {
            return main_x(d[0]);
        })
        .y(function (d) {
            return main_y1(d[1]);
        });

    var mini_line0 = d3.svg.line()
        .x(function (d) {
            return mini_x(d[0]);
        })
        .y(function (d) {
            return mini_y0(d[1]);
        });

    var mini_line1 = d3.svg.line()
        .x(function (d) {
            return mini_x(d[0]);
        })
        .y(function (d) {
            return mini_y1(d[1]);
        });

    /* Clean any previous svgs so that to prepare a new one */
    if(d3.selectAll("svg")){
        d3.selectAll("#timeSeriesChart svg").remove();
    }
    
    /* Prepare a new svg */
    var svg = d3.select("#timeSeriesChart").append("svg")
        .attr("width", main_width + main_margin.left + main_margin.right)
        .attr("height", main_height + main_margin.top + main_margin.bottom);

    /* clipPath is the path from point to point */
    svg.append("defs").append("clipPath")
        .attr("id", "clip")
        .append("rect")
        .attr("width", main_width)
        .attr("height", main_height);

    /* Create groups to act upon collectively */
    var main = svg.append("g")
        .attr("transform", "translate(" + main_margin.left + "," + main_margin.top + ")");
    /* Mini group (bottom brush) */
    var mini = svg.append("g")
        .attr("transform", "translate(" + mini_margin.left + "," + mini_margin.top + ")");

    /* Retrieve temperature data from controller */
//    var timeSeriesURL = 'sensorDataForAsset';
    console.log($('#assetForJs1').val())
    var assetKey = $('#assetForJs1').val();
    var metricType = $('#metricTypeForJs1').val();
    var timeSeriesURL = 'sensorDataForAsset?assetKey='+assetKey+'&'+"metricType="+metricType;

    /* Post the GUI object and wait for the callback */
//    d3.json(timeSeriesURL).post(timeSeriesChartGUI,d3Callback)
     
    /* All the magic happens here */   
    d3.json(timeSeriesURL, function (error, response) {
//    function d3Callback(error, response) {
        var data = response;
//        var beforeUTCmin = new Date(data.calendarList[0]);
//        minDate = new Date(beforeUTCmin.getTime() + beforeUTCmin.getTimezoneOffset() * 60000);
        
        /* Define min and max Dates */
        var beforeUTCmin = new Date(data.assetsMetricTimeseries[0].metricTimeseries[0].timestamp);
        minDate = new Date(beforeUTCmin.getTime() + beforeUTCmin.getTimezoneOffset() * 60000);

//        console.log(data.calendarList.length - 1);

//        var beforeUTCmax = new Date(data.calendarList[data.calendarList.length - 1]);
//        maxDate = new Date(beforeUTCmax.getTime() + beforeUTCmax.getTimezoneOffset() * 60000);
        var metricTimeseriesLength = data.assetsMetricTimeseries[0].metricTimeseries.length;
        var beforeUTCmax = new Date(data.assetsMetricTimeseries[0].metricTimeseries[metricTimeseriesLength - 1].timestamp);
        maxDate = new Date(beforeUTCmax.getTime() + beforeUTCmax.getTimezoneOffset() * 60000);
        
//        var yAxisType = data.metricTimeseriesResults[0].metricType;
        var yAxisType = data.assetsMetricTimeseries[0].metricType;

        /* Label y-axes. This requires a more intuitive approach for multidimensional data */
        var yAxisLabel="";
        if(yAxisType=="CO2_EMISSIONS"){
            yAxisLabel="CO2 Emissions";
        } else if  ( yAxisType == "ENERGY_CONSUMPTION" ){
            yAxisLabel="Total Energy Consumption";
        } else if ( yAxisType == "ENERGY_COST" ) {
            yAxisLabel="Energy Cost";
        } else {
            yAxisLabel=data.assetsMetricTimeseries[0].metricType;
        }
        
        var yAxisLabel2 = data.assetsMetricTimeseries[1].metricType;
        
//            var utc = new Date(minDate.getTime() + minDate.getTimezoneOffset() * 60000)
        console.log(beforeUTCmin);
        console.log(beforeUTCmax);

        /* Format data accordingly; in a way that d3 and this implementation expects it */
        var dataChartLeft = [];
        $.each(data.assetsMetricTimeseries[0].metricTimeseries, function (index, value) {
//            console.log(value);
            var beforeUTC = new Date(value.timestamp);
            dataChartLeft.push([new Date(beforeUTC.getTime() + beforeUTC.getTimezoneOffset() * 60000), value.value]);
            console.log(value.value);
            console.log(value.timestamp);

        });
        
//        $.each(data.metricTimeseriesResults[0].entityMetricTimeseries[0].values, function (index, value) {
//            var beforeUTC = new Date(data.calendarList[index]);
//            dataChartLeft.push([new Date(beforeUTC.getTime() + beforeUTC.getTimezoneOffset() * 60000), value]);
//        });

        //find metrictimeseries per type
//        var dataRightInit = data.metricTimeseriesResults[1];
//        $.each(data.metricTimeseriesResults, function(ind,value){
//            if(metric==value.metricType){
//                console.log(value.metricType);
//                dataRightInit = value;
//                return true;
//            }
//        });

        var dataChartRight = [];
//        $.each(dataRightInit.entityMetricTimeseries[0].values, function (index, value) {
//            var beforeUTC = new Date(data.calendarList[index]);
//            dataChartRight.push([new Date(beforeUTC.getTime() + beforeUTC.getTimezoneOffset() * 60000), value]);
//        });

        $.each(data.assetsMetricTimeseries[1].metricTimeseries, function (index, value) {
            var beforeUTC = new Date(value.timestamp);
            dataChartRight.push([new Date(beforeUTC.getTime() + beforeUTC.getTimezoneOffset() * 60000), value.value]);
            console.log(value.value);
            console.log(value.timestamp);
//>>>>>>> refs/heads/dev-review1
        });
        
        /* Handy d3 methods to define domain */
        var y1min = d3.min(dataChartRight, function (d) {
            return d[1];
        });
        var y1max = d3.max(dataChartRight, function (d) {
            return d[1];
        });
        var y0min = d3.min(dataChartLeft, function (d) {
            return d[1];
        });
        var y0max = d3.max(dataChartLeft, function (d) {
            return d[1];
        });
        main_x.domain([minDate, maxDate]);
//        main_y0.domain([y0min, y0max + (y0max / 18)]);
        main_y0.domain([y0min, y0max]);

//        main_y0.domain(d3.extent(dataChartLeft, function(d) { return d[1]}));
        //main_y0.domain([0.1, d3.max(data, function(d) { return d.Durchschn; })]);
//        main_y1.domain(d3.extent(dataChartRight, function(d) { return d[1]}));
//        main_y1.domain([y1min - (y1min / 4), y1max + (y1max / 4)]);
        main_y1.domain([y1min, y1max]);

        mini_x.domain(main_x.domain());
        mini_y0.domain(main_y0.domain());
        mini_y1.domain(main_y1.domain());

        /* Append all relevant classes and styles (styles, framing, etc. as defined in the calling jsp) 
         * 
         * d: main_lineX is important here, as it is the data with the appropriate method (interpolation) 
         * .call: calling the axis function */
        main.append("path")
            .datum(dataChartLeft)
            .attr("clip-path", "url(#clip)")
            .attr("class", "line line0")
            .attr("d", main_line0);

        main.append("path")
            .datum(dataChartRight)
            .attr("clip-path", "url(#clip)")
            .attr("class", "line line1")
            .attr("d", main_line1);

        main.append("g")
            .attr("class", "x axis")
            .attr("transform", "translate(0," + main_height + ")")
            .call(main_xAxis);

        main.append("g")
            .attr("class", "y axis axisLeft")
            .call(main_yAxisLeft)
            .append("text")
            .attr("transform", "rotate(-90)")
            .attr("y", 6)
            .attr("dy", ".71em")
            .style("text-anchor", "end")
            .text(yAxisLabel);

        main.append("g")
            .attr("class", "y axis axisRight")
            .attr("transform", "translate(" + main_width + ", 0)")
            .call(main_yAxisRight)
            .append("text")
            .attr("transform", "rotate(-90)")
            .attr("y", -12)
            .attr("dy", ".71em")
            .style("text-anchor", "end")
            .text(yAxisLabel2);

        mini.append("g")
            .attr("class", "x axis")
            .attr("transform", "translate(0," + mini_height + ")")
            .call(main_xAxis);

        mini.append("path")
            .datum(dataChartLeft)
            .attr("class", "miniLine line0")
            .attr("d", mini_line0);

        mini.append("path")
            .datum(dataChartRight)
            .attr("class", "miniLine line1")
            .attr("d", mini_line1);

        mini.append("g")
            .attr("class", "x brush")
            .call(brush)
            .selectAll("rect")
            .attr("y", -6)
            .attr("height", mini_height + 7);

        /* Define the attributes when mousemove is used (see function below) */
        var focus = main.append("g")
            .attr("class", "focus")
            .style("display", "none");

        // Anzeige auf der Zeitleiste
        focus.append("line")
            .attr("class", "x")
            .attr("y1", main_y0(0) - 6)
            .attr("y2", main_y0(0) + 6)

        // Anzeige auf der linken Leiste
        focus.append("line")
            .attr("class", "y0")
            .attr("x1", main_width - 6) // nach links
            .attr("x2", main_width + 6); // nach rechts

        // Anzeige auf der rechten Leiste
        focus.append("line")
            .attr("class", "y1")
            .attr("x1", main_width - 6)
            .attr("x2", main_width + 6);

        focus.append("circle")
            .attr("class", "y0")
            .attr("r", 4);

        focus.append("text")
            .attr("class", "y0")
            .attr("fill", "#4682B4")
            .attr("dy", "-1em");

        focus.append("circle")
            .attr("class", "y1")
            .attr("r", 4);

        focus.append("text")
            .attr("class", "y1")
            .attr("fill", "#CD5C5C")
            .attr("dy", "-1em");


        main.append("rect")
            .attr("class", "overlay")
            .attr("width", main_width)
            .attr("height", main_height)
            .on("mouseover", function () {
                focus.style("display", null);
            })
            .on("mouseout", function () {
                focus.style("display", "none");
            })
            .on("mousemove", mousemove);

        function mousemove() {
            var x0 = main_x.invert(d3.mouse(this)[0]),
                i = bisectDate(dataChartLeft, x0, 1),
                d0 = dataChartLeft[i - 1],
                d1 = dataChartLeft[i],
                d = x0 - d0 > d1 - x0 ? d1 : d0;
            var rx0 = main_x.invert(d3.mouse(this)[0]),
                ri = bisectDate(dataChartRight, x0, 1),
                rd0 = dataChartRight[i - 1],
                rd1 = dataChartRight[i],
                rd = rx0 - rd0 > rd1 - rx0 ? rd1 : rd0;
            focus.select("circle.y0").attr("transform", "translate(" + main_x(d[0]) + "," + main_y0(d[1]) + ")");
            focus.select("text.y0").attr("transform", "translate(" + (main_x(d[0]) - 120) + "," + main_y0(d[1]) + ")").text(formatOutput0(d));
            focus.select("circle.y1").attr("transform", "translate(" + main_x(d[0]) + "," + main_y1(rd[1]) + ")");
            focus.select("text.y1").attr("transform", "translate(" + (main_x(d[0]) + 10) + "," + main_y1(rd[1]) + ")").text(formatOutput1(rd));
            focus.select(".x").attr("transform", "translate(" + main_x(d[0]) + ",0)");
            focus.select(".y0").attr("transform", "translate(" + main_width * -1 + ", " + main_y0(d[1]) + ")").attr("x2", main_width + main_x(d[0]));
            focus.select(".y1").attr("transform", "translate(0, " + main_y1(rd[1]) + ")").attr("x1", main_x(d[0]));
        }
    });

    function brush() {
        main_x.domain(brush.empty() ? mini_x.domain() : brush.extent());
        main.select(".line0").attr("d", main_line0);
        main.select(".line1").attr("d", main_line1);
        main.select(".x.axis").call(main_xAxis);
    }
}
//};
