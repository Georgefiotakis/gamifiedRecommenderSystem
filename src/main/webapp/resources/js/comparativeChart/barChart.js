/**
 * Created by pandriopoulos on 1/28/15.
 */
function nameById(){
    var name={
        "etra-id.com/Besos/BcnBuildings/0156/C1":{name:"Biblioteca Collserola"},
        "etra-id.com/Besos/BcnBuildings/0175/C1":{name:"CEIP Pau Vila"},
        "etra-id.com/Besos/BcnBuildings/0158/C1":{name:"Biblioteca Francesc Candel"},
        "etra-id.com/Besos/BcnBuildings/0160/C1":{name:"Seu Districte Sants"},
        "etra-id.com/Besos/BcnBuildings/0161/C1":{name:"Seu Districte Sarria"},
        "etra-id.com/Besos/BcnBuildings/0162/C1":{name:"Seu Districte Sant Andreu"},
        "etra-id.com/Besos/BcnBuildings/0163/C1":{name:"Seu Districte Gracia"},
        "etra-id.com/Besos/BcnBuildings/0174/C1":{name:"Palau de Foronda"},
        "etra-id.com/Besos/BcnSodexoBuildings/CapCervello/General":{name:"Cap Cervello"},
        "etra-id.com/Besos/BcnSodexoBuildings/Filmoteca/General":{name:"Filmoteca"},
        "etra-id.com/Besos/BcnSodexoBuildings/IesCanMargarit/General":{name:"Ies Can Margarit"},
        "etra-id.com/Besos/BcnSodexoBuildings/Infraestructures/General":{name:"Infraestructures"},
        "etra-id.com/Besos/BcnSodexoBuildings/CapGracia/General":{name:"Cap Gracia"},
        "etra-id.com/Besos/BcnSodexoBuildings/IesTuro/General":{name:"Ies Turo"},
        "etra-id.com/Besos/BcnSodexoBuildings/EoiSabadell/General":{name:"EOI Sabadell"},
        "etra-id.com/Besos/BcnSodexoBuildings/IesSantEsteve/General":{name:"Ies Sant Esteve"},
        "etra-id.com/Besos/BcnPowerPlant/PvPanel1":{name:"Pv Panel 1"},
        "etra-id.com/Besos/BcnPowerPlant/Windmill1":{name:"Windmill 1"},
        "etra-id.com/Besos/BcnPowerPlant/Windmill2":{name:"Windmill 2"},
        "com.cobra.besos.ems/COBRA/VIUDO/WF_VIUDO":{name:"VIUDO"},
        "root/pt.ptinovacao.m2m.besos/buildings/709/2982":{name:"Campo Grande"},
        "root/pt.ptinovacao.m2m.besos/buildings/330/1090":{name:"Olivais School"},
        "root/pt.ptinovacao.m2m.besos/buildings/330/4492":{name:"Olivais School"},
        "root/pt.ptinovacao.m2m.besos/buildings/861/3811":{name:"DRMM"},
        "com.cobra.besos.ems/COBRA/MONTEGORDO/WF_MONTEGORDO":{name:"Montegordo"},
        "TuLisbon/PowerPlant/1001440001861":{name:"TU Lisbon"},
        "etra-id.com/Besos/BcnElectricVehicle/PRC1/SRC101":{name:"EV Point A"},
        "etra-id.com/Besos/BcnElectricVehicle/PRC2/SRC202":{name:"EV Point A"},
        "etra-id.com/Besos/BcnElectricVehicle/PRC3/SRC302":{name:"EV Point C"},
        "etra-id.com/Besos/BcnElectricVehicle/PRC6/SRC601":{name:"EV Point D"},
        "etra-id.com/Besos/BcnElectricVehicle/PRC6/SRC602":{name:"EV Point E"},
        "etra-id.com/Besos/BcnPublicLighting/?CSE21/1/L":{name:"10264 Pamblona Str"},
        "etra-id.com/Besos/BcnPublicLighting/?CSE21/2/L":{name:"10106 Pamblona Str"},
        "etra-id.com/Besos/BcnPublicLighting/?CSE21/4/L":{name:"10264 Pamblona Str"},
        "etra-id.com/Besos/BcnPublicLighting/?CSE21/5/L":{name:"10106 Pamblona Str"}

    };
    return name;
}

function buildBarChart(){
    var roomTypeColor = roomTypeColorMap();
    var friendlyName = nameById();

    //Check and stop any force layout
    if(force){
        force.stop();
    }

    if(forceUpdate){
        forceUpdate.stop();
    }

    if(d3.select("#bars")){
        d3.select("#bars").remove();
    }

    /******** Set dynamic width height ********/
    var $container = $('#comparativeChart'), // lets try directly the floor plan or with its class
        width = $container.width(),
        height = $container.height();

    /******** Set dynamic width height ********/
    var x = d3.scale.ordinal().rangeRoundBands([0, width], .05);
    var y = d3.scale.linear().range([height/2, 0]);
//    var y = d3.scale.linear().range([height, 0]);

    /******** Get only a map with the values from the kpiPointResults ********/
    var yData_asc = d3.nest()
        .key(function(d) { return d.average; })
        .sortKeys(d3.ascending)
        .entries(roomNodes);

    var kpiValuesArray = yData_asc.map(function(d){return eval(d.key)});
//    kpiValuesArray.sort(d3.ascending);
    console.log(kpiValuesArray);


    /******** Set domain x & y following the x,y data of the barCharts. ********/
    x.domain(d3.extent(kpiValuesArray.length, function (d) {
        return d.x;
    }));

//    y.domain([d3.min(roomNodes, function (d) {return d}),d3.max(roomNodes, function (d) {return d})+1]);
//    y.domain([0,d3.max(roomNodes, function (d) {return d})+1]);
//        y.domain([0,0.9]);
    y.domain([d3.min(kpiValuesArray),d3.max(kpiValuesArray)]);


    //Get existed SVG areas
    var existedChart = d3.selectAll('svg');

    //If not then create a new one
    if(existedChart[0].length == 0){
        console.log("enter");
        existedChart = d3.select("#comparativeChart").append("svg")
            .attr("width", '100%')
            .attr("height", '100%')
            .attr('viewBox', '0 0 ' + (width-(width*0.1)) + ' ' + (Math.min(width, height)))
//            .attr('viewBox', '0 0 ' + Math.min(width, height) + ' ' + Math.min(width, height))
            .attr('preserveAspectRatio', 'xMinYMin')
            .append("g")
            .attr("id","mainGroup")
            .attr("transform", "translate(" + 10 + ",-" + height/8+ ")");
//.attr("transform", "translate(-" + (width / 4 - 40) + ",-" + height / 6 + ")");
    }

    var existedTexts = d3.selectAll('.categoryText').remove();

    //set barWidth
    var barWidth = 25;
    if(kpiValuesArray.length>20){
        barWidth = (width-20)/kpiValuesArray.length;
    }

    //set constant bar height offset value
    var smallerBarBy = 80;
    var quarterWidth = width/4;

    var barsGroup;

    if (existedChart.selectAll("#mainGroup")[0].length == 0){
        barsGroup = existedChart.append("g")
            .attr("id", "bars")
            .attr("transform", "translate(" + (quarterWidth/4) + "," + (smallerBarBy*2) + ")");

        var roomNodeGroup = existedChart.append("g")
            .attr("id", "bubbleGroup");
        var circleCounter = 0;
        var roomNode = roomNodeGroup.selectAll("circle");
        $.each(yData_asc, function(o,e){
            var tempDat = e.values;
            console.log(o+" $$$: "+circleCounter);

            roomNode.data(tempDat)
                .enter().append("circle")
                .attr("class", "node")
                .attr("id", function(d){ return d.assetId})
                .transition().duration(transitionTime)
                .delay(function(d, i) {return o/yData_asc.length*500;})
                .attr("r", 10)
                .attr("cx", function(d) {
                    circleCounter = circleCounter+1;
                    return (barWidth*(circleCounter))+(quarterWidth/4 );
                })
                .attr("cy", function(d) { return y(d.average)+smallerBarBy; })
                .style("stroke","black")
                .style("stroke-width","0.5px")
                .style("fill-opacity",0.5)
                .style("fill", function(d){
                    var col;
                    $.each(responseKPI.assetKPIMetricPointList,function(iter,nodeData){
                        if(nodeData.assetId == d.assetId){
                            col = roomTypeColor[nodeData.assetType].color;
                            return false;
                        }
                    });
                    return col;
                });

        });
    }else{
        barsGroup = existedChart.selectAll("#mainGroup").append("g")
            .attr("id", "bars")
            .attr("transform", "translate(" + (quarterWidth/4) + "," + (smallerBarBy*2) + ")");
    }
    console.log(kpiValuesArray);

    //create also the bars
    var barCounter = 0;
    var bars = barsGroup.selectAll("bar");
    $.each(yData_asc, function(o,e){
        var tempData = e.values;
        bars.data(tempData)
            .enter().append("rect")
            .style("fill", function(d){
                var col;
                $.each(responseKPI.assetKPIMetricPointList,function(iter,nodeData){
                    if(nodeData.assetId == d.assetId){
                        col = roomTypeColor[nodeData.assetType].color;
                        return false;
                    }
                });
                return col;
            })
            .style("fill-opacity", 0.3)
            .transition().duration(transitionTime)
            .delay(function(d, i) {return o/yData_asc.length*500;})
            .attr("x", function(d, i) {
                barCounter = barCounter+1;
                return barWidth*(barCounter) - 10;
            })
            .attr("width", 20)
            .attr("y", function(d) { return (y(d.average))-(smallerBarBy)+10; })
            .attr("height", function(d) {
                //          console.log(height/2 - y(d*10)-smallerBarBy)
                return height - y(d.average); });
        //        .attr("height", function(d) {
        //              console.log("!: "+y(d))
        //            return y(d);
        //        });
    });

    var circlesTooltip = d3.selectAll('circle')
        .on("mouseover", function(d, i) {buildTooltip(this)})
        .on("mouseout", function(d, i) { $("#tooltip").hide();});
//    var circles = d3.selectAll('circle')
//        .transition().duration(1500)
//        .delay(function(d, i) {return i/roomNodes.length*500;})
//        .attr("cx", function(d, i) {return Math.min(barWidth*(i+1),width/roomNodes.length*(i+1))+(quarterWidth/4 ); })
//        .attr("cy", function(d) { return y(eval(d.average))+smallerBarBy; });


}

function buildTooltip(elmtId){
    var friendlyName = nameById();

    var selectedCategory = responseKPI.assetKPIMetricType;
    var selectedKPI = responseKPI.selectedKPI;
    var label;
    if(selectedCategory=='ENERGY_PRODUCTION'){
        label="Energy Production Change";
    }else{
        if(selectedKPI==1){
            label="Energy Consumption Change";
        }else if (selectedKPI == 2){
            label="CO2 Emissions Change";
        } else{
            label="Energy Cost Change";
        }
    }
    var dat = d3.select(elmtId);
    var circleObj = dat.data()[0];
    var text = $('<div><span><b>'+friendlyName[circleObj.assetId].name+'</b></br> </span> <span>'+label+': '+formatN(circleObj.average)+'</span></div>');
//    var text = $('<div><span><b>'+circleObj.assetId.substring(12)+'</b></br> </span> <span>'+label+': '+formatN(circleObj.average)+'</span></div>');
    $("#tooltip").html(text);

    var pos = $(elmtId).position();
    $("#tooltip").css({
        position: "absolute",
        top: (pos.top + 130) + "px",
        left: (pos.left + 35) + "px"
    }).show();
}

var formatN = d3.format(",.1f");
