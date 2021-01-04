/**
 * Created by pandriopoulos on 6/10/15.
 */
function buildBoxplotChart(data){
    //remove xAxis, boxplot and RECTs shadows
//    var clusterName = clusterById();

    var rectArea = d3.selectAll('rect');
    if (rectArea[0].length > 0){
        rectArea.remove();
    }

    var xAxisExist = d3.selectAll('g.x.axis');
    if (xAxisExist[0].length > 0){
        xAxisExist.remove();
    }

    var yAxisExist = d3.selectAll('g.y.axis');
    if (yAxisExist[0].length > 0){
        yAxisExist.remove();
    }

    var yAxisGroupExist = d3.selectAll('g.yAxisGroup');
    if (yAxisGroupExist[0].length > 0){
        yAxisGroupExist.remove();
    }

    var xLabelTextExist = d3.selectAll('text.xLabelText');
    if (xLabelTextExist[0].length > 0){
        xLabelTextExist.remove();
    }

    var yaGlobalMax = null;
    var xDim = null;
    var yDim = null;
    var xLabels = [];
    //getColorMap for rooms
//    var roomTypeColor = roomTypeColorMap();
    //
    //    /******** Set dynamic width height ********/
    d3.select('#comparativeChart').select("svg").remove();
    
    var $container = $('#comparativeChart'), // lets try directly the floor plan or with its class
        width = $container.width(),
        height = $container.width();

    var svg = d3.select('#comparativeChart').append("svg")
	.attr("width", $container.width())
	.attr("height", $container.width())
	.attr("class", "box")    
	.append("g");
//	.attr("transform", "translate(" + margin.left + "," + margin.top + ")");

    var x = d3.scale.ordinal()
        .rangeBands([0,width]);

    var y = d3.scale.linear()
        .range([height/2, 0]);

    this.yAxisLabel = svg.append("text")
        .attr("class", "dimensionLabel")
        .attr("transform", "rotate(-90)")
        .attr("y", -70)
        .attr("x", -height/3)
        .attr("x", -height/3)
        .style("text-anchor", "end");

    var dataByType = xData_byType;
    console.log("xData_byType before setting labels"+xData_byType);

    var yArrayList = {};

    var xLabels = [];
    for (var index=0; index<dataByType.length; index++) {
    	console.log(dataByType[index][0]);
    	xLabels.push(dataByType[index][0])
    }
//    $.each(dataByType,function(index, obj) {
//        xLabels.push(obj[index][0]);
//    });
//    $.each(dataByType,function(index, obj) {
//        xLabels.push(obj.key);
//    });
    console.log(xLabels);

    console.log("dataByType after setting labels"+dataByType);

    for (var index=0; index<dataByType.length; index++) {
    	
//    $.each(dataByType,function(index, obj) {
        
    	var dataByTypeDisplay = dataByType[index][1];
//        var dataByTypeDisplayMap = dataByTypeDisplay.map(function(o){return eval(o.sumAverageMetricValues)});
     
//        var dataByTypeDisplayMap = dataByTypeDisplay.map(function(o){return eval(o.kpiMagnitudeIndicator)});
//        dataByTypeDisplayMap.sort(d3.ascending);
//    	dataByTypeDisplay.sort(d3.ascending);
    	yMin222 = d3.min(dataByTypeDisplay);
    	console.log("YMIN :"+yMin222);
        yMax = d3.max(dataByTypeDisplay);
//        if(this.yaGlobalMax == null || resetAxis){
//            yaGlobalMax = yMax;
//        }
        yaGlobalMax = yMax;
//        var currAssetId = obj.values[0].assetId;
//        var currAssetIdLength = currAssetId.length;
        var yArray=[];
        if(xLabels.length>1){
        	for (var indexDisplay=0; indexDisplay<dataByTypeDisplay.length; indexDisplay++) {
            	console.log("indexDisplay[indexDisplay]==>"+dataByTypeDisplay[indexDisplay]);
                yArray.push(dataByTypeDisplay[indexDisplay]);
        	}
//            $.each(dataByTypeDisplay, function(iterate, typeData){
//            	log.console("typeData[iterate]==>"+typeData[iterate]);
//                yArray.push(typeData[iterate]);
////                $.each(roomNodes,function(iter,nodeData){
////                    if(nodeData.assetId == typeData.assetId){
////        //                if(nodeData.assetId.substring(0,nodeData.assetId.length-1) == currAssetId.substring(0,currAssetIdLength-1)){
////                        yArray.push(nodeData.average);
////                    }
////
////                });
//            });
            yArray.sort(d3.ascending);
            console.log("-->"+yArray);
        }

//        if(xLabels.length == 1){
//            $.each(roomNodes,function(iter,nodeData){
//                yArray.push(nodeData.average);
//
//            });
//            yArray.sort(d3.ascending);
//            console.log("==>"+yArray);
//
//        }
        console.log("d3 min: "+d3.min(yArray));
        x.domain(xLabels);
        y.domain([d3.min(yArray),d3.max(yArray)]);
//        y.domain([0,10000])
        
        yArrayList[index] = {listArray:yArray}
//        if(boxPlotType=="AREA"){
//            yArrayList[dataByTypeDisplay[0].assetArea] = {listArray:yArray};
//        }else if(boxPlotType=="CLUSTER"){
//            yArrayList[dataByTypeDisplay[0].cluster] = {listArray:yArray};
//
//        }else{
//            yArrayList[dataByTypeDisplay[0].assetType] = {listArray:yArray};
//        }

        svg.append("text")
            .attr("x", x(dataByType[index][0])+180)
            .attr("y", 100)
            .attr("class", "xLabelText")
            .style("text-anchor", "middle")
            .style("font-weight", "bold")
            .text(dataByType[index][0]);

        console.log("boxplotType xLable: "+dataByType[index][0])
//        var yData = dataByTypeDisplayMap;
        var yData = yArray;
        if(yData.length>1){
            yMin = d3.min(yArray);
            yMax = d3.max(yArray);
            yMed = d3.median(yArray);
            yQ1 = d3.quantile(yArray, 0.25);
            yQ3 = d3.quantile(yArray, 0.75);

            //calc text labels y positions (avoid overlaps)
            var yMaxText = y(yMax)+3;
            var yQ3Text = shiftText(y(yQ3), yMaxText)+3;
            var yMedText = shiftText(y(yMed), yQ3Text)+3;
            var yQ1Text = shiftText(y(yQ1), yMedText)+3;
            var yMinText = shiftText(y(yMin), yQ1Text)+3;

            //draw plots
            var newGroup = svg.append("g")
                .attr("class","yAxisGroup")
                .attr("transform", "translate(180,0)");
            yaLineMin = newGroup.append("line")
                .style("stroke", "#000")
//                .attr("x1",  x(obj.key)+25.5)
//                .attr("x2",  x(obj.key)+25.5);
                .attr("x1",  x(dataByType[index][0])+25.5)
                .attr("x2",  x(dataByType[index][0])+25.5);
            yaTextMin = newGroup.append("text")
                .attr("font-size", "12")
                .attr("x",  x(dataByType[index][0])+30.0)
                .style("text-anchor", "start");
            yaTextMax = newGroup.append("text")
                .attr("font-size", "12")
                .attr("x",  x(dataByType[index][0])+30.0)
                .style("text-anchor", "start");
            yaLineQ = newGroup.append("line")
                .attr("x1", x(dataByType[index][0])+25 + 0.5)
                .attr("x2", x(dataByType[index][0])+25 + 0.5)
                .style("stroke", "#000")
                .style("stroke-width", 3);
            yaTextQ1 = newGroup.append("text")
                .attr("font-size", "12")
                .attr("x", x(dataByType[index][0])+30.0)
                .style("text-anchor", "start");
            yaTextQ3 = newGroup.append("text")
                .attr("font-size", "12")
                .attr("x", x(dataByType[index][0])+30.0)
                .style("text-anchor", "start");
            yaLineMed = newGroup.append("line")
                .attr("x1", x(dataByType[index][0])+25 + 0.5)
                .attr("x2", x(dataByType[index][0])+25 + 0.5)
                .style("stroke", "#fff")
                .style("stroke-width", 3);
            yaTextMed = newGroup.append("text")
                .attr("font-size", "12")
                .attr("x", x(dataByType[index][0])+30.0)
                .style("text-anchor", "start");

            yaLineMin
                .attr("y1", y(yMin)+150)
                .attr("y2", y(yMax)+150);
            yaTextMin
                .attr("y", yMinText+150)
                .text(formatNum(yMin));
            yaTextMax
                .attr("y", yMaxText+150)
                .text(formatNum(yMax));
            yaLineQ
                .attr("y1", y(yQ1)+150)
                .attr("y2", y(yQ3)+150);
            yaTextQ1
                .attr("y", yQ1Text+150)
                .text(formatNum(yQ1));
            yaTextQ3
                .attr("y", yQ3Text+150)
                .text(formatNum(yQ3));
            yaLineMed
                .attr("y1", y(yMed)+150-1.5)
                .attr("y2", y(yMed)+150+1.5);
            yaTextMed
                .attr("y", yMedText+150)
                .text(formatNum(yMed));
        }
        //case only 1 buble for the category
        else {
            yMed = d3.median(yData);
            var newGroup = svg.append("g")
                .attr("class","yAxisGroup")
                .attr("y", -20);
            yaTextMed = newGroup.append("text")
                .attr("font-size", "12")
                .attr("x",  x(dataByType[index][0])+30.0)
                .style("text-anchor", "start");
            yaTextMed
                .attr("y", y(yMed)+150+3)
                .text(formatNum(yMed));
        }
        
        //the following is not working, this is not a proper way to set up a multi-dim variable in javascript.
//        var circleData = new Array(xData_Objects[index].length);
//        for(var circleData = [];circleData.length < xData_Objects[index].length; circleData.push([])); 
//        
//        for (var j=0; j<xData_Objects[index].length;j++) {
////        	circleData[j] = new Array(2);
////        	circleData[j][0] = [];
////        	circleData[j][1] = [];
//        	console.log("x point on domain: "+x(dataByType[index][0])+180)
//        	circleData[j][0] = (x(dataByType[index][0]) + 180);
//        	console.log("xData_Objects[index][j].kpiMagnitudeIndicator: "+xData_Objects[index][j].kpiMagnitudeIndicator)
//        	circleData[j][1] = (y(xData_Objects[index][j].kpiMagnitudeIndicator) + 180);
//	
//		}
//        console.log("y domain: "+y.domain[0])
//        
//        console.log("circleData[1][0] "+circleData[4][0]);
//        console.log("circleData[1][1] "+circleData[4][1]);
//        console.log("circleData[1][0] "+circleData[2][0]);
//        console.log("circleData[1][1] "+circleData[2][1]);
//
////        for (var j=0; j<xData_Objects[index].length;j++) {
////        	circleData.push([(x(dataByType[index][0]) + 180), (y(xData_Objects[index][j].kpiMagnitudeIndicator) + 180)]);
////	
////		}
//        console.log("circleData: "+circleData);
//        globalCircles[index] = circleData;
//        var newGroupCircles = svg.append("g")
//        .attr("class","circle");
        var colorMap = colorMapByType();
        var className = dataByType[index][0].replace(/ /g,"_");
        console.log("classname: "+className);
        console.log("yaGlobalMax :"+yaGlobalMax);
        y.domain([0,yaGlobalMax]);
        var gCircle = svg.append("g")
              .attr("class", String(className));
//        gCircle.selectAll("circle")
//             .data(xData_Objects[index])
//             .enter()
//             .append("circle");
        
        var circles = gCircle.selectAll("circle").filter("."+String(className))
	      	.data(xData_Objects[index])
	      	.enter()
        	.append("circle")
        	.attr("stroke", "black")
	  		.attr("cx", function(d) {
//	  		return (x(dataByType[index][0]) + 180);
	  		return (x(d.metricType) + 180);
	  	})
	  	.attr("cy", function(d) {
	  		console.log("yyy(kpi)--> "+d.kpiMagnitudeIndicator+", "+y(d.kpiMagnitudeIndicator));
	  		return (y(d.kpiMagnitudeIndicator) + 180);
	
	  	})
	  	.attr("r", 10)
	//  	.enter()
	  	.style("fill", function(d) {
//	  		return colorMap[d.assetType].color;
	  		return colorMap;
	  	});
        	

        
        	
    };

    console.log(xData_Objects);
    	
//    var circles = d3.selectAll("circle")
//        .transition().duration(transitionTime)
//        .attr("cx", function (d, i) {
//            var circleId = this.id;
//            var xVal;
//            $.each(dataByType, function (i, d) {
//                var dv = d.values;
//                $.each(dv, function (j, e) {
//                    if (e.assetId == circleId) {
//                        if(boxPlotType=="AREA"){
//                            xVal = x(e.assetArea) + 180;
//
//                        }else if(boxPlotType=="CLUSTER"){
//                            xVal = x(e.cluster) + 180;
//
//                        }else{
//                            xVal = x(e.assetType) + 180;
//                        }
//                        return false;
//                    }
//                });
//            });
//            return xVal;
//        })
//        .attr("cy", function (d, i) {
//            var circleId = this.id;
//            var yVal;
//
//            var currAssetId = d.assetId;
//            var currAssetIdLength = currAssetId.length;
//            var yArray = [];
//
//            if(xLabels.length>1){
//                $.each(roomNodes,function(iter,nodeData){
//                    if(nodeData.assetId.substring(0,nodeData.assetId.length-1) == currAssetId.substring(0,currAssetIdLength-1)){
//                        yArray.push(nodeData.average);
//                    }
//
//                });
//
//                yArray.sort(d3.ascending);
//                console.log(yArray);
//            }
//
//            if(xLabels.length == 1){
//                $.each(roomNodes,function(iter,nodeData){
//                    yArray.push(nodeData.average);
//
//                });
//                yArray.sort(d3.ascending);
//                console.log(yArray);
//            }

//            var yArray = [];
//            var yArrayListKey;
//            
//            $.each(dataByType, function (i, k) {
//                var dv = k.values;
//                var dt = k.key;
//                $.each(dv, function (j, x) {
//                    var found = false;
//                    if (x.assetId == d.assetId) {
//                        yArrayListKey = dt;
//                        found = true;
//                    }
//
//                    if (found) return false;
//
//                });
//            });
//            yArray = yArrayList[yArrayListKey].listArray;
//
//            y.domain([d3.min(yArray),d3.max(yArray)]);


//
//            $.each(dataByType, function (i, d) {
////                var dataByTypeDisplay = d.values;
////                var dataByTypeDisplayMap = dataByTypeDisplay.map(function(o){return eval(o.sumAverageMetricValues)});
////                dataByTypeDisplayMap.sort(d3.ascending);
////                yMax = d3.max(dataByTypeDisplayMap);
////                if(this.yaGlobalMax == null || resetAxis){
////                    yaGlobalMax = yMax;
////                }
////                y.domain([0,yaGlobalMax]);
//
//                var dv = d.values;
//                $.each(dv, function (j, e) {
//                    $.each(roomNodes,function(k,l){
//
//                        if (e.assetId == circleId && l.assetId == e.assetId) {
////                        yVal = y(e.sumAverageMetricValues)+150;'
//                            yVal = y(l.average)+150;
////                        console.log("ID: "+e.assetId+" Y: "+yVal)
//                            return false;
//                        }
//                    })
//                });
//            });
//            return yVal;

//        })
//        .attr("r", 10);
//        .style("fill", function (d) {
//            var circleId = this.id;
//            var colorVal;
//            $.each(dataByType, function (i, d) {
//                var dv = d.values;
//                $.each(dv, function (j, e) {
//                    if (e.assetId == circleId) {
//                        if(boxPlotType=="AREA"){
//                            colorVal = roomTypeColor[e.assetArea].color;
//
//                        }else if(boxPlotType=="CLUSTER 1"){
//                            colorVal = roomTypeColor[e.cluster].color;
//                        }else{
//                            colorVal = roomTypeColor[e.assetType].color;
//                        }
//                        return false;
//                    }
//                });
//            });
//            return colorVal;
//
//        });


}

function shiftText(pos, prevTextPos) {
    if(prevTextPos>pos-10){
        return pos + (10 - (pos- prevTextPos) );
    }
    else {
        return pos;
    }
}

var formatNum = function (argument) {
    if(isNaN(argument)){
        return "";
    }
    else {
        if(argument>10){
            return formatNumExecute(argument);
        }
        else {
            return formatSmallNumExecute(argument);
        }
    }
}

//function colorMapByType(){
//    var colorMap = {
//        "Residential":{color:"#1EDB17"},
//        "Commercial":{color:"#b2df8a"},
//        "Industrial":{color:"#fdbf6f"},
//        "Other":{color:"#ffff99"},
//    };
//    return colorMap;
//}
function colorMapByType(){
    var colorMap = "#1EDB17";
    return colorMap;
}

var formatNumExecute = d3.format(",.1f");
var formatSmallNumExecute = d3.format(",.1f");