/**
 * Created by pandriopoulos on 10/1/15.
 */
var w = 500,
    h = 500;


//var $container = $('#metricKPI'), // lets try directly the floor plan or with its class
//    w = $container.width(),
//    h = $container.height();

var colorscale = d3.scale.category10();

//TODO CHANGE THE FOLLOWING FOR KIVIAT METHOD in CONTROLLER
var assetKey = $('#assetForJs1').val();

var kiviaURL = 'assetKiviatChart?assetKey='+assetKey;

d3.json(kiviaURL, function (error, response) {
//    response.kiviatResults[0].name
//Legend titles
    var LegendOptions = ['Asset','Portfolio'];

//Data
    var d;

//    if(response.kiviatResults[0].nameKPI == "Energy Consumption Change"){
//        var val1 =response.kiviatResults[0].valueKPI;
//        if (val1 < 0 && val1 >= -2){
//            val1 = Math.abs(Math.abs(response.kiviatResults[0].valueKPI)-1);
//        }else if(val1 < 0 && val1 < -2){
//            val1 = -2;
//        }else if(val1 > 0 && val1 <=2){
//            val1 = 1+response.kiviatResults[0].valueKPI;
//            if (val1 > 2){
//                val1 = 2;
//            }
//        }else if(val1 > 0 && val1 > 2){
//            val1 = 2;
//        }else{
//            val1 = 1;
//        }
//        var val2=response.kiviatResults[1].valueKPI;
//        if (val2 < 0 && val2 >= -2){
//            val2 = Math.abs(Math.abs(response.kiviatResults[1].valueKPI)-1);
//        }else if(val2 < 0 && val2 < -2){
//            val2 = -2;
//        }else if(val2 > 0 && val2 <=2){
//            val2 = 1+response.kiviatResults[1].valueKPI;
//            if (val2 > 2){
//                val2 = 2;
//            }
//        }else if(val2 > 0 && val2 > 2){
//            val2 = 2;
//        }else{
//            val2 = 1;
//        }
//        var val3=response.kiviatResults[2].valueKPI;
//        if (val3 < 0 && val3 >= -2){
//            val3 = Math.abs(Math.abs(response.kiviatResults[2].valueKPI)-1);
//        }else if(val3 < 0 && val3 < -2){
//            val3 = -2;
//        }else if(val3 > 0 && val3 <=2){
//            val3 = 1+response.kiviatResults[2].valueKPI;
//            if (val3 > 2){
//                val3 = 2;
//            }
//        }else if(val3 > 0 && val3 > 2){
//            val3 = 2;
//        }else{
//            val3 = 1;
//        }
//
//        d = [
//            [
////                    response.kiviatResults[0].valueKPI<0?Math.abs(Math.abs(response.kiviatResults[0].valueKPI)-1):(1+response.kiviatResults[0].valueKPI)
//                {axis:"Energy Consumption Change",value:val1},
//                {axis:"Cost Energy Change",value:val2},
//                {axis:"CO2 Emissions Change",value:val3}
//
//            ],[
//                {axis:"Energy Consumption Change",value:1.0},
//                {axis:"Cost Energy Change",value:1.0},
//                {axis:"CO2 Emissions Change",value:1.0}
//            ]
//        ];
//    }else{
//
//        var val1 =response.kiviatResults[0].valueKPI;
//        if (val1 < 0 && val1 >= -2){
//            val1 = Math.abs(Math.abs(response.kiviatResults[0].valueKPI)-1);
//        }else if(val1 < 0 && val1 < -2){
//            val1 = -2;
//        }else if(val1 > 0 && val1 <=2){
//            val1 = 1+response.kiviatResults[0].valueKPI;
//            if (val1 > 2){
//                val1 = 2;
//            }
//        }else if(val1 > 0 && val1 > 2){
//            val1 = 2;
//        }else{
//            val1 = 1;
//        }
//        var val2=response.kiviatResults[1].valueKPI;
//        if (val2 < 0 && val2 >= -2){
//            val2 = Math.abs(Math.abs(response.kiviatResults[1].valueKPI)-1);
//        }else if(val2 < 0 && val2 < -2){
//            val2 = -2;
//        }else if(val2 > 0 && val2 <=2){
//            val2 = 1+response.kiviatResults[1].valueKPI;
//            if (val2 > 2){
//                val2 = 2;
//            }
//        }else if(val2 > 0 && val2 > 2){
//            val2 = 2;
//        }else{
//            val2 = 1;
//        }
//        var val3=response.kiviatResults[2].valueKPI;
//        if (val3 < 0 && val3 >= -2){
//            val3 = Math.abs(Math.abs(response.kiviatResults[2].valueKPI)-1);
//        }else if(val3 < 0 && val3 < -2){
//            val3 = -2;
//        }else if(val3 > 0 && val3 <=2){
//            val3 = 1+response.kiviatResults[2].valueKPI;
//            if (val3 > 2){
//                val3 = 2;
//            }
//        }else if(val3 > 0 && val3 > 2){
//            val3 = 2;
//        }else{
//            val3 = 1;
//        }

    console.log("Energy Consumption: "+response.assetKPIKiviatChartList[0].valueKPI);
    console.log(response.assetKPIKiviatChartList[1].valueKPI);
    console.log(response.assetKPIKiviatChartList[2].valueKPI);
    console.log("Energy Consumption: "+response.aggregatedKPIKiviatChartList[0].valueKPI);
    console.log(response.aggregatedKPIKiviatChartList[1].valueKPI);
    console.log(response.aggregatedKPIKiviatChartList[2].valueKPI);
    d = [
        [
            {axis:"Energy Consumption",value:response.assetKPIKiviatChartList[0].valueKPI},
            {axis:"CO2 Emissions",value:response.assetKPIKiviatChartList[1].valueKPI},
            {axis:"Energy Cost",value:response.assetKPIKiviatChartList[2].valueKPI}

        ],[
            {axis:"Energy Consumption",value:response.aggregatedKPIKiviatChartList[0].valueKPI},
            {axis:"CO2 Emissions",value:response.aggregatedKPIKiviatChartList[1].valueKPI},
            {axis:"Energy Cost",value:response.aggregatedKPIKiviatChartList[2].valueKPI}
        ]
    ];

    // Format the data according to max value set for kiviat below (=2)
//    dataListKPI = [];
//    var oo = 0;
//    for (var key in response.assetKPIKiviatChartList) {
//    	if ((Math.floor(response.assetKPIKiviatChartList[oo].valueKPI))>=1) {
//    		dataListKPI.push((Math.floor(response.assetKPIKiviatChartList[oo].valueKPI)*2.)+(response.assetKPIKiviatChartList[oo].valueKPI - Math.floor(response.assetKPIKiviatChartList[oo].valueKPI)));
//    	} else {
//    		dataListKPI.push((2.-(1.-(response.assetKPIKiviatChartList[oo].valueKPI - Math.floor(response.assetKPIKiviatChartList[oo].valueKPI)))));
//    	}
//    	oo++
//    }
//
//    dataListBaseline = [];
//    var oo = 0;
//    for (var key in response.aggregatedKPIKiviatChartList) {
//    	if ((Math.floor(response.aggregatedKPIKiviatChartList[oo].valueKPI)) >= 1) {
//    		dataListBaseline.push((Math.floor(response.aggregatedKPIKiviatChartList[oo].valueKPI)*2.)+(response.aggregatedKPIKiviatChartList[oo].valueKPI - Math.floor(response.aggregatedKPIKiviatChartList[oo].valueKPI)));
//    	} else {
//    		dataListBaseline.push((2.-(1.-(response.aggregatedKPIKiviatChartList[oo].valueKPI - Math.floor(response.aggregatedKPIKiviatChartList[oo].valueKPI)))));
//    	}
//    	oo++
//    }
//    console.log("dataListKPI[0]"+dataListKPI[0]);
//    console.log("dataListKPI[1]"+dataListKPI[1]);
//    console.log("dataListKPI[2]"+dataListKPI[2]);
//    console.log("dataListBaseline[0]"+dataListBaseline[0]);
//    console.log("dataListBaseline[1]"+dataListBaseline[1]);
//    console.log("dataListBaseline[2]"+dataListBaseline[2]);
//    d = [
//         [
//             {axis:"Energy Consumption",value:dataListKPI[0]},
//             {axis:"CO2 Emissions",value:dataListKPI[1]},
//             {axis:"Energy Cost",value:dataListKPI[2]}
//
//         ],[
//            {axis:"Energy Consumption",value:dataListBaseline[0]},
//            {axis:"CO2 Emissions",value:dataListBaseline[1]},
//            {axis:"Energy Cost",value:dataListBaseline[2]}      
//            ]
//     ];
    
//    }


//Options for the Radar chart, other than default
    var mycfg = {
        w: w,
        h: h,
        maxValue: 1,
        levels: 8,
        ExtraWidthX: 300
    };

//Call function to draw the Radar chart
//Will expect that data is in %'s
    RadarChart.draw("#kiviatChart", d, mycfg);

////////////////////////////////////////////
/////////// Initiate legend ////////////////
////////////////////////////////////////////

    var svg = d3.select('#kiviatChart')
        .selectAll('svg')
        .append('svg')
        .attr("width", w+700)
        .attr("height", h+300);

//Create the title for the legend
    var text = svg.append("text")
        .attr("class", "title")
        .attr('transform', 'translate(90,0)')
        .attr("x", w - 70)
        .attr("y", 10)
        .attr("font-size", "12px")
        .attr("fill", "#404040");
//    .text("What % of owners use a specific service in a week");

//Initiate Legend
    var legend = svg.append("g")
            .attr("class", "legend")
            .attr("height", 100)
            .attr("width", 200)
            .attr('transform', 'translate(0,20)')
        ;
//Create colour squares
    legend.selectAll('rect')
        .data(LegendOptions)
        .enter()
        .append("rect")
        .attr("x", w - 65)
        .attr("y", function(d, i){ return i * 20;})
        .attr("width", 10)
        .attr("height", 10)
        .style("fill", function(d, i){ return colorscale(i);})
    ;
//Create text next to squares
    legend.selectAll('text')
        .data(LegendOptions)
        .enter()
        .append("text")
        .attr("x", w - 52)
        .attr("y", function(d, i){ return i * 20 + 9;})
        .attr("font-size", "11px")
        .attr("fill", "#737373")
        .text(function(d) { return d; });

});