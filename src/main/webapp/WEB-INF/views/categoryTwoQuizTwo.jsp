<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>Technology Literacy</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/neonwizard/b5/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/neonwizard/b5/animate.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/neonwizard/b5/fontawesome-all.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/neonwizard/b5/quiz-questions-style.css">
    <link href="http://netdna.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/resources/js/categoryTwoQuizTwo.js"></script>

    <%--    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/colors/switch.css">--%>
    <!-- Color Alternatives -->
    <%--    <link href="${pageContext.request.contextPath}/resources/css/colors/color-2.css" rel="alternate stylesheet" type="text/css" title="color-2">--%>
    <%--    <link href="${pageContext.request.contextPath}/resources/css/colors/color-3.css" rel="alternate stylesheet" type="text/css" title="color-3">--%>
    <%--    <link href="${pageContext.request.contextPath}/resources/css/colors/color-4.css" rel="alternate stylesheet" type="text/css" title="color-4">--%>
    <%--    <link href="${pageContext.request.contextPath}/resources/css/colors/color-5.css" rel="alternate stylesheet" type="text/css" title="color-5">--%>

</head>

<style>
    .modalfiw {
        display: none; /* Hidden by default */
        position: fixed!important; /* Stay in place */
        z-index: 1!important; /* Sit on top */
        padding-top: 100px; /* Location of the box */
        left: 0;
        top: 0;
        width: 100%; /* Full width */
        height: 100%; /* Full height */
        overflow: auto!important; /* Enable scroll if needed */
        /*background-color: rgb(0,0,0); !* Fallback color *!*/
        /*background-color: rgba(0,0,0,0.4); !* Black w/ opacity *!*/
        background-color: #656565e6;
    }

    /* Modal Content */
    .myCustomModal {
        position: relative!important;
        background-color: #fefefe!important;
        margin: auto!important;
        padding: 0!important;
        border: 1px solid #888;
        width: 80%;
        height: 350px;
        box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19)!important;
        -webkit-animation-name: animatetop!important;
        -webkit-animation-duration: 0.4s;
        animation-name: animatetop!important;
        animation-duration: 0.4s
    }

    /* Add Animation */
    @-webkit-keyframes animatetop {
        from {top:-300px; opacity:0}
        to {top:0; opacity:1}
    }

    @keyframes animatetop {
        from {top:-300px; opacity:0}
        to {top:0; opacity:1}
    }

    /* The Close Button */
    .close {
        color: white;
        float: right;
        font-size: 28px;
        font-weight: bold;
    }

    .close:hover,
    .close:focus {
        color: #000;
        text-decoration: none;
        cursor: pointer;
    }

    .headerModal {
        padding: 2px 16px;
        background-color: #7369b9;
        color: white;
    }

    .modal-header h2 {
        text-align: center!important;
    }

    .modal-body {
        padding: 2px 16px;
        background-color:black;
    }

    .modal-footer {
        padding: 2px 16px;
        background-color: #7369b9;
        color: white;
    }

    #gainCoins {
        font-size: 25px;
        text-align: center;
        margin-left: auto;
        margin-right: auto;
        width: 50%;
        display: block;
        padding-top: 10px;
    }

    #totalCorrectAnswers {
        font-size: 25px;
        text-align: center;
        margin-left: auto;
        margin-right: auto;
        width: 50%;
        display: block;
        padding-top: 10px;
    }

</style>

<body class="dark-version">
<%--<div id="switch-color" class="color-switcher">--%>
<%--    <div class="open"><i class="fas fa-cog"></i></div>--%>
<%--    <h4>COLOR OPTION</h4>--%>
<%--    <ul>--%>
<%--        <li><a class="color-2" onclick="setActiveStyleSheet('color-2'); return false;" href="#"><i class="fas fa-cog"></i></a> </li>--%>
<%--        <li><a class="color-3" onclick="setActiveStyleSheet('color-3'); return false;" href="#"><i class="fas fa-cog"></i></a> </li>--%>
<%--        <li><a class="color-4" onclick="setActiveStyleSheet('color-4'); return false;" href="#"><i class="fas fa-cog"></i></a> </li>--%>
<%--        <li><a class="color-5" onclick="setActiveStyleSheet('color-5'); return false;" href="#"><i class="fas fa-cog"></i></a> </li>--%>
<%--    </ul>--%>
<%--</div>--%>
<div class="clearfix"></div>


<div class="wrapper wizard d-flex clearfix multisteps-form position-relative">
    <div class="steps order-2 position-relative w-25">
        <div class="multisteps-form__progress">
            <span class="multisteps-form__progress-btn js-active" title="Application data"><i
                    class="fa fa-question-circle"></i><span>Question 1</span></span>
            <span class="multisteps-form__progress-btn" title="Tax residency"><i
                    class="fa fa-question-circle"></i><span>Question 2</span></span>
            <span class="multisteps-form__progress-btn" title="Indentity documents"><i class="fa fa-question-circle"></i><span>Question 3</span></span>
            <span class="multisteps-form__progress-btn" title="Investability"><i class="fa fa-question-circle"></i><span>Question 4</span></span>
            <span class="multisteps-form__progress-btn" title="Review"><i class="fa fa-question-circle"></i><span>Question 5</span></span>
        </div>
    </div>
    <form class="multisteps-form__form w-75 order-1" style="display: block">
        <div class="form-area position-relative">
            <!-- div 1 -->
            <div class="multisteps-form__panel js-active" data-animation="slideHorz">
                <div class="wizard-forms">
                    <div class="inner pb-100 clearfix">
                        <div class="wizard-title text-center">
                            <h3>Please, complete those logical questions</h3>
                            <%--                            <p>has been a while. I would like to present you the project I work </p>--%>
                            <br>
                            <br>
                            <br>
                            <br>
                            <br>
                            <br>
                            <br>
                            <label id="minutes">00</label>:<label id="seconds">00</label>
                        </div>
                        <div class="wizard-form-input mb-60 mt-60" style="display: none;">
                            <div class="line line2"></div>
                        </div>
                        <div class="wizard-duration mb-60">
                            <span class="wizard-sub-text">'OS' computer abbreviation usually means ?</span>
                            <div class="row">
                                <div class="col-md-3">
                                    <label class="duration-option answerDiv">
                                        <input id="a1" onclick="saveAnswerOne(this.id,this.value)" type="radio" name="duration-service" value="Order of Significance" class="d-checkbox">
                                        <span class="checkbox-circle-tick"></span>
                                        <span class="duration-box text-center">
                                                <span>Order of Significance</span>
                                        </span>
                                    </label>
                                </div>
                                <div class="col-md-3">
                                    <label class="duration-option answerDiv">
                                        <input id="a2" onclick="saveAnswerOne(this.id,this.value)" type="radio" name="duration-service" value="Open Software" class="d-checkbox">
                                        <span class="checkbox-circle-tick"></span>
                                        <span class="duration-box text-center">
                                                <span>Open Software</span>
                                        </span>
                                    </label>
                                </div>
                                <div class="col-md-3">
                                    <label class="duration-option answerDiv">
                                        <input id="a3" onclick="saveAnswerOne(this.id,this.value)" type="radio" name="duration-service" value="Operating System" class="d-checkbox">
                                        <span class="checkbox-circle-tick"></span>
                                        <span class="duration-box text-center">
                                                <span>Operating System</span>
                                        </span>
                                    </label>
                                </div>
                                <div class="col-md-3">
                                    <label class="duration-option answerDiv">
                                        <input id="a4" onclick="saveAnswerOne(this.id,this.value)" type="radio" name="duration-service" value="Optical Sensor" class="d-checkbox"/>
                                        <span class="checkbox-circle-tick"></span>
                                        <span class="duration-box text-center">
                                                <span>Optical Sensor</span>
                                        </span>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="wizard-v3-progress">
                            <span>1 to 5 step</span>
                            <h3>0% to complete</h3>
                            <div class="progress">
                                <div class="progress-bar" style="width: 0%">
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.inner -->
                    <div class="vector-img-one">
                        <img src="${pageContext.request.contextPath}/resources/img/vb3.png" alt="">
                    </div>
                    <div class="actions">
                        <ul>
                            <li><span class="js-btn-next" title="NEXT">NEXT <i class="fa fa-arrow-right"></i></span>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- div 2 -->
            <div class="multisteps-form__panel" data-animation="slideHorz">
                <div class="wizard-forms section-padding">
                    <div class="inner pb-100 clearfix">
                        <div class="wizard-title text-center">
                            <h3>Please, complete those logical questions</h3>
                            <br>
                            <br>
                            <br>
                            <br>
                            <br>
                            <br>
                            <br>
                            <%--                            <label id="minutes">00</label>:<label id="seconds">00</label>--%>
                        </div>
                        <div class="wizard-form-input mb-60 mt-60" style="display: none;">
                            <div class="line line2"></div>
                        </div>
                        <div class="wizard-duration mb-60">
                            <span class="wizard-sub-text">In which decade was the American Institute of Electrical Engineers (AIEE) founded?</span>
                            <div class="row">
                                <div class="col-md-3">
                                    <label class="duration-option">
                                        <input id="b1" onclick="saveAnswerTwo(this.id,this.value)" type="radio" name="duration-service" value="1850s" class="d-checkbox"/>
                                        <span class="checkbox-circle-tick"></span>
                                        <span class="duration-box text-center">
                                            <span>1850s</span>
                                        </span>
                                    </label>
                                </div>
                                <div class="col-md-3">
                                    <label class="duration-option">
                                        <input id="b2" onclick="saveAnswerTwo(this.id,this.value)" type="radio" name="duration-service" value="1880s" class="d-checkbox">
                                        <span class="checkbox-circle-tick"></span>
                                        <span class="duration-box text-center">
                                            <span>1880s</span>
                                        </span>
                                    </label>
                                </div>
                                <div class="col-md-3">
                                    <label class="duration-option">
                                        <input id="b3" onclick="saveAnswerTwo(this.id,this.value)" type="radio" name="duration-service" value="1930s" class="d-checkbox">
                                        <span class="checkbox-circle-tick"></span>
                                        <span class="duration-box text-center">
                                            <span>1930s</span>
                                        </span>
                                    </label>
                                </div>
                                <div class="col-md-3">
                                    <label class="duration-option">
                                        <input id="b4" onclick="saveAnswerTwo(this.id,this.value)" type="radio" name="duration-service" value="1950s" class="d-checkbox">
                                        <span class="checkbox-circle-tick"></span>
                                        <span class="duration-box text-center">
                                            <span>1950s</span>
                                        </span>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="wizard-v3-progress">
                            <span>2 to 5 step</span>
                            <h3>38% to complete</h3>
                            <div class="progress">
                                <div class="progress-bar" style="width: 38%">
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.inner -->
                    <div class="vector-img-one">
                        <img src="${pageContext.request.contextPath}/resources/img/vb3.png" alt="">
                    </div>
                    <div class="actions">
                        <ul>
                            <li><span class="js-btn-prev" title="BACK"><i class="fa fa-arrow-left"></i> BACK </span>
                            </li>
                            <li><span class="js-btn-next" title="NEXT">NEXT <i class="fa fa-arrow-right"></i></span>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- div 3 -->
            <div class="multisteps-form__panel" data-animation="slideHorz">
                <div class="wizard-forms">
                    <div class="inner pb-100 clearfix">
                        <div class="wizard-title text-center">
                            <h3>Please, complete those logical questions</h3>
                            <br>
                            <br>
                            <br>
                            <br>
                            <br>
                            <br>
                            <br>
                            <%--                            <label id="minutes">00</label>:<label id="seconds">00</label>--%>
                        </div>
                        <div class="wizard-form-input mb-60 mt-60" style="display: none;">
                            <div class="line line2"></div>
                        </div>
                        <div class="wizard-duration mb-60">
                            <span class="wizard-sub-text">'.MOV' extension refers usually to what kind of file?</span>
                            <div class="row">
                                <div class="col-md-3">
                                    <label class="duration-option">
                                        <input id="g1" onclick="saveAnswerThree(this.id,this.value)" type="radio" name="duration-service" value="Image file" class="d-checkbox">
                                        <span class="checkbox-circle-tick"></span>
                                        <span class="duration-box text-center">
                                            <span>Image file</span>
                                        </span>
                                    </label>
                                </div>
                                <div class="col-md-3">
                                    <label class="duration-option">
                                        <input id="g2" onclick="saveAnswerThree(this.id,this.value)" type="radio" name="duration-service" value="Animation/movie file" class="d-checkbox">
                                        <span class="checkbox-circle-tick"></span>
                                        <span class="duration-box text-center">
                                            <span>Animation movie file</span>
                                        </span>
                                    </label>
                                </div>
                                <div class="col-md-3">
                                    <label class="duration-option">
                                        <input id="g3" onclick="saveAnswerThree(this.id,this.value)" type="radio" name="duration-service" value="Audio file" class="d-checkbox">
                                        <span class="checkbox-circle-tick"></span>
                                        <span class="duration-box text-center">
                                            <span>Audio file</span>
                                        </span>
                                    </label>
                                </div>
                                <div class="col-md-3">
                                    <label class="duration-option">
                                        <input id="g4" onclick="saveAnswerThree(this.id,this.value)"type="radio" name="duration-service" value="MS Office document" class="d-checkbox">
                                        <span class="checkbox-circle-tick"></span>
                                        <span class="duration-box text-center">
                                            <span>MS Office document</span>
                                        </span>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="wizard-v3-progress">
                            <span>3 to 5 step</span>
                            <h3>59% to complete</h3>
                            <div class="progress">
                                <div class="progress-bar" style="width: 59%">
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- ./inner -->
                    <div class="vector-img-one">
                        <img src="${pageContext.request.contextPath}/resources/img/vb3.png" alt="">
                    </div>
                    <div class="actions">
                        <ul>
                            <li><span class="js-btn-prev" title="BACK"><i class="fa fa-arrow-left"></i> BACK </span>
                            </li>
                            <li><span class="js-btn-next" title="NEXT">NEXT <i class="fa fa-arrow-right"></i></span>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- div 4 -->
            <div class="multisteps-form__panel" data-animation="slideHorz">
                <div class="wizard-forms">
                    <div class="inner pb-200 clearfix">
                        <div class="wizard-title text-center">
                            <h3>Please, complete those logical questions</h3>
                            <br>
                            <br>
                            <br>
                            <br>
                            <br>
                            <br>
                            <br>
                            <%--                            <label id="minutes">00</label>:<label id="seconds">00</label>--%>
                        </div>
                        <div class="wizard-form-input mb-60 mt-60" style="display: none;">
                            <div class="line line2"></div>
                        </div>
                        <div class="wizard-duration mb-60">
                            <span class="wizard-sub-text">What is part of a database that holds only one type of information?</span>
                            <div class="row">
                                <div class="col-md-3">
                                    <label class="duration-option">
                                        <input id="d1" onclick="saveAnswerFour(this.id,this.value)" type="radio" name="duration-service" value="Report" class="d-checkbox">
                                        <span class="checkbox-circle-tick"></span>
                                        <span class="duration-box text-center">
                                            <span>Report</span>
                                        </span>
                                    </label>
                                </div>
                                <div class="col-md-3">
                                    <label class="duration-option">
                                        <input id="d2" onclick="saveAnswerFour(this.id,this.value)" type="radio" name="duration-service" value="Field" class="d-checkbox">
                                        <span class="checkbox-circle-tick"></span>
                                        <span class="duration-box text-center">
                                            <span>Field</span>
                                        </span>
                                    </label>
                                </div>
                                <div class="col-md-3">
                                    <label class="duration-option">
                                        <input id="d3" onclick="saveAnswerFour(this.id,this.value)" type="radio" name="duration-service" value="Record" class="d-checkbox">
                                        <span class="checkbox-circle-tick"></span>
                                        <span class="duration-box text-center">
                                            <span>Record</span>
                                        </span>
                                    </label>
                                </div>
                                <div class="col-md-3">
                                    <label class="duration-option">
                                        <input id="d4" onclick="saveAnswerFour(this.id,this.value)" type="radio" name="duration-service" value="File" class="d-checkbox">
                                        <span class="checkbox-circle-tick"></span>
                                        <span class="duration-box text-center">
                                            <span>File</span>
                                        </span>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="wizard-v3-progress">
                            <span>4 to 5 step</span>
                            <h3>79% to complete</h3>
                            <div class="progress">
                                <div class="progress-bar" style="width: 79%">
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.inner -->
                    <div class="vector-img-one">
                        <img src="${pageContext.request.contextPath}/resources/img/vb3.png" alt="">
                    </div>
                    <div class="actions">
                        <ul>
                            <li><span class="js-btn-prev" title="BACK"><i class="fa fa-arrow-left"></i> BACK </span>
                            </li>
                            <li><span class="js-btn-next" title="NEXT">NEXT <i class="fa fa-arrow-right"></i></span>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- div 5 -->
            <div class="multisteps-form__panel" data-animation="slideHorz">
                <div class="wizard-forms">
                    <div class="inner pb-100">
                        <div class="wizard-title text-center">
                            <h3>Please, complete those logical questions</h3>
                            <br>
                            <br>
                            <br>
                            <br>
                            <br>
                            <br>
                            <br>
                            <%--                            <label id="minutes">00</label>:<label id="seconds">00</label>--%>
                        </div>
                        <div class="wizard-form-input mb-60 mt-60" style="display: none;">
                            <div class="line line2"></div>
                        </div>
                        <div class="wizard-duration mb-60">

                            <span class="wizard-sub-text">'DB' computer abbreviation usually means ?</span>
                            <div class="row">
                                <div class="col-md-3">
                                    <label class="duration-option">
                                        <input id="e1" onclick="saveAnswerFive(this.id,this.value)" type="radio" name="duration-service" value="Database" class="d-checkbox">
                                        <span class="checkbox-circle-tick"></span>
                                        <span class="duration-box text-center">
                                            <span>Database</span>
                                        </span>
                                    </label>
                                </div>
                                <div class="col-md-3">
                                    <label class="duration-option">
                                        <input id="e2" onclick="saveAnswerFive(this.id,this.value)" type="radio" name="duration-service" value="Double Byte" class="d-checkbox">
                                        <span class="checkbox-circle-tick"></span>
                                        <span class="duration-box text-center">
                                            <span>Double Byte</span>
                                        </span>
                                    </label>
                                </div>
                                <div class="col-md-3">
                                    <label class="duration-option">
                                        <input id="e3" onclick="saveAnswerFive(this.id,this.value)" type="radio" name="duration-service" value="Data Block" class="d-checkbox">
                                        <span class="checkbox-circle-tick"></span>
                                        <span class="duration-box text-center">
                                            <span>Data Block</span>
                                        </span>
                                    </label>
                                </div>
                                <div class="col-md-3">
                                    <label class="duration-option">
                                        <input id="e4" onclick="saveAnswerFive(this.id,this.value)" type="radio" name="duration-service" value="Driver Boot" class="d-checkbox">
                                        <span class="checkbox-circle-tick"></span>
                                        <span class="duration-box text-center">
                                            <span>Driver Boot</span>
                                        </span>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="wizard-v3-progress">
                            <span>5 to 5 step</span>
                            <h3>100% to complete</h3>
                            <div class="progress">
                                <div class="progress-bar" style="width: 100%">
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.inner -->
                    <div class="vector-img-one position-relative">
                        <img src="${pageContext.request.contextPath}/resources/img/vb3.png" alt="">
                    </div>
                    <div class="actions mt-60">
                        <ul>
                            <%--                            <li><span class="js-btn-prev" title="BACK"><i class="fa fa-arrow-left"></i> BACK </span>--%>
                            <%--                            </li>--%>
                            <%--                            <li>--%>
                            <%--                                <button onclick="validateAnswersForLessonOne()" title="NEXT">SUBMIT <i class="fa fa-arrow-right"></i></button>--%>
                            <%--                            </li>--%>

                            <li><span class="js-btn-prev" title="BACK"><i class="fa fa-arrow-left"></i> BACK </span></li>
                            <li><span onclick="validateAnswersForLessonOne()" class="js-btn-next" title="NEXT">SUBMIT <i class="fa fa-arrow-right"></i></span></li>

                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </form>

</div>
<script src="${pageContext.request.contextPath}/resources/js/neonWizard/b5/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/neonWizard/b5/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/neonWizard/b5/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/neonWizard/b5/slick.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/neonWizard/b5/main.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/neonWizard/b5/switch.js"></script>

</body>
</html>
