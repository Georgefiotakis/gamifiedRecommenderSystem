<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<style>

    .pcoded-main-container {
        background: url(./resources/img/green-planet-cartoon.jpg) no-repeat center center fixed;
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

    body {
        overflow-y: hidden;
    }

    .backButton {
        margin-right: auto;
        display: block;
        position: absolute;
        top: 50%;
        left: 50%;
        margin-top: -25px;
        margin-left: -25px;
        animation-name: example;
        animation-duration: 2s;
        animation-iteration-count: 3000;
        animation-delay: 5s;
    }

    .backButton:hover {
        -webkit-filter: drop-shadow(15px 15px 15px #222);
        filter: drop-shadow(10px 10px 10px #a4a4a4);
    }

    .nextButton:hover {
        -webkit-filter: drop-shadow(13px 13px 13px #222);
        filter: drop-shadow(13px 13px 13px #a4a4a4);
    }

    .nextButton {
        /*width:150px;height:150px;*/
        /*border: solid 1px #e7e7e7;*/
        /*!*background-color: #eed;*!*/
        /*box-shadow: 1px -1px rgba(159, 159, 159, 0.6);*/
        /*-moz-box-shadow: 1px -1px rgba(159, 159, 159, 0.6);*/
        /*-webkit-box-shadow: 1px -1px rgba(159, 159, 159, 0.6);*/
        /*-o-box-shadow: 1px -1px rgba(159, 159, 159, 0.6);*/
        /*border-radius:100px;*/
        position: absolute;
        top: 50%;
        left: 50%;
        margin-top: -25px;
        margin-left: -25px;
        animation-name: example;
        animation-duration: 2s;
        animation-iteration-count: 3000;
        animation-delay: 5s;
    }

    @keyframes example {
        0%   {-webkit-filter: drop-shadow(15px 15px 15px #222); filter: drop-shadow(3px 3px 3px #a4a4a4);}
        /*25%  {-webkit-filter: drop-shadow(15px 15px 15px #222); filter: drop-shadow(3px 3px 3px #a4a4a4);}*/
        /*50%  {-webkit-filter: drop-shadow(15px 15px 15px #222); filter: drop-shadow(3px 3px 3px #a4a4a4);}*/
        100% {-webkit-filter: drop-shadow(15px 15px 15px #222); filter: drop-shadow(13px 13px 13px #a4a4a4);}

    }

    .greenPlanetTitle h3 {
        font-family: Comic Sans MS, Comic Sans, cursive;
        text-align: center;
        color: white;
        font-size: 32px;
        font-weight: bold;
        -webkit-filter: drop-shadow(15px 15px 15px #222);
        filter: drop-shadow(10px 10px 10px #a4a4a4);
    }

    .nextButtonDiv {
        height: 100vh;
    }

    .backButtonDiv {
        height: 100vh;
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
                                    <div class="col-lg-3 backButtonDiv">
                                        <input class="backButton" type="image"
                                               src="./resources/img/back-button.png" alt="Submit"
                                               width="100" height="100"
                                               onclick="backToDashboard()">
                                    </div>
                                    <div class="col-lg-6 greenPlanetTitle">
                                        <h3>Welcome to Planet Green, <br> Please Answer the below questions!!!</h3>
                                    </div>
                                    <div class="col-lg-3 nextButtonDiv">
                                        <input class="nextButton" type="image"
                                               src="./resources/img/next-button.png" alt="Submit"
                                               width="100" height="100"
                                               onclick="nextToPurplePlanet()">
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
    function backToDashboard() {
        location.replace("./dashboard");
    }
    function nextToPurplePlanet() {
        location.replace("./purplePlanet");
    }
</script>