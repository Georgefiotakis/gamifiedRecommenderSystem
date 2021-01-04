/**
 * Created by pandriopoulos on 1/13/15.
 */



/************** ColorMapping for different Room Types **************/
//function roomTypeColorMap(){
//    var colorMap = {
//        "WIND_GENERATING_UNIT":{color:"#1f77b4"},
//        "ELECTRIC_VEHICLE_PLUG":{color:"#ff7f0e"},
//        "PUBLIC_BUILDING_PREMISES":{color:"#d62728"},
//        "PV_GENERATING_UNIT":{color:"rgb(176, 18, 203)"},
//        "North":{color:"#1f77b4"},
//        "East":{color:"#ff7f0e"},
//        "South":{color:"rgb(176, 18, 203)"},
//        "West":{color:"rgb(176, 18, 203)"}
//    };
//    return colorMap;
//}
function roomTypeColorMap(){
    var colorMap = {
        "WIND_GENERATING_UNIT":{color:"#1EDB17"},
        "GENERATION_UNIT":{color:"#1EDB17"},
        "ELECTRIC_VEHICLE_PLUG":{color:"#0000FF"},
        "ELECTRIC_VEHICLE_CHARGING_POINT":{color:"#0000FF"},
        "PUBLIC_BUILDING_PREMISES":{color:"#FF0000"},
        "WEATHER_STATION_UNIT":{color:"#1EDB17"},
        "PV_GENERATING_UNIT":{color:"#1EDB17"},
        "LIGHTING":{color:"FFA500"},
        "Cluster 1":{color:"#1f77b4"},
        "Cluster 2":{color:"#ff7f0e"},
        "Cluster 3":{color:"rgb(176, 18, 203)"},
        "North":{color:"#1f77b4"},
        "East":{color:"#ff7f0e"},
        "South":{color:"rgb(176, 18, 203)"},
        "West":{color:"rgb(176, 18, 203)"}
    };
    return colorMap;
}

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

function clusterById(){
    var cluster = {
        "Cluster 1":{cluster:"Low"},
        "Cluster 2":{cluster:"Medium"},
        "Cluster 3":{cluster:"High"}

    };
    return cluster;
}


/************** Returns centers regarding the different classes. **************/
function createCenters(width, height, rowGroup, columnGroup){
    var centers = {};

    if(columnGroup !=null && rowGroup != null){
        columnGroup.forEach(function (colEntry, i) { //create the centers for each column group
            rowGroup.forEach(function (rowEntry, j) { //create the centers for each row group
                var coordinates = {};
                var x = (j + 1) * width / 6;
                var y = (i + 1) * height / 8;
                coordinates["x"] = x;
                coordinates["y"] = y;

                centers[colEntry.key+"_"+rowEntry.key] = coordinates;

            });

        });
    }else if (columnGroup == null){
        rowGroup.forEach(function (rowEntry, j) { //create the centers for each row group
            var coordinates = {};
            var x = (j + 1) * width / 6;
            var y = height / 8;
            coordinates["x"] = x;
            coordinates["y"] = y;

            centers[rowEntry.key] = coordinates;

        });
    }else if(rowGroup == null){
        columnGroup.forEach(function (rowEntry, j) { //create the centers for each row group
            var coordinates = {};
            var x = (j + 1) * width / 6;
            var y = height / 8;
            coordinates["x"] = x;
            coordinates["y"] = y;

            centers[rowEntry.key] = coordinates;

        });
    }



    return centers;
}

/************** Returns a flattened hierarchy containing all leaf nodes under the root. **************/

function processData(data) {
    var obj = data;

    var newDataSet = [];

    for(var prop in obj) {
        newDataSet.push({name: prop.name, className: prop.roomType, size: 5});
    }
    return {children: newDataSet};
}


/************** Clear ALL GRAPHS. **************/
function clearGraphs(){
    d3.selectAll('svg').remove();
}
