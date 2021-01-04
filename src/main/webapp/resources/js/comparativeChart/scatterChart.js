/**
 * Created by pandriopoulos on 6/5/15.
 */
function buildScatterChart(){
    /******** Set dynamic width height ********/
    var $container = $('#comparativeChart'), // lets try directly the floor plan or with its class
        width = $container.width(),
        height = $container.height();

    /******** Set dynamic width height ********/
    var x = d3.scale.linear().range([0, (width-width*0.25)]);
    //    var y = d3.scale.linear().range([height, 0]);
    //    var x = d3.scale.ordinal().rangeRoundBands([0, width]);
    var y = d3.scale.linear().range([height/2, 0]);
    var leftPositionOffset=65;

    //getColorMap for rooms
    var roomTypeColor = roomTypeColorMap();

    // draw axis
    var rectXQ = d3.selectAll('rect#xq');
    if (rectXQ[0].length > 0){
        rectXQ.remove();
    }

    var rectXM = d3.selectAll('rect#xm');
    if (rectXM[0].length > 0){
        rectXM.remove();
    }

    var xAxisExist = d3.selectAll('g.x.axis');
    if (xAxisExist[0].length > 0){
        xAxisExist.remove();
    }

    var yAxisGroup = d3.selectAll('g.yAxisGroup');
    if (yAxisGroup[0].length > 0){
        yAxisGroup.remove();
        var yAxisGroupText = d3.selectAll('text');
        if(yAxisGroupText[0].length > 0){
            yAxisGroupText.remove();
        }
    }


    var xAxis = d3.selectAll('#mainGroup').append("g")
        .attr("class", "x axis")
        .attr("transform", "translate("+leftPositionOffset+"," + height + ")");
    var xAxisLabel = xAxis.append("text")
        .attr("class", "dimensionLabel")
        .attr("x", (width-width*0.25))
        .attr("y", -6)
        .style("text-anchor", "end");
    var xaLineMin = xAxis.append("line")
        .attr("y1", 0)
        .attr("y2", 0);
    var xaTextMin = xAxis.append("text")
        .attr("class", "axisValue")
        .attr("y", 17)
        .style("text-anchor", "end");
    var xaTextMax = xAxis.append("text")
        .attr("class", "axisValue")
        .attr("y", 17)
        .style("text-anchor", "middle");
    var xaLineQ = xAxis.append("line")
        .attr("y1", 0.5)
        .attr("y2", 0.5)
        .style("stroke-width", 3);
    var xaTextQ1 = xAxis.append("text")
        .attr("class", "axisValue")
        .attr("y", 30)
        .style("text-anchor", "middle");
    var xaTextQ3 = xAxis.append("text")
        .attr("class", "axisValue")
        .attr("y", 30)
        .style("text-anchor", "middle");
    var xaLineMed = xAxis.append("line")
        .attr("y1", 0.5)
        .attr("y2", 0.5)
        .style("stroke", "#fff")
        .style("stroke-width", 3);
    var xaTextMed = xAxis.append("text")
        .attr("class", "axisValue")
        .attr("y", 17);

    // gray zones X axis
    var grayRectXQ = d3.selectAll('#mainGroup').append("rect")
        .attr("y", -1)
        .attr("height", height)
        .style("fill", "#e1e1e1")
        .style("fill-opacity", 0.3);
    var grayRectXM = d3.selectAll('#mainGroup').append("rect")
        .attr("id", "lastGrayArea")
        .attr("y", -1)
        .attr("height", height)
        .style("fill", "#e1e1e1")
        .style("fill-opacity", 0.3);


    //prepare data for the y axis
    /******** Get only a map with the values from the kpiPointResults ********/
    var yData_asc = d3.nest()
        .key(function(d) { return d.average; })
        .sortKeys(d3.ascending)
        .entries(roomNodes);

    var kpiValuesArray = yData_asc.map(function(d){return eval(d.key)});
    y.domain([d3.min(kpiValuesArray),d3.max(kpiValuesArray)]);

    // prepare data for the x axis
    var xData = xData_descend;
    var xdataArray = xData.map(function(o){return eval(o.key)});
    xdataArray.sort(d3.ascending);
    var xDataAll = xData_descend;
    var xMed, yMed, xMin, yMin, xMax, yMax, xQ1, yQ1, xQ3, yQ3;

    console.log(xdataArray);
    xMin = d3.min(xdataArray);
    //    xMin = d3.min(xData, function(d){return d3.min(eval(d.key))})
    xMax = d3.max(xdataArray);
    xMed = d3.median(xdataArray);
    xQ1 = d3.quantile(xdataArray, 0.25);
    xQ3 = d3.quantile(xdataArray, 0.75);

    // axis scale domain. always use full dataset, to maintain the axis stable
    var xaGlobalMax = d3.max(xdataArray);

    x.domain([xMin,xaGlobalMax]);
//    x.domain([0,xaGlobalMax]);


    //update axis
    xAxisLabel
        .text(previousPlotByLabel[0].right);
    xaLineMin
        .transition().duration(transitionTime)
        .attr("x1", x(xMin))
        .attr("x2", x(xMax));
    xaTextMin
        .transition().duration(transitionTime)
        .attr("x", x(xMin))
        .text(formatNumZero(xMin));
    xaTextMax
        .transition().duration(transitionTime)
        .attr("x", x(xMax))
        .text(formatNumZero(xMax));
    xaLineQ
        .transition().duration(transitionTime)
        .attr("x1", x(xQ1))
        .attr("x2", x(xQ3));
    xaTextQ1
        .transition().duration(transitionTime)
        .attr("x", x(xQ1))
        .text(formatNumZero(xQ1));
    xaTextQ3
        .transition().duration(transitionTime)
        .attr("x", x(xQ3))
        .text(formatNumZero(xQ3));
    xaLineMed
        .transition().duration(transitionTime)
        .attr("x1", x(xMed)-1.5)
        .attr("x2", x(xMed)+1.5);
    xaTextMed
        .transition().duration(transitionTime)
        .attr("x", x(xMed))
        .text(formatNumZero(xMed));


    //update gray rectangles
    grayRectXQ
        .transition().duration(transitionTime)
        .attr("id",  "xq")
        .attr("x", x(xQ1)+0.5+leftPositionOffset)
        .attr("width", x(xMed) - x(xQ1)-1);
    grayRectXM
        .transition().duration(transitionTime)
        .attr("id",  "xm")
        .attr("x", x(xMed)+1.5+leftPositionOffset)
        .attr("width", x(xQ3) - x(xMed)-1.5);

    $('#xq').insertBefore('#bubbleGroup');
    $('#xm').insertBefore('#bubbleGroup');


    // redraw bubles to put them on top
    $('#bubbleGroup').insertAfter('#lastGrayArea');
    //    // position, size and color bubles
    //    var circles = d3.selectAll('.node')
    //        .data(xdataArray)
    ////            .data(xdataArray, function(d) {return d; })
    //        .transition().duration(transitionTime)
    //        .attr("cx", function(d) { return x(d)+leftPositionOffset; })
    ////        .attr("cy", function(d) { return _this.y(eval("d."+dimensions[1].code)); })
    //        .attr("r", 10)
    ////    .attr("r", sizeBubles)
    //        .style("fill", "#ff7f0e");

    var circles = d3.selectAll('circle');

    //    $.each(xData, function(e,o){
    //           var temp = o.values;
    circles.transition().duration(transitionTime)
        .attr("cx", function(d) {
            var selectedId = this.id;
            var returnedVal;
            $.each(xData_byId,function(d_index,d_Dat){
                if(d_Dat.key == selectedId){
                    returnedVal = x(d_Dat.values[0].sumAverageMetricValues)+leftPositionOffset;
                }
            });
            return returnedVal;
        })
        .attr("cy", function(d) {
            var selectedId = this.id;
            var returnedVal;
            $.each(roomNodes,function(d_index,d_Dat){
                if(d_Dat.assetId == selectedId){
                    console.log("Enter....");
                    returnedVal = y(d_Dat.average)+80;
                }
            });
            return returnedVal;
        })
        .attr("r", 10);
//        .style("fill", function (d) {
//            var selectedId = this.id;
//            var returnedCol;
//            $.each(xData_byId,function(d_index,d_Dat){
//                if(d_Dat.key == selectedId){
//                    returnedCol = roomTypeColor[d_Dat.values[0].assetType].color;
//                    return false;
//                }
//            });
//            return returnedCol;
////           return roomTypeColor[d.values[0].assetType].color;
//        });


    $('#bars').remove();


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
};

var formatNumZero = function (argument) {
    if(isNaN(argument)){
        return "";
    }
    else {
        if(argument>10){
            return formatNumExecuteY(argument);
        }
        else {
            return formatSmallNumExecuteY(argument);
        }
    }
};

var formatNumExecute = d3.format(",.1f");
var formatSmallNumExecute = d3.format(",.1f");

var formatNumExecuteY = d3.format(",.0f");
var formatSmallNumExecuteY = d3.format(",.0f");