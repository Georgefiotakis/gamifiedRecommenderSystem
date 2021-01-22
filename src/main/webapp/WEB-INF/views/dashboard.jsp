<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<style>

    .pcoded-main-container {
        background: url(./resources/img/dashboard-space-background.jpg) no-repeat center center fixed;
        -webkit-background-size: cover;
        -moz-background-size: cover;
        -o-background-size: cover;
        background-size: cover;
        height: auto;
        max-width: 100%;
    }

    .pcoded .pcoded-header[header-theme=theme6] {
        background: #133a47;
    }

    .header-navbar .navbar-wrapper .navbar-logo[logo-theme=theme6] {
        background: #133a47;
    }

    .purplePlanetButton {
        position: relative;
        margin-left: auto;
        margin-right: auto;
        display: block;
    }

    .purplePlanetButton:hover {
        -webkit-filter: drop-shadow(10px 10px 10px #222);
        filter: drop-shadow(10px 10px 10px #5f5e5e);
    }

    .orangePlanetButton {
        position: absolute;
        top: 100%;
        right: 0;
    }

    .orangePlanetButton:hover {
        -webkit-filter: drop-shadow(10px 10px 10px #222);
        filter: drop-shadow(10px 10px 10px #5f5e5e);
    }

    .greenPlanetButton {
        position: absolute;
        top: 100%;
        left: 0;
    }

    .greenPlanetButton:hover {
        -webkit-filter: drop-shadow(10px 10px 10px #222);
        filter: drop-shadow(10px 10px 10px #5f5e5e);
    }

    body {
        overflow-y: hidden;
    }

    .orangePlanetButton {
        opacity: 0.3;
    }

    .purplePlanetButton {
        opacity: 0.3;
    }

</style>

<div class="pcoded-main-container">
    <div class="pcoded-wrapper">
        <div class="pcoded-content">
            <div class="pcoded-inner-content">
                <div class="main-body">
                    <div class="page-wrapper">
                        <div class="page-body">
                            <div class="col-lg-12">
                                <div class="row">
                                    <div class="col-lg-4">
                                        <div class="greenPlanet">
<%--                                            <div class="card-header">--%>
<%--                                                <h5 class="card-title">Notification Alarm</h5>--%>
<%--                                            </div>--%>
<%--                                            <div class="card-block text-center NotificationCircle">--%>
                                                <input class="greenPlanetButton" type="image"
                                                       src="./resources/img/green-planet.png" alt="Submit"
                                                       width="350" height="200"
                                                       onclick="goToGreenPlanet()">
<%--                                            </div>--%>
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="purplePlanet">
<%--                                            <div class="card-header">--%>
<%--                                                <h5 class="card-title">HeatMap</h5>--%>
<%--                                            </div>--%>
<%--                                            <div class="card-block">--%>
                                                <input class="purplePlanetButton" type="image" disabled
                                                       src="./resources/img/purple-planet.png" alt="Submit"
                                                       width="350" height="200"
                                                       onclick="goToPurplePlanet()">
<%--                                            </div>--%>
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="orangePlanet">
                                            <%--                                            <div class="card-header">--%>
                                            <%--                                                <h5 class="card-title">HeatMap</h5>--%>
                                            <%--                                            </div>--%>
                                            <%--                                            <div class="card-block">--%>
                                            <input class="orangePlanetButton" type="image" disabled
                                                   src="./resources/img/orange-planet.png" alt="Submit"
                                                   width="350" height="200"
                                                   onclick="goToOrangePlanet()">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    function goToGreenPlanet() {
        location.replace("./greenPlanet");
    }
    function goToOrangePlanet() {
        location.replace("./orangePlanet");
    }
    function goToPurplePlanet() {
        location.replace("./purplePlanet");
    }
</script>