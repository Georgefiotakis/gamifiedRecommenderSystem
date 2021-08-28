<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <title>Technology Literacy</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
    <title>Technology Orientation</title>

    <!-- Favicons -->
<%--    <link href="img/favicon.png" rel="icon">--%>
<%--    <link href="img/apple-touch-icon.png" rel="apple-touch-icon">--%>

    <!-- Bootstrap core CSS -->
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <!--external css-->
    <link href="http://netdna.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/zabuto_calendar.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/jquery.gritter.css" />
    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/resources/css/dashboard-style.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/style-responsive.css" rel="stylesheet">
    <script src="https://cdn.amcharts.com/lib/4/core.js"></script>
    <script src="https://cdn.amcharts.com/lib/4/charts.js"></script>
    <script src="https://cdn.amcharts.com/lib/4/themes/animated.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/Chart.js"></script>
<%--    <script src="${pageContext.request.contextPath}/resources/js/achievements.js"></script>--%>
    <script src="${pageContext.request.contextPath}/resources/js/dashboard.js"></script>
</head>
<style>
    .pull-center h6 {
        padding-top: 30px;
    }

    #categoryOneDiv, #catOneQuizTwo, #catOneQuizThree, #categoryTwoDiv, #catTwoQuizOne,#catTwoQuizTwo, #catTwoQuizThree ,#categoryThreeDiv, #catThreeQuizOne,#catThreeQuizTwo,#catThreeQuizThree , #categoryFourDiv, #catFourQuizOne, #catFourQuizTwo, #catFourQuizThree {
        pointer-events:none;
        opacity: 0.2;
    }

    #userLeaderboardDiv {
        width: 100%;
        height: 750px;
    }

    #Myimg{
        margin:0 auto;
        /*background: #ccc;*/
        /*border: 1px solid #000;*/
        padding: 9px;
    }

    #Myimg:hover {
        cursor: pointer;
    }

    .w3-border-red, .w3-hover-border-red:hover {
        border-color: #4158d0 !important;
    }

    .modal-full {
        min-width: 100%;
        margin: 0;
    }

    .modal-full .modal-content {
        min-height: 100vh;
    }

    #tomMenuOptions a {
        color: white!important;
    }

    #tomMenuOptions a:hover {
        color: #4158d0!important;
    }

</style>

<body>
<section id="container">

<%--    <div class="hiddenValuesForLessons" style="display: none">--%>
<%--        <h4 class="c1l1" value="<c:out value="${categoryOneLessonOne}"/>"><c:out value="${categoryOneLessonOne}"/></h4>--%>
<%--        <h4 class="c1l2" value="<c:out value="${categoryOneLessonTwo}"/>"><c:out value="${categoryOneLessonTwo}"/></h4>--%>
<%--        <h4 class="c1l3" value="<c:out value="${categoryOneLessonThree}"/>"><c:out value="${categoryOneLessonThree}"/></h4>--%>

<%--        <h4 class="c2l1" value="<c:out value="${categoryTwoLessonOne}"/>"><c:out value="${categoryTwoLessonOne}"/></h4>--%>
<%--        <h4 class="c2l2" value="<c:out value="${categoryTwoLessonTwo}"/>"><c:out value="${categoryTwoLessonTwo}"/></h4>--%>
<%--        <h4 class="c2l3" value="<c:out value="${categoryTwoLessonThree}"/>"><c:out value="${categoryTwoLessonThree}"/></h4>--%>

<%--        <h4 class="c3l1" value="<c:out value="${categoryThreeLessonOne}"/>"><c:out value="${categoryThreeLessonOne}"/></h4>--%>
<%--        <h4 class="c3l2" value="<c:out value="${categoryThreeLessonTwo}"/>"><c:out value="${categoryThreeLessonTwo}"/></h4>--%>
<%--        <h4 class="c3l3" value="<c:out value="${categoryThreeLessonThree}"/>"><c:out value="${categoryThreeLessonThree}"/></h4>--%>

<%--        <h4 class="c4l1" value="<c:out value="${categoryFourLessonOne}"/>"><c:out value="${categoryFourLessonOne}"/></h4>--%>
<%--        <h4 class="c4l2" value="<c:out value="${categoryFourLessonTwo}"/>"><c:out value="${categoryFourLessonTwo}"/></h4>--%>
<%--        <h4 class="c4l3" value="<c:out value="${categoryFourLessonThree}"/>"><c:out value="${categoryFourLessonThree}"/></h4>--%>
<%--    </div>--%>

<%--     My modal --%>
    <div class="modal fade" id="Mymodal">
        <div class="modal-dialog modal-full">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">×</button>
                    <h4 class="modal-title">

                    </h4>
                </div>
                <div class="modal-body">
                    <div class="w3-container">
                        <h2>Take a lesson before take a Quiz</h2>

                        <div class="w3-row">
                            <a href="javascript:void(0)" onclick="openCity(event, 'London');">
                                <div class="w3-quarter tablink w3-bottombar w3-hover-light-grey w3-padding">Critical Thinking</div>
                            </a>
                            <a href="javascript:void(0)" onclick="openCity(event, 'Paris');">
                                <div class="w3-quarter tablink w3-bottombar w3-hover-light-grey w3-padding w3-disabled">Social media</div>
                            </a>
                            <a href="javascript:void(0)" onclick="openCity(event, 'Tokyo');">
                                <div class="w3-quarter tablink w3-bottombar w3-hover-light-grey w3-padding w3-disabled">Information Management</div>
                            </a>
                            <a href="javascript:void(0)" onclick="openCity(event, 'Amsterdam');">
                                <div class="w3-quarter tablink w3-bottombar w3-hover-light-grey w3-padding w3-disabled">Creativity</div>
                            </a>
                        </div>

                        <div id="London" class="w3-container city" style="display:none">
<%--                            <h2>London</h2>--%>
<%--                            <p>London is the capital city of England.</p>--%>
                            <button onclick="enableNext(categoryOneDiv)" type="button" class="btn btn-primary" data-dismiss="modal">I'm ready</button>
                        </div>

                        <div id="Paris" class="w3-container city" style="display:none">
                            <h2>Paris</h2>
                            <p>Paris is the capital of France.</p>
                            <button onclick="enableNext(categoryOneDiv)" type="button" class="btn btn-primary" data-dismiss="modal">I'm ready</button>
                        </div>

                        <div id="Tokyo" class="w3-container city" style="display:none">
                            <h2>Tokyo</h2>
                            <p>Tokyo is the capital of Japan.</p>
                            <button onclick="enableNext(categoryOneDiv)" type="button" class="btn btn-primary" data-dismiss="modal">I'm ready</button>
                        </div>

                        <div id="Amsterdam" class="w3-container city" style="display:none">
                            <h2>Tokyo</h2>
                            <p>Amsterdam is the capital of Netherlands.</p>
                            <button onclick="enableNext(categoryOneDiv)" type="button" class="btn btn-primary" data-dismiss="modal">I'm ready</button>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
<%--                    <button onclick="enableNext(categoryOneDiv)" type="button" class="btn btn-default" data-dismiss="modal">I'm ready</button>--%>
                </div>
            </div>
        </div>
    </div>

<%--    --%>

    <header class="header black-bg">
        <div class="sidebar-toggle-box">
            <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
        </div>
        <a href="./dashboard" class="logo"><b>TECHNOLOGY<span>LITERACY</span></b></a>
        <div class="nav notify-row" id="top_menu">
            <ul id="tomMenuOptions" class="nav top-menu">
                <li>
                    <a>
                        <i class="fa fa-user fa-lg"></i> XP points : <c:out value="${currentUserCoins}"/>
                        <div style="display: none" class="hiddenUserXP"value="<c:out value="${currentUserCoins}"/>"> <c:out value="${currentUserCoins}"/> </div>
                        <div style="display: none" class="hiddenUserLevel"value="<c:out value="${currentUserLevel}"/>"> <c:out value="${currentUserLevel}"/> </div>
                    </a>
                </li>

                <li>
                    <a>
                        <i class="fa fa-star fa-lg"></i> Stars : <c:out value="${currentUserLevel}"/>
                    </a>
                </li>
                <li id="header_inbox_bar" class="dropdown">
                    <a id="achievementArgs" href="./achievement">
                        <i class="fa fa-trophy fa-lg"></i> Achievements
                    </a>

                </li>
                <li id="header_notification_bar" class="dropdown">
                    <a href="./analytics">
                        <i class="fa fa-bar-chart fa-lg"></i> Analytics
                    </a>
                </li>
                <li class="dropdown">
                    <a href="#">
                        <i class="fa fa-bullseye fa-lg"></i> Your Current Goal : <c:out value="${currentStudentGoal}"/>
                    </a>
                </li>
                <li class="dropdown">
                    <a href="./leaderboard">
                        <i class="fa fa-table fa-lg"></i> Leaderboard
                    </a>
                </li>
            </ul>
        </div>
        <div class="top-menu">
            <ul class="nav pull-right top-menu">
                <li><a class="logoutButton" href="./logout">Logout</a></li>
            </ul>
        </div>
    </header>
    <aside>
        <div id="sidebar" class="nav-collapse ">
            <!-- sidebar menu start-->
            <ul class="sidebar-menu" id="nav-accordion">
                <p class="centered"><a href="profile.html"></a></p>
                <h5 class="centered"><c:out value="${currentFirstName}"/></h5>

                <li class="mt">
                    <a class="active" href="./dashboard">
                        <i class="fa fa-user fa-lg"></i>
                        <c:out value="${currentUsername}"/>
                    </a>
                </li>
                <li class="mt">
                    <a class="active">
                        <i class="fa fa-envelope fa-lg"></i>
                        <c:out value="${currentStudentEmail}"/>
                    </a>
                </li>
                <li class="mt">
                    <a class="active">
                        <i class="fa fa-transgender fa-lg"></i>
                        <span><c:out value="${currentGender}"/></span>
                    </a>
                </li>
                <li class="mt">
                    <a class="active">
                        <i class="fa fa-birthday-cake fa-lg"></i>
                        <span><c:out value="${currentAge}"/></span>
                    </a>
                </li>
                <li class="mt">
                    <a class="active">
                        <i class="fa fa-globe fa-lg"></i>
                        <span><c:out value="${currentCountry}"/></span>
                    </a>
                </li>
            </ul>
            <!-- sidebar menu end-->
        </div>
    </aside>
    <!--sidebar end-->
    <!-- **********************************************************************************************************************************************************
        MAIN CONTENT
        *********************************************************************************************************************************************************** -->
    <!--main content start-->
    <section id="main-content">
        <section class="wrapper">
            <div class="row">
                <div class="col-lg-9 main-chart">
                    <div class="latLongDiv" style="display: none">
                        <h4 class="lessonOneCompleted" value="<c:out value="${lessonOneCompleted}"/>"><c:out
                                value="${lessonOneCompleted}"/></h4>
                        <h4 class="userCoins" value="<c:out value="${userCoins}"/>"><c:out value="${userCoins}"/></h4>
                    </div>
                    <div class="row mt">
                        <div class="col-md-12">
                            <div class="white-panel pn">
                                <div href="./categoryOne" class="white-header">
                                    <h5><a style="color: #4158d0;font-weight: bold" href="#"> Lessons </a><small class="text-muted">(Be prepared about each Quiz.)</small></h5>
                                </div>
                                <body>
                                    <img id="Myimg" src="${pageContext.request.contextPath}/resources/img/textbookGIF.gif" style="width:120px;height:120px;border-radius: 50%">
                                </body>
                                <footer>
                                    <div class="pull-center">
                                        <h6><small class="text-muted">(Complete a lesson before take the quiz)</small></h6>
                                    </div>
                                </footer>
                            </div>
                        </div>
                    </div>

                    <div class="row mt">
                        <div class="col-md-6 col-sm-6 mb" id="categoryOneDiv">
<%--                            <div class="row">--%>
<%--                                <div class="col-md-6">--%>
                                    <div class="white-panel pn">
                                        <div class="white-header">
                                            <h5 style="color: #4158d0;font-weight: bold"> Critical Thinking </h5>
                                        </div>
                                        <div class="row lessonOneQuizzes">
                                            <div id="catOneQuizOne" class="col-md-4">
                                                <h6> Quiz One </h6>
                                                <a href="./categoryOneQuizOne">
                                                    <img id="c1quizOneId" src="${pageContext.request.contextPath}/resources/img/l1q1.webp" style="width:80px;height:80px;">
                                                </a>
                                            </div>
                                            <div id="catOneQuizTwo" class="col-md-4">
                                                <h6> Quiz Two </h6>
                                                <a href="./categoryOneQuizTwo">
                                                    <img id="c1quizTwoId" src="${pageContext.request.contextPath}/resources/img/l2q2.png" style="width:80px;height:80px;">
                                                </a>
                                            </div>
                                            <div id="catOneQuizThree" class="col-md-4">
                                                <h6> Quiz Three </h6>
                                                <a href="./categoryOneQuizThree">
                                                    <img id="c1quizThreeId" src="${pageContext.request.contextPath}/resources/img/lOneQThree.png" style="width:80px;height:80px;">
                                                </a>
                                            </div>
                                        </div>
                                        <footer>
                                            <div class="pull-center categoryOneFooter">
<%--                                                <c:if test="${lessonOneCompleted eq true}">--%>
<%--                                                    <h6> Quiz completed : 1 /3 </h6>--%>
<%--                                                </c:if>--%>
<%--                                                <c:if test="${lessonOneCompleted eq true}">--%>
<%--                                                    <h6> Quiz completed : 2 /3 </h6>--%>
<%--                                                </c:if>--%>
<%--                                                <c:if test="${lessonOneCompleted eq true}">--%>
<%--                                                    <h6> Quiz completed : 3 /3 </h6>--%>
<%--                                                </c:if>--%>
<%--                                                <h6> Quiz completed : 0 /3 </h6>--%>
                                            </div>
                                        </footer>
                                    </div>
                                </div>
                        <div class="col-md-6 col-sm-6 mb" id="categoryTwoDiv">
                            <div class="white-panel pn">
                                <div class="white-header">
                                    <h6 style="color: #4158d0;font-weight: bold">Social Media <small class="text-muted">(Two stars are required to unlock that category)</small></h6>
                                </div>
                                <div class="row lessonOneQuizzes">
                                    <div id="catTwoQuizOne" class="col-md-4">
                                        <h6> Quiz One </h6>
                                        <a href="./categoryTwoQuizOne">
                                            <img id="c2quizOneId" src="${pageContext.request.contextPath}/resources/img/sm1.png" style="width:80px;height:80px;">
                                        </a>
                                    </div>
                                    <div id="catTwoQuizTwo" class="col-md-4">
                                        <h6> Quiz Two </h6>
                                        <a href="./categoryTwoQuizTwo">
                                            <img id="c2quizTwoId" src="${pageContext.request.contextPath}/resources/img/sm2.png" style="width:80px;height:80px;">
                                        </a>
                                    </div>
                                    <div id="catTwoQuizThree" class="col-md-4">
                                        <h6> Quiz Three </h6>
                                        <a href="./categoryTwoQuizThree">
                                            <img id="c2quizThreeId" src="${pageContext.request.contextPath}/resources/img/sm3.png" style="width:80px;height:80px;">
                                        </a>
                                    </div>
                                </div>
                                <%--                                <p>April 17, 2014</p>--%>
                                <footer>
                                    <div class="pull-center categoryTwoFooter">
<%--                                        <c:if test="${lessonOneCompleted eq true}">--%>
<%--                                            <h6> Lessons completed : 1 /3 </h6>--%>
<%--                                        </c:if>--%>
<%--                                        <c:if test="${lessonOneCompleted eq true}">--%>
<%--                                            <h6> Lessons completed : 2 /3 </h6>--%>
<%--                                        </c:if>--%>
<%--                                        <c:if test="${lessonOneCompleted eq true}">--%>
<%--                                            <h6> Lessons completed : 3 /3 </h6>--%>
<%--                                        </c:if>--%>
<%--                                        <h6> Lessons completed : 0 /3 </h6>--%>
                                    </div>
                                </footer>
                            </div>
                            <!--  /darkblue panel -->
                        </div>
                        <div class="col-md-6 col-sm-6 mb" id="categoryThreeDiv">
                            <div class="white-panel pn">
                                <div class="white-header">
                                    <h6 style="color: #4158d0;font-weight: bold"> Information Management <small class="text-muted">(Three stars are required to unlock that category)</small></h6>
                                </div>
                                <div class="row lessonOneQuizzes">
                                    <div id="catThreeQuizOne" class="col-md-4">
                                        <h6> Quiz One </h6>
                                        <a href="./categoryThreeQuizOne">
                                            <img id="c3quizOneId" src="${pageContext.request.contextPath}/resources/img/ia1.png" style="width:80px;height:80px;">
                                        </a>
                                    </div>
                                    <div id="catThreeQuizTwo" class="col-md-4">
                                        <h6> Quiz Two </h6>
                                        <a href="./categoryThreeQuizTwo">
                                            <img id="c3quizTwoId" src="${pageContext.request.contextPath}/resources/img/ia2.png" style="width:80px;height:80px;">
                                        </a>
                                    </div>
                                    <div id="catThreeQuizThree" class="col-md-4">
                                        <h6> Quiz Three </h6>
                                        <a href="./categoryThreeQuizThree">
                                            <img id="c3quizThreeId" src="${pageContext.request.contextPath}/resources/img/ia3.png" style="width:80px;height:80px;">
                                        </a>
                                    </div>
                                </div>

                                <footer>
                                    <div class="pull-center categoryThreeFooter">
<%--                                        <c:if test="${lessonOneCompleted eq true}">--%>
<%--                                            <h6> Lessons completed : 1 /3 </h6>--%>
<%--                                        </c:if>--%>
<%--                                        <c:if test="${lessonOneCompleted eq true}">--%>
<%--                                            <h6> Lessons completed : 2 /3 </h6>--%>
<%--                                        </c:if>--%>
<%--                                        <c:if test="${lessonOneCompleted eq true}">--%>
<%--                                            <h6> Lessons completed : 3 /3 </h6>--%>
<%--                                        </c:if>--%>
<%--                                        <h6> Lessons completed : 0 /3 </h6>--%>
                                    </div>
                                </footer>
                            </div>
                            <!--  /darkblue panel -->
                        </div>
                        <div class="col-md-6 col-sm-6 mb" id="categoryFourDiv">
                            <div class="white-panel pn">
                                <div class="white-header">
                                    <h6 style="color: #4158d0;font-weight: bold"> Creativity <small class="text-muted">(Four stars are required to unlock that category)</small></h6>
                                </div>
                                <div class="row lessonOneQuizzes">
                                    <div id="catFourQuizOne" class="col-md-4">
                                        <h6> Quiz One </h6>
                                        <a href="./categoryFourQuizOne">
                                            <img id="c4quizOneId" src="${pageContext.request.contextPath}/resources/img/cr1.png" style="width:80px;height:80px;">
                                        </a>
                                    </div>
                                    <div id="catFourQuizTwo" class="col-md-4">
                                        <h6> Quiz Two </h6>
                                        <a href="./categoryFourQuizTwo">
                                            <img id="c4quizTwoId" src="${pageContext.request.contextPath}/resources/img/cr2.png" style="width:80px;height:80px;">
                                        </a>
                                    </div>
                                    <div id="catFourQuizThree" class="col-md-4">
                                        <h6> Quiz Three </h6>
                                        <a href="./categoryFourQuizThree">
                                            <img id="c4quizThreeId" src="${pageContext.request.contextPath}/resources/img/cr3.png" style="width:80px;height:80px;">
                                        </a>
                                    </div>
                                </div>

                                <%--                                <p>April 17, 2014</p>--%>
                                <footer>
                                    <div class="pull-center categoryFourFooter">
<%--                                        <c:if test="${lessonOneCompleted eq true}">--%>
<%--                                            <h6> Lessons completed : 1 /3 </h6>--%>
<%--                                        </c:if>--%>
<%--                                        <c:if test="${lessonOneCompleted eq true}">--%>
<%--                                            <h6> Lessons completed : 2 /3 </h6>--%>
<%--                                        </c:if>--%>
<%--                                        <c:if test="${lessonOneCompleted eq true}">--%>
<%--                                            <h6> Lessons completed : 3 /3 </h6>--%>
<%--                                        </c:if>--%>
<%--                                        <h6> Lessons completed : 0 /3 </h6>--%>
                                    </div>
                                </footer>
                            </div>
                            <!--  /darkblue panel -->
                        </div>
                    </div>
                    <!-- /row -->
                </div>
                <!-- /col-lg-9 END SECTION MIDDLE -->
                <!-- **********************************************************************************************************************************************************
                    RIGHT SIDEBAR CONTENT
                    *********************************************************************************************************************************************************** -->
                <div class="col-lg-3 ds">
                    <!--COMPLETED ACTIONS DONUTS CHART-->
                    <div class="donut-main">
                        <h4 style="color: #5425ff">USERS' LEADERBOARD</h4>
                        <div id="userLeaderboardDiv"></div>
                        <canvas id="newchart" height="130" width="130"></canvas>
                        <%--                        <script>--%>
                        <%--                            var doughnutData = [{--%>
                        <%--                                value: 33,--%>
                        <%--                                color: "#4ECDC4"--%>
                        <%--                            },--%>
                        <%--                                {--%>
                        <%--                                    value: 33,--%>
                        <%--                                    color: "#fdfdfd"--%>
                        <%--                                }--%>
                        <%--                            ];--%>
                        <%--                            var myDoughnut = new Chart(document.getElementById("newchart").getContext("2d")).Doughnut(doughnutData);--%>
                        <%--                        </script>--%>
                    </div>
                    <!--NEW EARNING STATS -->
                    <%--                    <div class="panel terques-chart">--%>
                    <%--                        <div class="panel-body">--%>
                    <%--                            <div class="chart">--%>
                    <%--                                <div class="centered">--%>
                    <%--                                    <span>PROGRESS OF YOUR XP</span>--%>
                    <%--                                    <strong>$ 890,00 | 15%</strong>--%>
                    <%--                                </div>--%>
                    <%--                                <br>--%>
                    <%--&lt;%&ndash;                                <div class="sparkline" data-type="line" data-resize="true" data-height="75" data-width="90%" data-line-width="1" data-line-color="#fff" data-spot-color="#fff" data-fill-color="" data-highlight-line-color="#fff" data-spot-radius="4" data-data="[200,135,667,333,526,996,564,123,890,564,455]"></div>&ndash;%&gt;--%>
                    <%--                            </div>--%>
                    <%--                        </div>--%>
                    <%--                    </div>--%>
                    <!--new earning end-->
                    <!-- RECENT ACTIVITIES SECTION -->
                    <%--                    <h4 class="centered mt">RECENT ACTIVITY</h4>--%>
                    <!-- First Activity -->
                    <div class="desc">
                        <div class="thumb">
                            <%--                            <span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>--%>
                        </div>
                        <div class="details">
                            <%--                            <p>--%>
                            <%--                                <muted>Just Now</muted>--%>
                            <%--                                <br/>--%>
                            <%--                                <a href="#">Paul Rudd</a> purchased an item.<br/>--%>
                            <%--                            </p>--%>
                        </div>
                    </div>
                    <!-- Second Activity -->
                    <div class="desc">
                        <div class="thumb">
                            <%--                            <span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>--%>
                        </div>
                        <div class="details">
                            <%--                            <p>--%>
                            <%--                                <muted>2 Minutes Ago</muted>--%>
                            <%--                                <br/>--%>
                            <%--                                <a href="#">James Brown</a> subscribed to your newsletter.<br/>--%>
                            <%--                            </p>--%>
                        </div>
                    </div>
                    <!-- Third Activity -->
                    <div class="desc">
                        <div class="thumb">
                            <%--                            <span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>--%>
                        </div>
                        <div class="details">
                            <%--                            <p>--%>
                            <%--                                <muted>3 Hours Ago</muted>--%>
                            <%--                                <br/>--%>
                            <%--                                <a href="#">Diana Kennedy</a> purchased a year subscription.<br/>--%>
                            <%--                            </p>--%>
                        </div>
                    </div>
                    <!-- Fourth Activity -->
                    <div class="desc">
                        <div class="thumb">
                            <%--                            <span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>--%>
                        </div>
                        <div class="details">
                            <%--                            <p>--%>
                            <%--                                <muted>7 Hours Ago</muted>--%>
                            <%--                                <br/>--%>
                            <%--                                <a href="#">Brando Page</a> purchased a year subscription.<br/>--%>
                            <%--                            </p>--%>
                        </div>
                    </div>
                    <!-- USERS ONLINE SECTION -->
                    <%--                    <h4 class="centered mt">TEAM MEMBERS ONLINE</h4>--%>
                    <!-- First Member -->
                    <div class="desc">
                        <div class="thumb">
                            <%--                            <img class="img-circle" src="img/ui-divya.jpg" width="35px" height="35px" align="">--%>
                        </div>
                        <div class="details">
                            <%--                            <p>--%>
                            <%--                                <a href="#">DIVYA MANIAN</a><br/>--%>
                            <%--                                <muted>Available</muted>--%>
                            <%--                            </p>--%>
                        </div>
                    </div>
                    <!-- Second Member -->
                    <div class="desc">
                        <div class="thumb">
                            <%--                            <img class="img-circle" src="img/ui-sherman.jpg" width="35px" height="35px" align="">--%>
                        </div>
                        <div class="details">
                            <%--                            <p>--%>
                            <%--                                <a href="#">DJ SHERMAN</a><br/>--%>
                            <%--                                <muted>I am Busy</muted>--%>
                            <%--                            </p>--%>
                        </div>
                    </div>
                    <!-- Third Member -->
                    <div class="desc">
                        <div class="thumb">
                            <%--                            <img class="img-circle" src="img/ui-danro.jpg" width="35px" height="35px" align="">--%>
                        </div>
                        <div class="details">
                            <%--                            <p>--%>
                            <%--                                <a href="#">DAN ROGERS</a><br/>--%>
                            <%--                                <muted>Available</muted>--%>
                            <%--                            </p>--%>
                        </div>
                    </div>
                    <!-- Fourth Member -->
                    <div class="desc">
                        <div class="thumb">
                            <%--                            <img class="img-circle" src="img/ui-zac.jpg" width="35px" height="35px" align="">--%>
                        </div>
                        <div class="details">
                            <%--                            <p>--%>
                            <%--                                <a href="#">Zac Sniders</a><br/>--%>
                            <%--                                <muted>Available</muted>--%>
                            <%--                            </p>--%>
                        </div>
                    </div>
                    <!-- CALENDAR-->
                    <div id="calendar" class="mb">
                        <div class="panel green-panel no-margin">
                            <div class="panel-body">
                                <%--                                <div id="date-popover" class="popover top" style="cursor: pointer; disadding: block; margin-left: 33%; margin-top: -50px; width: 175px;">--%>
                                <%--                                    <div class="arrow"></div>--%>
                                <%--                                    <h3 class="popover-title" style="disadding: none;"></h3>--%>
                                <%--                                    <div id="date-popover-content" class="popover-content"></div>--%>
                                <%--                                </div>--%>
                                <%--                                <div id="my-calendar"></div>--%>
                            </div>
                        </div>
                    </div>
                    <!-- / calendar -->
                </div>
                <!-- /col-lg-3 -->
            </div>
            <!-- /row -->
        </section>
    </section>
    <!--main content end-->
    <!--footer start-->
<%--    <footer class="site-footer">--%>
<%--        <div class="text-center">--%>
<%--            <p>--%>
<%--                &copy; Copyrights <strong>Dashio</strong>. All Rights Reserved--%>
<%--            </p>--%>
<%--            <div class="credits">--%>
<%--                <!----%>
<%--                  You are NOT allowed to delete the credit link to TemplateMag with free version.--%>
<%--                  You can delete the credit link only if you bought the pro version.--%>
<%--                  Buy the pro version with working PHP/AJAX contact form: https://templatemag.com/dashio-bootstrap-admin-template/--%>
<%--                  Licensing information: https://templatemag.com/license/--%>
<%--                -->--%>
<%--                Created with Dashio template by <a href="https://templatemag.com/">TemplateMag</a>--%>
<%--            </div>--%>
<%--            <a href="index.html#" class="go-top">--%>
<%--                <i class="fa fa-angle-up"></i>--%>
<%--            </a>--%>
<%--        </div>--%>
<%--    </footer>--%>
    <!--footer end-->
</section>
<!-- js placed at the end of the document so the pages load faster -->
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>

<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script class="include" type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.dcjqaccordion.2.7.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.scrollTo.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.nicescroll.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.sparkline.js"></script>
<!--common script for all pages-->
<script src="${pageContext.request.contextPath}/resources/js/common-scripts.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.gritter.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/gritter-conf.js"></script>
<!--script for this page-->
<script src="${pageContext.request.contextPath}/resources/js/sparkline-chart.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/zabuto_calendar.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
        var unique_id = $.gritter.add({
            // (string | mandatory) the heading of the notification
            title: 'Welcome to Dashio!',
            // (string | mandatory) the text inside the notification
            text: 'Hover me to enable the Close Button. You can hide the left sidebar clicking on the button next to the logo.',
            // (string | optional) the image to display on the left
            image: 'img/ui-sam.jpg',
            // (bool | optional) if you want it to fade out on its own or just sit there
            sticky: false,
            // (int | optional) the time you want it to be alive for before fading out
            time: 8000,
            // (string | optional) the class name you want to apply to that specific message
            class_name: 'my-sticky-class'
        });

        return false;
    });
</script>
<%--<script type="application/javascript">--%>
<%--    $(document).ready(function() {--%>

<%--        createLeaderboard();--%>

<%--        // $("#date-popover").popover({--%>
<%--        //     html: true,--%>
<%--        //     trigger: "manual"--%>
<%--        // });--%>
<%--        // $("#date-popover").hide();--%>
<%--        // $("#date-popover").click(function(e) {--%>
<%--        //     $(this).hide();--%>
<%--        // });--%>

<%--        // $("#my-calendar").zabuto_calendar({--%>
<%--        //     action: function() {--%>
<%--        //         return myDateFunction(this.id, false);--%>
<%--        //     },--%>
<%--        //     action_nav: function() {--%>
<%--        //         return myNavFunction(this.id);--%>
<%--        //     },--%>
<%--        //     ajax: {--%>
<%--        //         url: "show_data.php?action=1",--%>
<%--        //         modal: true--%>
<%--        //     },--%>
<%--        //     legend: [{--%>
<%--        //         type: "text",--%>
<%--        //         label: "Special event",--%>
<%--        //         badge: "00"--%>
<%--        //     },--%>
<%--        //         {--%>
<%--        //             type: "block",--%>
<%--        //             label: "Regular event",--%>
<%--        //         }--%>
<%--        //     ]--%>
<%--        // });--%>



<%--    });--%>

<%--    // function myNavFunction(id) {--%>
<%--    //     $("#date-popover").hide();--%>
<%--    //     var nav = $("#" + id).data("navigation");--%>
<%--    //     var to = $("#" + id).data("to");--%>
<%--    //     console.log('nav ' + nav + ' to: ' + to.month + '/' + to.year);--%>
<%--    // }--%>
<%--</script>--%>
</body>