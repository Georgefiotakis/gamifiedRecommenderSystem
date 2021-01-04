/**
 * Created by pandriopoulos on 1/13/15.
 */

var groupByStatus;
var groupByRoomType;
var forceUpdate;
var force;
function buildBubbleChart(multiple, rowType) {
    if(force){
        force.stop();
    }

    if(forceUpdate){
        forceUpdate.stop();
    }

    /******** Set dynamic width height ********/
    var $container = $('#comparativeChart'), // lets try directly the floor plan or with its class
        width = $container.width(),
        height = $container.height();

    if (previousChartType != undefined && previousChartType != currentChartType && previousChartType.indexOf("bubble") >=0 ){
        //update axis
        console.log("Only circle update and texts");
        //set temp variables of groups in order to check the NONE type.
        var rowGroup = groupByStatus;
        var columnGroup = groupByRoomType;
        //Check which selection is null

        if (rowType == "l0"){
            if (previousPlotByLabel[0].right == "Room Type"){
                rowGroup = groupByRoomType;
                columnGroup = null;
            }else{
                rowGroup = groupByStatus;
                columnGroup = null;
            }
        }

        if(rowType == "r0"){
            if (previousPlotByLabel[0].left == "Room Type"){
                rowGroup = groupByRoomType;
                columnGroup = null;
            }else{
                rowGroup = groupByStatus;
                columnGroup = null;
            }
        }

        //create the centers regarding the classes/groups
        var centers = createCenters(width, height, rowGroup, columnGroup);
        //        var centers = createCenters(width, height, tempGroupByStatus, tempGroupByRoomType);

        //Change the text of the categories
        d3.selectAll('.categoryText').remove();
        createCategoryTexts(multiple, rowType, centers, width);

        //Rearrange the bubbles without recreating them
        forceUpdate = d3.layout.force()
            .nodes(roomNodes)
            .size([width, height])
            .friction(0.7)
            .on("tick", updateTick)
            .start();


        //select all the cicles that are goinh to be moved
        var circles = d3.selectAll('circle');
        //            .call(forceUpdate.drag)
        //            .on("mousedown", function () {
        //                d3.event.stopPropagation();
        //            });


        function updateTick(e) {
            // Push different nodes in different directions for clustering.
            var k = .1 * e.alpha;
            roomNodes.forEach(function (roomNode) {
                if(multiple){
                    roomNode.x += (2 * centers[roomNode.roomType+"_"+roomNode.status].x - roomNode.x) * k;
                    roomNode.y += (2 * centers[roomNode.roomType+"_"+roomNode.status].y - roomNode.y) * k;
                }else{
                    var dataCircles;
                    if (rowType == "l0"){
                        if (previousPlotByLabel[0].right == "Room Type"){
                            dataCircles = roomNode.roomType;
                        }else{
                            dataCircles = roomNode.status;
                        }
                    }

                    if(rowType == "r0"){
                        if (previousPlotByLabel[0].left == "Room Type"){
                            dataCircles = roomNode.roomType;
                        }else{
                            dataCircles = roomNode.status;
                        }
                    }

                    //                    if (!dataCircles){
                    if((rowType == "l6" || rowType == "r6")){
                        dataCircles = roomNode.roomType;
                    }else if ((rowType == "l7" || rowType == "r7")){
                        dataCircles = roomNode.status;
                    }
                    //                    }

                    roomNode.x += (2 * centers[dataCircles].x - roomNode.x) * k;
                    roomNode.y += (centers[dataCircles].y - roomNode.y) * k;
                }

            });

            circles.attr("cx", function (d) {
                return d.x;
            })
                .attr("cy", function (d) {
                    return d.y;
                });
        }

    }else{
        //delete and create
        console.log("Delete and recreate");
        if(forceUpdate){
            forceUpdate.stop();
        }
        d3.selectAll('svg').remove();
        createComparativeChart(width,height, multiple, rowType);
    }


}

function createComparativeChart(width, height, multiple, rowType){

    /******** Building the main chart of comparative view ********/
    var chart = d3.select("#comparativeChart").append("svg")
        .attr("width", '100%')
        .attr("height", '100%')
        //        .attr("style","border:1px solid black")
//        .attr("style", "background-color: #BAC9CB")
        .attr('viewBox', '0 0 ' + Math.min(width, height) + ' ' + Math.min(width, height))
        .attr('preserveAspectRatio', 'xMinYMin')
        .append("g")
        .attr("id","mainGroup")
        .attr("transform", "translate(-" + (width / 4 - 40) + ",-" + height / 6 + ")");


    var colorScale = d3.scale.category10();

//    var floorPlanURL = 'floorPlanData';

//    d3.json(floorPlanURL, function (error, response) {

//        roomNodes = response.floorList[0].roomList;

        groupByStatus = d3.nest()
            .key(function (d) {
                return d.status;
            })
            .entries(roomNodes);

        groupByRoomType = d3.nest()
            .key(function (d) {
                return d.roomType;
            })
            .entries(roomNodes);
        //.map(roomNodes);

        //        var nodes = processData(roomsList);

        //Create Room Type Colors
        var roomTypeColor = roomTypeColorMap();
        //Create Centers
        var centers;
        if(multiple){
            centers = createCenters(width, height, groupByStatus, groupByRoomType);
        }else{
            if(rowType == "l6" || rowType == "r6"){
                centers = createCenters(width, height, groupByRoomType, null);
            }else{
                centers = createCenters(width, height, groupByStatus, null);
            }
        }


        force = d3.layout.force()
            .nodes(roomNodes)
            .size([width, height])
            .friction(0.7)
            .on("tick", tick)
            .start();

        var roomNodeGroup = chart.append("g")
            .attr("id", "bubbleGroup");
        //            .attr("transform", "translate(-" + (width / 4 - 40) + ",-" + height / 6 + ")");

        var roomNode = roomNodeGroup.selectAll(".node")
            .data(roomNodes)
            .enter().append("circle")
            .attr("class", "node")
            .attr("cx", function (d) {
                return d.x;
            })
            .attr("cy", function (d) {
                return d.y;
            })
            .attr("r", 10)
//            .style("fill", function (d) {
//                return roomTypeColor[d.roomType].color
//            })
            //            .style("fill", function(d, i) { return colorScale(i & 3); })
            .style("stroke", function (d, i) {
                return d3.rgb(colorScale(i & 3)).darker(2);
            });
        //            .call(force.drag)
        //            .on("mousedown", function () {
        //                d3.event.stopPropagation();
        //            });

        function tick(e) {
            // Push different nodes in different directions for clustering.
            var k = .1 * e.alpha;
            roomNodes.forEach(function (roomNode) {
                if(multiple){
                    roomNode.x += (2 * centers[roomNode.roomType+"_"+roomNode.status].x - roomNode.x) * k;
                    roomNode.y += (2 * centers[roomNode.roomType+"_"+roomNode.status].y - roomNode.y) * k;
                }else{
                    roomNode.x += (2 * centers[(rowType == "l6" || rowType == "r6")?roomNode.roomType:roomNode.status].x - roomNode.x) * k;
                    roomNode.y += (centers[(rowType == "l6" || rowType == "r6")?roomNode.roomType:roomNode.status].y - roomNode.y) * k;
                }

            });

            roomNode.attr("cx", function (d) {
                return d.x;
            })
                .attr("cy", function (d) {
                    return d.y;
                });
        }

        //Create Row Categories Text for each center
        var rowCategoryTextGroup = chart.append("g")
            .attr("class", "categoryText")
            .attr("transform", "translate(" + (width / 4 - 20) + "," + 70 + ")");


        var rowCategoryText = rowCategoryTextGroup.selectAll('text')
            .data((rowType == "l6" || rowType == "r6")?groupByRoomType:groupByStatus)
            .enter()
            .append("text")
            .attr("x", function (d,i) {
                return multiple ? centers[groupByRoomType[0].key+"_"+d.key].x : centers[d.key].x;
            })
            .attr("y", function (d,i) {
                return multiple ? centers[groupByRoomType[0].key+"_"+d.key].y : centers[d.key].y;
            })
            .text(function (d) {
                var splitWords = d.key.split('_');
                var text = '';
                for (var j = 0; j < splitWords.length; j++) {
                    text += splitWords[j].toLowerCase() + " ";
                }
                return text;
            });

        if(multiple){
            //Create Row Categories Text for each center
            var t = d3.transform(d3.select('.categoryText').attr("transform")),
                x = t.translate[0],
                y = t.translate[1];

            var colCategoryTextGroup = chart.append("g")
                .attr("class", "categoryText")
                .attr("transform", "translate(" + (x - 100) + "," + (y + 50) + ")");

            var colCategoryText = colCategoryTextGroup.selectAll('text')
                .data(groupByRoomType)
                .enter()
                .append("text")
                .attr("x", function (d,i) {
                    return centers[d.key+"_"+groupByStatus[0].key].x;
                })
                .attr("y", function (d,i) {
                    return centers[d.key+"_"+groupByStatus[i].key].y;
                })
                .text(function (d) {
                    var splitWords = d.key.split('_');
                    var text = '';
                    for (var j = 0; j < splitWords.length; j++) {
                        text += splitWords[j].toLowerCase() + " ";
                    }
                    return text;
                });

        }

        //Create Legend on bubble
        var groupLegends = chart.append("g")
            .attr("class", "legend")
            .attr("height", 100)
            .attr("width", 100)
            .attr("transform", "translate(" + (width/8) + "," + 110 + ")");

        var legends = groupLegends.selectAll('rect')
            .data(groupByRoomType)
            .enter().append("rect")
            .attr("x", width - 65)
            .attr("y", function (d, i) {
                return i * 20;
            })
            .attr("width", 10)
            .attr("height", 10)
            .style("fill", function (d) {
                return roomTypeColor[d.key].color
            });


        var legendsText = groupLegends.selectAll('text')
            .data(groupByRoomType)
            .enter()
            .append("text")
            .attr("x", width - 52)
            .attr("y", function (d, i) {
                return i * 20 + 9;
            })
            .text(function (d) {
                var splitWords = d.key.split('_');
                var text = '';
                for (var j = 0; j < splitWords.length; j++) {
                    text += splitWords[j].toLowerCase() + " ";
                }
                return text;
            });

//    });


}

function createCategoryTexts(multiple, rowType, centers, width){
    //Create Row Categories Text for each center
    var rowCategoryTextGroup = d3.selectAll('#mainGroup').append("g")
        .attr("class", "categoryText")
        .attr("transform", "translate(" + (width / 4 - 20) + "," + 70 + ")");

    var dataText;
    //    console.log("Stera: "+previousPlotByLabel[0].left);
    //    console.log("Deksa: "+previousPlotByLabel[0].right);
    if (rowType == "l0"){
        if (previousPlotByLabel[0].right == "Room Type"){
            dataText = groupByRoomType;
        }else{
            dataText = groupByStatus;
        }
    }

    if(rowType == "r0"){
        if (previousPlotByLabel[0].left == "Room Type"){
            dataText = groupByRoomType;
        }else{
            dataText = groupByStatus;
        }
    }

    if (!dataText){
        if((rowType == "l6" || rowType == "r6")){
            dataText = groupByRoomType;
        }else{
            dataText = groupByStatus;
        }
    }

    var rowCategoryText = rowCategoryTextGroup.selectAll('text')
        .data(dataText)
        .enter()
        .append("text")
        .attr("x", function (d,i) {
            return multiple ? centers[groupByRoomType[0].key+"_"+d.key].x : centers[d.key].x;
        })
        .attr("y", function (d,i) {
            return multiple ? centers[groupByRoomType[0].key+"_"+d.key].y : centers[d.key].y;
        })
        .text(function (d) {
            var splitWords = d.key.split('_');
            var text = '';
            for (var j = 0; j < splitWords.length; j++) {
                text += splitWords[j].toLowerCase() + " ";
            }
            return text;
        });

    if(multiple){
        //Create Row Categories Text for each center
        var t = d3.transform(d3.select('.categoryText').attr("transform")),
            x = t.translate[0],
            y = t.translate[1];

        var colCategoryTextGroup = d3.selectAll('#mainGroup').append("g")
            .attr("class", "categoryText")
            .attr("transform", "translate(" + (x - 100) + "," + (y + 50) + ")");


        var colCategoryText = colCategoryTextGroup.selectAll('text')
            .data(groupByRoomType)
            .enter()
            .append("text")
            .attr("x", function (d,i) {
                return centers[d.key+"_"+groupByStatus[0].key].x;
            })
            .attr("y", function (d,i) {
                return centers[d.key+"_"+groupByStatus[i].key].y;
            })
            .text(function (d) {
                var splitWords = d.key.split('_');
                var text = '';
                for (var j = 0; j < splitWords.length; j++) {
                    text += splitWords[j].toLowerCase() + " ";
                }
                return text;
            });

    }
}