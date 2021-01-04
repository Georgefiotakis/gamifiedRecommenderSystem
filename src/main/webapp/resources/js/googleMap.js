var activeInfoWindow;
var prosumerDot;
var iconBase = 'http://localhost:8181/monitorManagementTool/resources/img/';
//http://localhost:9191/flexibilityProfiling/resources/img/dashboard/hypertech-logo.png
var country = "Athens, Greece"
// var country_id = $(this).attr('id');
var country_id = 1;
var markersObj = [];
var valuesList = [];

$(document).ready(function () {
    // $('.bselect').click(function(){
    //     var country = $(this).data('id');


    // if(country !== "" || country!==undefined){
    $.ajax({
        type: "GET",
        url: "./getProsumersByCountry?country_id=" + country_id,
        contentType: "text/plain",
        success: function (data, status) {

            data.forEach(d => {
                if (isNaN(d.value) || d.value != null) {
                    valuesList.push(d.value);
                }
            })

            //   var min = Math.min(...valuesList);
            //    var max = Math.max(...valuesList);

            data.forEach(d => {
                if (d.latitude != null && d.longtitude != null) {
                    var latLng = new google.maps.LatLng(Number(d.latitude), Number(d.longtitude));
                    prosumerDot = new google.maps.Marker({
                        position: latLng,
                        icon: iconBase + 'greenPinMarker.png'
                        // icon : {
                        //     path: google.maps.SymbolPath.CIRCLE,
                        //     scale: 10.0,
                        //     fillColor:'#FF0000',
                        //     fillOpacity:0.35,
                        //     strokeColor: '#FF0000',
                        //     strokeOpacity: 0.8,
                        //     animation: google.maps.Animation.DROP,
                        //     strokeWeight: 1
                        // }
                    });
                    // prosumerDot.addListener('click', toggleBounce);
                    prosumerDot.metadata = {
                        id: d.prosumerName,
                        prosumerType: d.prosumerType,
                        metricType: d.prosumerDeviceMeteringType,
                        value: d.value,
                        timestamp: d.timestamp
                    };
                    prosumerDot.addListener('click', showBuildingTooltip);
                    markersObj.push(prosumerDot);
                }
            });
            createMap(country, markersObj);
        }
    });

    // }
    // })
});

// function toggleBounce() {
//     if (prosumerDot.getAnimation() !== null) {
//         prosumerDot.setAnimation(null);
//     } else {
//         prosumerDot.setAnimation(google.maps.Animation.BOUNCE);
//     }
// }

function createMap(country, markersObj) {

    var styledMapType = new google.maps.StyledMapType(
        [
            {
                featureType: "administrative.land_parcel",
                stylers: [
                    {
                        visibility: "off"
                    }
                ]
            },
            {
                featureType: "administrative.neighborhood",
                stylers: [
                    {
                        visibility: "off"
                    }
                ]
            },
            {
                featureType: "poi",
                elementType: "labels.text",
                stylers: [
                    {
                        visibility: "off"
                    }
                ]
            },
            {
                featureType: "poi.business",
                stylers: [
                    {
                        visibility: "off"
                    }
                ]
            },
            {
                featureType: "road",
                elementType: "labels",
                stylers: [
                    {
                        visibility: "off"
                    }
                ]
            },
            {
                featureType: "road",
                elementType: "labels.icon",
                stylers: [
                    {
                        visibility: "off"
                    }
                ]
            },
            {
                featureType: "transit",
                stylers: [
                    {
                        visibility: "off"
                    }
                ]
            },
            {
                featureType: "water",
                elementType: "labels.text",
                stylers: [
                    {
                        visibility: "off"
                    }
                ]
            },
            {
                featureType: "administrative.country",
                elementType: "labels.text",
                stylers: [
                    {
                        visibility: "on"
                    }
                ]
            },
            {
                featureType: "administrative.land_parcel",
                elementType: "labels.text",
                stylers: [
                    {
                        visibility: "off"
                    }
                ]
            },
            {
                featureType: "administrative.locality",
                elementType: "labels.text",
                stylers: [
                    {
                        visibility: "on"
                    }
                ]
            },
            {
                featureType: "administrative.province",
                elementType: "labels.text",
                stylers: [
                    {
                        visibility: "on"
                    }
                ]
            },
            {
                featureType: "water",
                stylers: [
                    {
                        visibility: "off"
                    }
                ]
            },
            {
                featureType: "road",
                stylers: [
                    {
                        visibility: "off"
                    }
                ]
            }
        ]);


    var options = {
        zoom: 13,
        draggable: true
    };


    var map = new google.maps.Map(document.getElementById('map'), options);
    map.addListener('click', function () {
        if (activeInfoWindow != null) {
            activeInfoWindow.close();
        }
    })

    map.mapTypes.set('styled_map', styledMapType);
    map.setMapTypeId('styled_map');

    var geocoder = new google.maps.Geocoder;
    geocoder.geocode({'address': country}, function (results, status) {
        if (status === 'OK') {
            map.setCenter(results[0].geometry.location);
        } else {
            window.alert('Geocode was not successful for the following reason: ' +
                status);
        }
    });

    if (markersObj.length > 0) {
        markersObj.forEach(marker => {
            marker.setMap(map);
        })
    }
}


function scaleMetricToCircle(x, min, max) {
    var a = 8;
    var b = 15;
    var result = (((b - a) * (x - min)) / (max - min)) + a;

    if (isNaN(parseFloat(result))) {
        result = a;
    }
    return result;
}

function showBuildingTooltip() {

    // var contentString = '<div>'+
    //     '<h4>'+'Building: '+this.metadata.id+'</h3>'+
    //     '<div>'+
    //     '<p><b>Building Type: </b>'+this.metadata.prosumerType+'</p>'+
    //     '<p><b>Metric type: </b>'+this.metadata.metricType+'</p>'+
    //     '<p><b>Energy consumption: </b>'+this.metadata.value +' KWH'+'</p>'+
    //     '<p><b>Metric Date: </b>'+this.metadata.timestamp + '</p>'
    // '</div>'+
    // '</div>';

    var contentString =
        '<div>' +
        '<h4>' + 'Device characteristics: ' + '' + '</h3>' +
        '<div>' +
        '<p><b>Preparation Period: </b>' + 'N/A' + '</p>' +
        '<p><b>Ramping period: </b>' + '1 min' + '</p>' +
        '<p><b>Min & max quantity: </b>' + '0 – 3800 W' + ' KWH' + '</p>' +
        '<p><b>Full activation period: </b>' + 'N/A' + '</p>' +
        '<p><b>Divisibility: </b>' + 'No' + '</p>'
    '</div>' +
    '</div>';

    if (activeInfoWindow != null) {
        activeInfoWindow.close();
    }
    var infowindow = new google.maps.InfoWindow({
        content: contentString
    });
    infowindow.open(map, this);
    activeInfoWindow = infowindow;

}