<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="${pageContext.request.contextPath}/resources/js/orangePlanet.js"></script>
<style>

    @import url("https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css");
    @import url("https://fonts.googleapis.com/css?family=Nunito:300,400,700");

    .pcoded-main-container {
        background: url(./resources/img/orange-questions.jpg) no-repeat center center fixed;
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
        /*animation-name: example;*/
        /*animation-duration: 2s;*/
        /*animation-iteration-count: 3000;*/
        /*animation-delay: 5s;*/
    }

    @keyframes example {
        0%   {-webkit-filter: drop-shadow(15px 15px 15px #222); filter: drop-shadow(3px 3px 3px #a4a4a4);}
        /*25%  {-webkit-filter: drop-shadow(15px 15px 15px #222); filter: drop-shadow(3px 3px 3px #a4a4a4);}*/
        /*50%  {-webkit-filter: drop-shadow(15px 15px 15px #222); filter: drop-shadow(3px 3px 3px #a4a4a4);}*/
        100% {-webkit-filter: drop-shadow(15px 15px 15px #222); filter: drop-shadow(13px 13px 13px #a4a4a4);}

    }

    .orangePlanetTitle {
        height: 800px;
        overflow-y: auto;
    }

    .titlePlanet {
        font-family: Comic Sans MS, Comic Sans, cursive;
        text-align: center;
        color: white;
        font-size: 32px;
        font-weight: bold;
        /*-webkit-filter: drop-shadow(15px 15px 15px #222);*/
        /*filter: drop-shadow(10px 10px 10px #a4a4a4);*/
    }

    .nextButtonDiv {
        height: 100vh;
    }

    .backButtonDiv {
        height: 100vh;
    }

    button {
        font-family: 'Hind Guntur', sans-serif;
        font-size: 15px;
        line-height: 1;
        color: #fff;
        letter-spacing: 0.025em;

        background: #379aff;
        padding: 18px 0 11px;
        cursor: pointer;
        border: 0;
        border-radius: 10px;
        min-width: 120px;
        overflow: hidden;
        opacity: 0.7;

        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
    }

    .button2 {
        font-family: 'Hind Guntur', sans-serif;
        font-size: 15px;
        line-height: 1;
        color: #fff;
        letter-spacing: 0.025em;

        background: #cfb622;
        padding: 18px 0 11px;
        cursor: pointer;
        border: 0;
        border-radius: 10px;
        min-width: 120px;
        overflow: hidden;
        opacity: 0.9;

        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
    }

    button span {
        display: block;
        position: relative;
        z-index: 10;
    }

    button:after,
    button:before {
        padding: 18px 0 11px;
        content: '';
        position: absolute;
        top: 0;
        left: calc(-100% - 30px);
        height: calc(100% - 29px);
        width: calc(100% + 20px);
        color: #fff;
        border-radius: 2px;
        transform: skew(-25deg);
    }

    button:after {
        background: #fff;
        transition: left 0.8s cubic-bezier(0.86, 0, 0.07, 1) 0.2s;
        z-index: 0;
        opacity: 0.8;
    }

    button:before {
        background: #2196F3;
        z-index: 5;
        transition: left 1s cubic-bezier(0.86, 0, 0.07, 1);
    }

    button:hover:after {
        left: calc(0% - 10px);
        transition: left 0.8s cubic-bezier(0.86, 0, 0.07, 1);
    }

    button:hover:before {
        left: calc(0% - 10px);
        transition: left 1s cubic-bezier(0.86, 0, 0.07, 1);
    }

    canvas {
        width: 250px;
        height: 250px;
        background: transparent;
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        pointer-events: none;
    }

    /* Start of Question 1 */

    .container {
        display: block;
        position: relative;
        padding-left: 35px;
        margin-bottom: 12px;
        cursor: pointer;
        font-size: 22px;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
    }

    /* Hide the browser's default radio button */
    .container input {
        position: absolute;
        opacity: 0;
        cursor: pointer;
    }

    /* Create a custom radio button */
    .checkmark {
        position: absolute;
        top: 0;
        left: 0;
        height: 25px;
        width: 25px;
        background-color: #eee;
        border-radius: 50%;
    }

    /* On mouse-over, add a grey background color */
    .container:hover input ~ .checkmark {
        background-color: #ccc;
    }

    /* When the radio button is checked, add a blue background */
    .container input:checked ~ .checkmark {
        background-color: #2196F3;
    }

    /* Create the indicator (the dot/circle - hidden when not checked) */
    .checkmark:after {
        content: "";
        position: absolute;
        display: none;
    }

    /* Show the indicator (dot/circle) when checked */
    .container input:checked ~ .checkmark:after {
        display: block;
    }

    /* Style the indicator (dot/circle) */
    .container .checkmark:after {
        top: 9px;
        left: 9px;
        width: 8px;
        height: 8px;
        border-radius: 50%;
        background: white;
    }

    /* End of Question 1 */


    label{
        color:white;
        font-weight: 600;
    }

    .questionTitle {
        color: white;
        font-weight: 600;
        padding-top: 50px;
    }

    html {
        scroll-behavior: smooth;
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
<%--                                        <input class="backButton" type="image"--%>
<%--                                               src="./resources/img/back-button.png" alt="Submit"--%>
<%--                                               width="100" height="100"--%>
<%--                                               onclick="backToDashboard()">--%>
                                    </div>
                                    <div class="currentUserId" id="currentUserId"style="display: none"><c:out value="${currentUserId}"/></div>
                                    <div class="currentSurveyId" id="currentSurveyId" style="display: none"><c:out value="${currentSurveyId}"/></div>
                                    <div class="col-lg-6 orangePlanetTitle">
                                        <h3 class="titlePlanet">Welcome to Planet Orange, <br> Please Answer the below questions!!!</h3>

                                        <form id="questionOne" class="questionOne">
                                            <h3 class="questionTitle">Do you like drawing?</h3>
                                            <label class="container">1
                                                <input type="radio" name="radio">
                                                <span class="checkmark"></span>
                                            </label>
                                            <label class="container">2
                                                <input type="radio" name="radio">
                                                <span class="checkmark"></span>
                                            </label>
                                            <label class="container">3
                                                <input type="radio" name="radio">
                                                <span class="checkmark"></span>
                                            </label>
                                            <label class="container">4
                                                <input type="radio" name="radio">
                                                <span class="checkmark"></span>
                                            </label>
                                            <label class="container">5
                                                <input type="radio" name="radio">
                                                <span class="checkmark"></span>
                                            </label>
                                        </form>

                                        <form id="questionTwo" class="questionTwo">
                                            <h3 class="questionTitle">Do you like maths and numbers?</h3>
                                            <label class="container">1
                                                <input type="radio" name="radio">
                                                <span class="checkmark"></span>
                                            </label>
                                            <label class="container">2
                                                <input type="radio" name="radio">
                                                <span class="checkmark"></span>
                                            </label>
                                            <label class="container">3
                                                <input type="radio" name="radio">
                                                <span class="checkmark"></span>
                                            </label>
                                            <label class="container">4
                                                <input type="radio" name="radio">
                                                <span class="checkmark"></span>
                                            </label>
                                            <label class="container">5
                                                <input type="radio" name="radio">
                                                <span class="checkmark"></span>
                                            </label>
                                        </form>

                                        <form id="questionThree" class="questionThree">
                                            <h3 class="questionTitle">Do you like physics?</h3>
                                            <label class="container">1
                                                <input type="radio" name="radio">
                                                <span class="checkmark"></span>
                                            </label>
                                            <label class="container">2
                                                <input type="radio" name="radio">
                                                <span class="checkmark"></span>
                                            </label>
                                            <label class="container">3
                                                <input type="radio" name="radio">
                                                <span class="checkmark"></span>
                                            </label>
                                            <label class="container">4
                                                <input type="radio" name="radio">
                                                <span class="checkmark"></span>
                                            </label>
                                            <label class="container">5
                                                <input type="radio" name="radio">
                                                <span class="checkmark"></span>
                                            </label>
                                        </form>

                                        <form id="questionFour" class="questionFour">
                                            <h3 class="questionTitle">Which is your favorite color from the options below?</h3>
                                            <label class="container">1
                                                <input type="radio" name="radio">
                                                <span class="checkmark"></span>
                                            </label>
                                            <label class="container">2
                                                <input type="radio" name="radio">
                                                <span class="checkmark"></span>
                                            </label>
                                            <label class="container">3
                                                <input type="radio" name="radio">
                                                <span class="checkmark"></span>
                                            </label>
                                            <label class="container">4
                                                <input type="radio" name="radio">
                                                <span class="checkmark"></span>
                                            </label>
                                            <label class="container">5
                                                <input type="radio" name="radio">
                                                <span class="checkmark"></span>
                                            </label>
                                        </form>

                                        <form id="questionFive" class="questionFive">
                                            <h3 class="questionTitle">Which is your favorite shape from the below options?</h3>
                                            <label class="container">1
                                                <input type="radio" name="radio">
                                                <span class="checkmark"></span>
                                            </label>
                                            <label class="container">2
                                                <input type="radio" name="radio">
                                                <span class="checkmark"></span>
                                            </label>
                                            <label class="container">3
                                                <input type="radio" name="radio">
                                                <span class="checkmark"></span>
                                            </label>
                                            <label class="container">4
                                                <input type="radio" name="radio">
                                                <span class="checkmark"></span>
                                            </label>
                                            <label class="container">5
                                                <input type="radio" name="radio">
                                                <span class="checkmark"></span>
                                            </label>
                                        </form>
                                    </div>
                                    <div class="col-lg-3 nextButtonDiv">
                                        <canvas></canvas>
                                        <button id="orangeNextButton" type="button" onclick="nextToRecommendationPage()">
                                            <span>Proceed...</span>
                                        </button>
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