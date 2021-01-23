<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="${pageContext.request.contextPath}/resources/js/studentRecommendation.js"></script>
<style>

    @import url("https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css");
    @import url("https://fonts.googleapis.com/css?family=Nunito:300,400,700");

    .pcoded-main-container {
        background: url(./resources/img/studentRecommendation-page-background.gif) no-repeat center center fixed;
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

    .titlePlanet, .recommendationTitle {
        font-family: Comic Sans MS, Comic Sans, cursive;
        text-align: center;
        color: white;
        font-size: 32px;
        font-weight: bold;
        background-color: rgba(0, 0, 0, 0.4);

        /*-webkit-filter: drop-shadow(15px 15px 15px #222);*/
        /*filter: drop-shadow(10px 10px 10px #a4a4a4);*/
    }

    @keyframes example {
        0%   {-webkit-filter: drop-shadow(15px 15px 15px #222); filter: drop-shadow(3px 3px 3px #a4a4a4);}
        /*25%  {-webkit-filter: drop-shadow(15px 15px 15px #222); filter: drop-shadow(3px 3px 3px #a4a4a4);}*/
        /*50%  {-webkit-filter: drop-shadow(15px 15px 15px #222); filter: drop-shadow(3px 3px 3px #a4a4a4);}*/
        100% {-webkit-filter: drop-shadow(15px 15px 15px #222); filter: drop-shadow(13px 13px 13px #a4a4a4);}

    }

    html {
        scroll-behavior: smooth;
    }

    .wrap {
        height: 100%;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .button {
        min-width: 300px;
        min-height: 60px;
        font-family: 'Nunito', sans-serif;
        font-size: 22px;
        text-transform: uppercase;
        letter-spacing: 1.3px;
        font-weight: 700;
        color: #313133;
        background: #4FD1C5;
        background: linear-gradient(90deg, rgba(129,230,217,1) 0%, rgba(79,209,197,1) 100%);
        border: none;
        border-radius: 1000px;
        box-shadow: 12px 12px 24px rgba(79,209,197,.64);
        transition: all 0.3s ease-in-out 0s;
        cursor: pointer;
        outline: none;
        position: relative;
        padding: 10px;
    }

    button::before {
        content: '';
        border-radius: 1000px;
        min-width: calc(300px + 12px);
        min-height: calc(60px + 12px);
        border: 6px solid #00FFCB;
        box-shadow: 0 0 60px rgba(0,255,203,.64);
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        opacity: 0;
        transition: all .3s ease-in-out 0s;
    }

    .button:hover, .button:focus {
        color: #313133;
        transform: translateY(-6px);
    }

    button:hover::before, button:focus::before {
        opacity: 1;
    }

    button::after {
        content: '';
        width: 30px; height: 30px;
        border-radius: 100%;
        border: 6px solid #00FFCB;
        position: absolute;
        z-index: -1;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        animation: ring 1.5s infinite;
    }

    button:hover::after, button:focus::after {
        animation: none;
        display: none;
    }

    @keyframes ring {
        0% {
            width: 30px;
            height: 30px;
            opacity: 1;
        }
        100% {
            width: 300px;
            height: 300px;
            opacity: 0;
        }
    }

    .restartGame {
        text-align: center;
    }

    .button:focus {
        outline: 0;
    }

    @keyframes tipsy {
    0 {
        transform: translateX(-50%) translateY(-50%) rotate(0deg);
    }
    100% {
        transform: translateX(-50%) translateY(-50%) rotate(360deg);
    }
    }

    body {
        font-family: helvetica, arial, sans-serif;
        background-color: #2e2e31;
    }

    .restartGame a {
        color: #fffbf1!important;
        text-shadow: 0 20px 25px #2e2e31, 0 40px 60px #2e2e31;
        font-size: 40px;
        font-weight: bold;
        text-decoration: none;
        letter-spacing: -3px;
        margin: 0;
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translateX(-50%) translateY(-50%);
    }

    .restartGame a:before,
    .restartGame a:after {
        content: '';
        padding: .9em .4em;
        position: absolute;
        left: 50%;
        width: 100%;
        top: 50%;
        display: block;
        border: 15px solid red;
        transform: translateX(-50%) translateY(-50%) rotate(0deg);
        animation: 10s infinite alternate ease-in-out tipsy;
    }

    .restartGame a:before {
        border-color: #d9524a #d9524a rgba(0, 0, 0, 0) rgba(0, 0, 0, 0);
        z-index: -1;
    }

    .restartGame a:after {
        border-color: rgba(0, 0, 0, 0) rgba(0, 0, 0, 0) #d9524a #d9524a;
        box-shadow: 25px 25px 25px rgba(46, 46, 49, .8);
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
                                    <div class="col-lg-2 backButtonDiv">

                                    </div>
                                    <div class="currentUserId" id="currentUserId"style="display: none"><c:out value="${currentUserId}"/></div>
                                    <div class="currentSurveyId" id="currentSurveyId" style="display: none"><c:out value="${currentSurveyId}"/></div>
                                    <div class="col-lg-8 restartGame">
                                        <div class="row">
                                            <div class="12">
                                                <h3 style="padding-bottom: 250px" class="titlePlanet">Congratulations, <br> You have completed your journey successfully
                                                    <br> Your Technology Orientation path according to your answers is ... </h3>
                                                <a><c:out value="${finalRecommendationPath}"/></a>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-12">
                                                <div style="float: left" class="col-lg-6 wrap">
                                                    <button class="button" onclick="startingTheJourney()">Take another Journey</button>
                                                </div>
                                                <div style="float: right" class="col-lg-6 wrap">
                                                    <button class="button" onclick="analyticsPage()">Check some Analytics</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-2">
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
    function startingTheJourney() {
        location.replace("./userProfile");
    }
    function analyticsPage() {
        location.replace("./analytics");
    }
</script>