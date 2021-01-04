/**
 * Created by pandriopoulos on 6/5/15.
 */
function boxplot(){
    var yaGlobalMax = null;
    var xDim = null;
    var yDim = null;
    var xLabels = [];
//
//    /******** Set dynamic width height ********/
    var $container = $('#comparativeChart'), // lets try directly the floor plan or with its class
        width = $container.width(),
        height = $container.height();
//
//    this.x = d3.scale.ordinal()
//        .rangeBands([0,width]);
//    this.y = d3.scale.linear()
//        .range([height, 0]);
//
//    this.yAxisLabel = d3.selectAll('#mainGroup').append("text")
//        .attr("class", "dimensionLabel")
//        .attr("transform", "rotate(-90)")
//        .attr("y", -70)
//        .attr("x", -height/3)
//        .style("text-anchor", "end");

    this.yaGlobalMax = null;
    this.yDim = null;
    this.y = d3.scale.linear()
        .range([height/2, 0]);

    this.yAxis = d3.selectAll('#mainGroup').append("g")
        .attr("transform", "translate(45,80)")
        .attr("class", "y axis");
    this.yAxisLabel = this.yAxis.append("text")
        .attr("class", "dimensionLabel")
        .attr("transform", "rotate(-90)")
        .attr("y", 16)
        .style("text-anchor", "end");
    this.yaLineMin = this.yAxis.append("line")
        .attr("x1", 0)
        .attr("x2", 0);
    this.yaTextMin = this.yAxis.append("text")
        .attr("class", "axisValue")
        .attr("x", -6)
        .style("text-anchor", "end");
    this.yaTextMax = this.yAxis.append("text")
        .attr("class", "axisValue")
        .attr("x", -6)
        .style("text-anchor", "end");
    this.yaLineQ = this.yAxis.append("line")
        .attr("x1", 0.5)
        .attr("x2", 0.5)
        .style("stroke-width", 3);
    this.yaTextQ1 = this.yAxis.append("text")
        .attr("class", "axisValue")
        .attr("x", -6)
        .style("text-anchor", "end");
    this.yaTextQ3 = this.yAxis.append("text")
        .attr("class", "axisValue")
        .attr("x", -6)
        .style("text-anchor", "end");
    this.yaLineMed = this.yAxis.append("line")
        .attr("x1", 0.5)
        .attr("x2", 0.5)
        .style("stroke", "#fff")
        .style("stroke-width", 3);
    this.yaTextMed = this.yAxis.append("text")
        .attr("class", "axisValue")
        .attr("x", -6)
        .style("text-anchor", "end");

    this.grayRectYQ = d3.selectAll('#mainGroup').append("rect")
        .attr("transform", "translate(65,80)")
        .attr("x", 2)
        .attr("width", width)
        .style("fill", "#e1e1e1")
        .style("fill-opacity", 0.3);
    this.grayRectYM = d3.selectAll('#mainGroup').append("rect")
        .attr("transform", "translate(65,80)")
        .attr("x", 2)
        .attr("width", width)
        .style("fill", "#e1e1e1")
        .style("fill-opacity", 0.3);

    /******** Get only a map with the values from the kpiPointResults ********/
    var kpiValuesArray = roomNodes.map(function(d){return eval(d.average)});
    kpiValuesArray.sort(d3.ascending);

    yMin = d3.min(kpiValuesArray);
    yMax = d3.max(kpiValuesArray);
    yMed = d3.median(kpiValuesArray);
    yQ1 = d3.quantile(kpiValuesArray, 0.25);
    yQ3 = d3.quantile(kpiValuesArray, 0.75);

    if(yaGlobalMax == null ){
        console.log("---"+yMax);
        yaGlobalMax = yMax;
    }
    y.domain([yMin,yaGlobalMax]);

    //calc text labels y positions (avoid overlaps)
    var yMaxText = y(yMax);
    var yQ3Text = shiftText(y(yQ3), yMaxText);
    var yMedText = shiftText(y(yMed), yQ3Text);
    var yQ1Text = shiftText(y(yQ1), yMedText);
    var yMinText = shiftText(y(yMin), yQ1Text);

    // axis
    var selectedKPI = responseKPI.selectedKPI;
    var selectedCategory = responseKPI.assetKPIMetricType;
    var textLab;
    if(selectedCategory=='ENERGY_CONSUMPTION'){
        if(selectedKPI == 1){
            textLab="Energy Consumption Change (%)";
        }else if(selectedKPI == 2){
            textLab="CO2 Emissions Change (%)";
        }else if(selectedKPI == 3){
            textLab="Energy Cost Change (%)";
        }
    }

    if(selectedCategory=='ENERGY_PRODUCTION'){
        if(selectedKPI == 1){
            textLab="Energy Production Change (%)";
        }else if(selectedKPI == 2){
            textLab="Energy Production Change (%)";
        }else if(selectedKPI == 3){
            textLab="Energy Production Change (%)";
        }
    }

    this.yAxisLabel
        .text(textLab);
    this.yaLineMin
        .attr("y1", y(yMin))
        .attr("y2", y(yMax));
    this.yaTextMin
        .attr("y", yMinText)
        .text(formatNum(yMin));
    this.yaTextMax
        .attr("y", yMaxText)
        .text(formatNum(yMax));
    this.yaLineQ
        .attr("y1", y(yQ1))
        .attr("y2", y(yQ3));
    this.yaTextQ1
        .attr("y", yQ1Text)
        .text(formatNum(yQ1));
    this.yaTextQ3
        .attr("y", yQ3Text)
        .text(formatNum(yQ3));
    this.yaLineMed
        .attr("y1", this.y(yMed)-1.5)
        .attr("y2", this.y(yMed)+1.5);
    this.yaTextMed
        .attr("y", yMedText)
        .text(formatNum(yMed));

    this.grayRectYQ
        .attr("id",  "yq")
        .attr("y",  this.y(yQ3))
        .attr("height", this.y(yMed) - this.y(yQ3) -1.5);
    this.grayRectYM
        .attr("id",  "ym")
        .attr("y",  this.y(yMed) + 1)
        .attr("height", this.y(yQ1) - this.y(yMed) - 1.5);

    $('#yq').insertBefore('#bubbleGroup');
    $('#ym').insertBefore('#bubbleGroup');


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

var formatNumExecute = d3.format(",.1f");
var formatSmallNumExecute = d3.format(",.1f");