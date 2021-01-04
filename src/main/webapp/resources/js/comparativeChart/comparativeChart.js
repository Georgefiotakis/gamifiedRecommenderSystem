/**
 * Created by pandriopoulos on 1/13/15.
 */
var responseKPI;
var roomNodes;
var xData;
var xData_Objects;
var xData_ascend;
var xData_descend;
var xData_byId;
var xData_byType = [];
var boxPlotType;
var xAllData;
var previousPlotByStates=[{left:"none", right:"none"}];
var previousPlotByLabel=[{left:"none", right:"none"}];
var currentChartType;
var previousChartType;
var transitionTime = 350;

$(document).ready(function() {
    //    var windowHeight = $(window).innerHeight();
    //    $('#comparativeContent').css('height', windowHeight);
});

window.onload = function () {
    //    buildBubbleChart();
//    var portfolioURL = 'portfolioAnalysis';
//
//    //Call the first charts that will be shown
//    d3.json(portfolioURL, function (error, response) {
//        responseKPI = response;
//        roomNodes = response.kpiResultPointList;
//
//        if(response.dashboardDateForm.assetTypeForPortfolioAnalysis=="GREEN"){
//            plotByChart({'code':'l1', 'type':'bar', 'label':'None', 'metric':'GREEN'});
//
//        }else{
//            plotByChart({'code':'l1', 'type':'bar', 'label':'None', 'metric':'COST'});
//
//        }
//    });

    //Call the rest data for the rest charts.
//    var allPortfolioURL = 'portfolioAnalysisAllMetrics';
    var allPortfolioURL = 'getListOfAssetsForKeys';
    d3.json(allPortfolioURL, function (error, response) {
    	responseKPI=response;
//        roomNodes = response.kpiResultPointList;

        plotByChart({'code':'l1', 'type':'bar', 'label':'None', 'metric':'COST'});

//        if(response.dashboardDateForm.assetTypeForPortfolioAnalysis=="GREEN"){
//            plotByChart({'code':'l1', 'type':'bar', 'label':'None', 'metric':'GREEN'});
//
//        }else{
//            plotByChart({'code':'l1', 'type':'bar', 'label':'None', 'metric':'COST'});
//
//        }
    });
};


function plotByChart(field){

    //    if(field.code.substring(0, 1) == 'l'){
    //        $("#leftPlotByButton").html(field.label+' <span class="caret"></span>');
    //        previousPlotByStates[0].left = field.type;
    //        previousPlotByLabel[0].left = field.label;
    //    }
//    previousPlotByStates[0].left = 'bar';

//    if(field.code.substring(0, 1) == 'r'){
//        $("#rightPlotByButton").html(field.display+' <span class="caret"></span>');
//        previousPlotByStates[0].right = field.type;
//        previousPlotByLabel[0].right = field.label;
//    }

    console.log("Display Box Plot & Bubble");
    currentChartType='boxPlot';
    updateDataByFilters(field.metric);
    console.log("xData_byType before buildBoxplotChart(): "+xData_byType)
    buildBoxplotChart(xData_Objects);
    
    //    //Clear SVG
    //    if(currentChartType != null){
    //        d3.selectAll('svg').remove();
    //    }

//    if (previousPlotByStates[0].left == "bar" && previousPlotByStates[0].right == "bar"){
//        console.log("Display Bubble & Scatter");
//        currentChartType='scatter';
//        updateData(field.metric);
//        buildScatterChart();
//        var yAxisExist = d3.selectAll('g.y.axis');
//        if (yAxisExist[0].length < 1){
//            boxplot();
//        }
//    }else if (previousPlotByStates[0].left == "bar" && previousPlotByStates[0].right == "bubble"){
//        console.log("Display Box Plot & Bubble");
//        currentChartType='boxPlot';
//        updateDataByFilters(field.metric);
//        buildBoxplotChart();
//    }else if (previousPlotByStates[0].left == "bubble" && previousPlotByStates[0].right == "bubble"){
//        console.log("Display Bubble Double");
//        currentChartType='bubbleMulti';
//        buildBubbleChart(true, null);
//    }else if (previousPlotByStates[0].left == "bubble" && previousPlotByStates[0].right == "none"){
//        console.log("Display Bubble One");
//        currentChartType='bubbleOne';
//        buildBubbleChart(false, field.code);
//    }else if (previousPlotByStates[0].left == "none" && previousPlotByStates[0].right == "bubble"){
//        console.log("Display Bubble One");
//        currentChartType='bubbleOne';
//        buildBubbleChart(false, field.code);
//    }else if (previousPlotByStates[0].left == "bar" && previousPlotByStates[0].right == "none"){
//        console.log("Display Barchart");
//        currentChartType='barChart';
//        initializeGraphs();
//        buildBarChart();
//        boxplot();
//
//    }else if (previousPlotByStates[0].left == "none" && previousPlotByStates[0].right == "bar"){
//        console.log("Display Barchart");
//        currentChartType='barChart';
//        buildBarChart();
//    }

    previousChartType = currentChartType;
}

//function updateData(metricType){
////    if(xAllData != undefined && xAllData.length > 0){
//	if(xAllData != undefined && xAllData.energyConsumptionAssetKPIList.length > 0){
//        $.each(xAllData.energyConsumptionAssetKPIList,function(i, d){
//            if (metricType == d.assetKPIMetricType){
//                console.log("Data FROM: "+ d.assetKPIMetricType);
//
//                xData = d.assetKPIMetricPointList;
//                xData_descend = d3.nest()
//                    .key(function(d) { return d.sumAverageMetricValues; })
//                    .sortKeys(d3.descending)
//                    .entries(xData);
//
//                xData_byId = d3.nest()
//                    .key(function(d) { return d.assetId; })
//                    .sortKeys(d3.ascending)
//                    .entries(xData);
//
//                return false;
//            }
//        })
//    }else{
//        xData = responseKPI.assetKPIMetricPointList;
//
//        //        roomNodes.sort(d3.ascending);
//        xData_descend = d3.nest()
//            .key(function(d) { return d.sumAverageMetricValues; })
//            .sortKeys(d3.descending)
//            .entries(xData);
//
//        xData_byId = d3.nest()
//            .key(function(d) { return d.assetId; })
//            .sortKeys(d3.ascending)
//            .entries(xData);
//
//
//    }
//}

function updateDataByFilters(metricType){
    boxPlotType = metricType;
    
    xData_Objects = [];
//	var xData_byType = [];
	xData_byType[0] = [];
	xData_byType[1] = [];

	// add here the header
	xData_byType[0][0] = "Energy Consumption";
	
	xData_byType[0][1] = [];
	xData_byType[1][1] = [];
  
    if (metricType=="GREEN"){
    	xData_byType[1][0] = "CO2 Emissions";

    	responseKPI.energyConsumptionAssetKPIList.forEach(function (d) {
    		xData_byType[0][1].push(d.kpiMagnitudeIndicator)
    		
    	});
    	xData_Objects[0] = responseKPI.energyConsumptionAssetKPIList;
    	
    	responseKPI.co2EmissionsAssetKPIList.forEach(function (d) {
    		xData_byType[1][1].push(d.kpiMagnitudeIndicator)
    	});
    	xData_Objects[1] = responseKPI.co2EmissionsAssetKPIList;
    	
    }else if(metricType=="COST"){
    	xData_byType[1][0] = "Energy Cost";

    	responseKPI.energyConsumptionAssetKPIList.forEach(function (d) {
    		xData_byType[0][1].push(d.kpiMagnitudeIndicator)
    	});
    	xData_Objects[0] = responseKPI.energyConsumptionAssetKPIList;
    	responseKPI.energyCostAssetKPIList.forEach(function (d) {
    		xData_byType[1][1].push(d.kpiMagnitudeIndicator)
    	});
    	xData_Objects[1] = responseKPI.energyCostAssetKPIList;
    }   
    console.log("xData_byType inside updateDataByFilters() metricType: "+metricType)
    console.log("xData_byType inside updateDataByFilters(): "+xData_byType)

//    if (metricType=="GREEN"){
//        xData_byType = d3.nest()
//            .key(function(d) { return d.assetKey; })
//            .sortKeys(d3.ascending)
//            .entries(responseKPI.assetKPIMetricPointList);
//    }else if(metricType=="COST"){
//        xData_byType = d3.nest()
//            .key(function(d) { return d.cluster; })
//            .sortKeys(d3.ascending)
//            .entries(responseKPI.assetKPIMetricPointList);
//
//    }else{
//        xData_byType = d3.nest()
//            .key(function(d) { return d.assetType; })
//            .sortKeys(d3.ascending)
//            .entries(responseKPI.assetKPIMetricPointList);
//    }
//    if (metricType=="AREA"){
//        xData_byType = d3.nest()
//            .key(function(d) { return d.assetArea; })
//            .sortKeys(d3.ascending)
//            .entries(responseKPI.assetKPIMetricPointList);
//    }else if(metricType=="CLUSTER"){
//        xData_byType = d3.nest()
//            .key(function(d) { return d.cluster; })
//            .sortKeys(d3.ascending)
//            .entries(responseKPI.assetKPIMetricPointList);
//
//    }else{
//        xData_byType = d3.nest()
//            .key(function(d) { return d.assetType; })
//            .sortKeys(d3.ascending)
//            .entries(responseKPI.assetKPIMetricPointList);
//    }
}

/************** Clear ALL GRAPHS. **************/
function initializeGraphs(){
    d3.selectAll('svg').remove();
}
