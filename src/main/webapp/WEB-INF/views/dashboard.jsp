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
                                        <div class="notificationsCard ticket-card">
<%--                                            <div class="card-header">--%>
<%--                                                <h5 class="card-title">Notification Alarm</h5>--%>
<%--                                            </div>--%>
<%--                                            <div class="card-block text-center NotificationCircle">--%>
                                                <input class="startGameButton" type="image"
                                                       src="./resources/img/green-planet.png" alt="Submit"
                                                       width="400" height="250"
                                                       onclick="startingTheJourney()">
<%--                                            </div>--%>
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="heatMapCard">
<%--                                            <div class="card-header">--%>
<%--                                                <h5 class="card-title">HeatMap</h5>--%>
<%--                                            </div>--%>
<%--                                            <div class="card-block">--%>
                                                <input class="startGameButton" type="image"
                                                       src="./resources/img/purple-planet.png" alt="Submit"
                                                       width="400" height="250"
                                                       onclick="startingTheJourney()">
<%--                                            </div>--%>
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="heatMapCard">
                                            <%--                                            <div class="card-header">--%>
                                            <%--                                                <h5 class="card-title">HeatMap</h5>--%>
                                            <%--                                            </div>--%>
                                            <%--                                            <div class="card-block">--%>
                                            <input class="startGameButton" type="image"
                                                   src="./resources/img/orange-planet.png" alt="Submit"
                                                   width="400" height="250"
                                                   onclick="startingTheJourney()">
                                            <%--                                            </div>--%>
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