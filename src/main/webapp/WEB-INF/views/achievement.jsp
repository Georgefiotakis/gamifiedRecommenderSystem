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
    <script src="${pageContext.request.contextPath}/resources/js/achievements.js"></script>
</head>
<style>
    .pull-center h6 {
        padding-top: 30px;
    }

    /*#categoryOneDiv, #catOneQuizTwo, #catOneQuizThree, #categoryTwoDiv, #categoryThreeDiv, #categoryFourDiv  {*/
    /*    pointer-events:none;*/
    /*    opacity: 0.4;*/
    /*}*/

    #userLeaderboardDiv {
        width: 100%;
        height: 1000px;
    }

    #progressbar {
        background-color: black;
        border-radius: 13px;
        /* (height of inner div) / 2 + padding */
        padding: 3px;
        width: 70%;
        margin-left: auto;
        margin-right: auto;
        position: relative;
        top: 20px;
    }

    #progressbar>div {
        background-color: #20cb25;
        width: 33%;
        height: 13px;
        border-radius: 10px;
    }

</style>

<body>
<section id="container">


    <header class="header black-bg">
        <div class="sidebar-toggle-box">
            <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
        </div>
        <a href="./dashboard" class="logo"><b>TECHNOLOGY<span>LITERACY</span></b></a>
        <div class="nav notify-row" id="top_menu">
            <ul id="tomMenuOptions" class="nav top-menu">
                <li id="header_inbox_bar" class="dropdown">
                    <a href="./achievement">
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
<%--            <ul class="sidebar-menu" id="nav-accordion">--%>
<%--                <p class="centered"><a href="profile.html"></a></p>--%>
<%--                <h5 class="centered"><c:out value="${currentFirstName}"/></h5>--%>

<%--                <li class="mt">--%>
<%--                    <a class="active" href="./dashboard">--%>
<%--                        <i class="fa fa-user fa-lg"></i>--%>
<%--                        <c:out value="${currentUsername}"/>--%>
<%--                    </a>--%>
<%--                </li>--%>
<%--                <li class="mt">--%>
<%--                    <a class="active">--%>
<%--                        <i class="fa fa-envelope fa-lg"></i>--%>
<%--                        <c:out value="${currentStudentEmail}"/>--%>
<%--                    </a>--%>
<%--                </li>--%>
<%--                <li class="mt">--%>
<%--                    <a class="active">--%>
<%--                        <i class="fa fa-transgender fa-lg"></i>--%>
<%--                        <span><c:out value="${currentGender}"/></span>--%>
<%--                    </a>--%>
<%--                </li>--%>
<%--                <li class="mt">--%>
<%--                    <a class="active">--%>
<%--                        <i class="fa fa-birthday-cake fa-lg"></i>--%>
<%--                        <span><c:out value="${currentAge}"/></span>--%>
<%--                    </a>--%>
<%--                </li>--%>
<%--                <li class="mt">--%>
<%--                    <a class="active">--%>
<%--                        <i class="fa fa-globe fa-lg"></i>--%>
<%--                        <span><c:out value="${currentCountry}"/></span>--%>
<%--                    </a>--%>
<%--                </li>--%>
<%--            </ul>--%>
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
<%--                    <div class="latLongDiv" style="display: none">--%>
<%--                        <h4 class="lessonOneCompleted" value="<c:out value="${lessonOneCompleted}"/>"><c:out--%>
<%--                                value="${lessonOneCompleted}"/></h4>--%>
<%--                        <h4 class="userCoins" value="<c:out value="${userCoins}"/>"><c:out value="${userCoins}"/></h4>--%>
<%--                    </div>--%>

                    <div class="row mt">
                        <div class="col-md-12">
                            <div class="white-panel pn">
                                <div href="./categoryOne" class="white-header">
                                    <h5><a style="color: #4158d0;font-weight: bold" href="#"> Checkout your Achievements </a></h5>
                                </div>
                                <body>
                                <img src="${pageContext.request.contextPath}/resources/img/achievements_banner.jpeg" style="width:700px;height:170px;">
                                </body>
<%--                                <footer>--%>
<%--                                    <div class="pull-center">--%>
<%--                                        <h6> Achievement bar </h6>--%>
<%--                                    </div>--%>
<%--                                </footer>--%>
                            </div>
                        </div>
                    </div>
                    <%--  Category 1                   --%>
                    <div class="row mt">
                        <div class="col-md-3"></div>
                        <div class="col-md-6">
                            <div class="white-panel pn">
                                <div href="./categoryOne" class="white-header">
                                    <h6><a style="color: #4158d0;font-weight: bold" href="#"> Overall Critical Thinking Quiz</a></h6>
                                </div>
                                <body>
                                <img  src="${pageContext.request.contextPath}/resources/img/textbook.png" style="width:120px;height:120px;">
                                </body>
                                <footer>
                                    <div id="progressbar2">
                                        <div></div>
                                    </div>
                                </footer>
                            </div>
                        </div>
                        <div class="col-md-3"></div>
                    </div>
                    <div class="row mt">
                        <div class="col-md-3">
                            <div class="white-panel pn">
                                <div href="./categoryOne" class="white-header">
                                    <h6><a style="color: #4158d0;font-weight: bold" href="#"> Overall Critical Thinking Quiz</a></h6>
                                </div>
                                <body>
                                <img id="Myimg" src="${pageContext.request.contextPath}/resources/img/textbook.png" style="width:120px;height:120px;">
                                </body>
                                <footer>
                                    <div id="progressbar">
                                        <div></div>
                                    </div>
                                </footer>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="white-panel pn">
                                <div href="./categoryOne" class="white-header">
                                    <h6><a style="color: #4158d0;font-weight: bold" href="#"> Social Media </a></h6>
                                </div>
                                <body>
                                <img id="Myimg2" src="${pageContext.request.contextPath}/resources/img/textbook.png" style="width:120px;height:120px;">
                                </body>
<%--                                <footer>--%>
<%--                                    <div class="pull-center">--%>
<%--                                        <h6> Achievement bar </h6>--%>
<%--                                    </div>--%>
<%--                                </footer>--%>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="white-panel pn">
                                <div href="./categoryOne" class="white-header">
                                    <h5><a style="color: #4158d0;font-weight: bold" href="#"> Information Management </a></h5>
                                </div>
                                <body>
                                <img id="Myimg3" src="${pageContext.request.contextPath}/resources/img/textbook.png" style="width:120px;height:120px;">
                                </body>
<%--                                <footer>--%>
<%--                                    <div class="pull-center">--%>
<%--                                        <h6> Achievement bar </h6>--%>
<%--                                    </div>--%>
<%--                                </footer>--%>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="white-panel pn">
                                <div href="./categoryOne" class="white-header">
                                    <h5><a style="color: #4158d0;font-weight: bold" href="#"> Creativity </a></h5>
                                </div>
                                <body>
                                <img id="Myimg4" src="${pageContext.request.contextPath}/resources/img/textbook.png" style="width:120px;height:120px;">
                                </body>
<%--                                <footer>--%>
<%--                                    <div class="pull-center">--%>
<%--                                        <h6> Achievement bar </h6>--%>
<%--                                    </div>--%>
<%--                                </footer>--%>
                            </div>
                        </div>
                    </div>
                    <%--  Category 2                   --%>
                    <div class="row mt">
                        <div class="col-md-3"></div>
                        <div class="col-md-6">
                            <div class="white-panel pn">
                                <div href="./categoryOne" class="white-header">
                                    <h6><a style="color: #4158d0;font-weight: bold" href="#"> Overall Critical Thinking Quiz</a></h6>
                                </div>
                                <body>
                                <img  src="${pageContext.request.contextPath}/resources/img/textbook.png" style="width:120px;height:120px;">
                                </body>
                                <footer>
                                    <div id="progressbar2">
                                        <div></div>
                                    </div>
                                </footer>
                            </div>
                        </div>
                        <div class="col-md-3"></div>
                    </div>
                    <div class="row mt">
                        <div class="col-md-3">
                            <div class="white-panel pn">
                                <div href="./categoryOne" class="white-header">
                                    <h6><a style="color: #4158d0;font-weight: bold" href="#"> Overall Critical Thinking Quiz</a></h6>
                                </div>
                                <body>
                                <img src="${pageContext.request.contextPath}/resources/img/textbook.png" style="width:120px;height:120px;">
                                </body>
                                <footer>
                                    <div id="progressbar3">
                                        <div></div>
                                    </div>
                                </footer>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="white-panel pn">
                                <div href="./categoryOne" class="white-header">
                                    <h6><a style="color: #4158d0;font-weight: bold" href="#"> Social Media </a></h6>
                                </div>
                                <body>
                                <img id="Myimg2" src="${pageContext.request.contextPath}/resources/img/textbook.png" style="width:120px;height:120px;">
                                </body>
                                <%--                                <footer>--%>
                                <%--                                    <div class="pull-center">--%>
                                <%--                                        <h6> Achievement bar </h6>--%>
                                <%--                                    </div>--%>
                                <%--                                </footer>--%>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="white-panel pn">
                                <div href="./categoryOne" class="white-header">
                                    <h5><a style="color: #4158d0;font-weight: bold" href="#"> Information Management </a></h5>
                                </div>
                                <body>
                                <img src="${pageContext.request.contextPath}/resources/img/textbook.png" style="width:120px;height:120px;">
                                </body>
                                <%--                                <footer>--%>
                                <%--                                    <div class="pull-center">--%>
                                <%--                                        <h6> Achievement bar </h6>--%>
                                <%--                                    </div>--%>
                                <%--                                </footer>--%>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="white-panel pn">
                                <div href="./categoryOne" class="white-header">
                                    <h5><a style="color: #4158d0;font-weight: bold" href="#"> Creativity </a></h5>
                                </div>
                                <body>
                                <img src="${pageContext.request.contextPath}/resources/img/textbook.png" style="width:120px;height:120px;">
                                </body>
                                <%--                                <footer>--%>
                                <%--                                    <div class="pull-center">--%>
                                <%--                                        <h6> Achievement bar </h6>--%>
                                <%--                                    </div>--%>
                                <%--                                </footer>--%>
                            </div>
                        </div>
                    </div>

<%--                    <div class="row mt">--%>
<%--                        <div class="col-md-6 col-sm-6 mb" id="categoryOneDiv">--%>
<%--                            &lt;%&ndash;                            <div class="row">&ndash;%&gt;--%>
<%--                            &lt;%&ndash;                                <div class="col-md-6">&ndash;%&gt;--%>
<%--                            <div class="white-panel pn">--%>
<%--                                <div class="white-header">--%>
<%--                                    <h5 style="color: #4158d0;font-weight: bold"> Critical Thinking </h5>--%>
<%--                                </div>--%>
<%--                                <div class="row lessonOneQuizzes">--%>
<%--                                    <div id="catOneQuizOne" class="col-md-4">--%>
<%--                                        <h6> Quiz One </h6>--%>
<%--                                        <a href="./categoryOneQuizOne">--%>
<%--                                            <img id="c1quizOneId" src="${pageContext.request.contextPath}/resources/img/l1q1.webp" style="width:80px;height:80px;">--%>
<%--                                        </a>--%>
<%--                                    </div>--%>
<%--                                    <div id="catOneQuizTwo" class="col-md-4">--%>
<%--                                        <h6> Quiz Two </h6>--%>
<%--                                        <a href="./categoryOneQuizTwo">--%>
<%--                                            <img id="c1quizTwoId" src="${pageContext.request.contextPath}/resources/img/l2q2.png" style="width:80px;height:80px;">--%>
<%--                                        </a>--%>
<%--                                    </div>--%>
<%--                                    <div id="catOneQuizThree" class="col-md-4">--%>
<%--                                        <h6> Quiz Three </h6>--%>
<%--                                        <a href="./categoryOneQuizThree">--%>
<%--                                            <img id="c1quizThreeId" src="${pageContext.request.contextPath}/resources/img/lOneQThree.png" style="width:80px;height:80px;">--%>
<%--                                        </a>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <footer>--%>
<%--                                    <div class="pull-center categoryOneFooter">--%>
<%--                                    </div>--%>
<%--                                </footer>--%>
<%--                            </div>--%>
<%--                        </div>--%>

<%--                        <div class="col-md-6 col-sm-6 mb" id="categoryTwoDiv">--%>
<%--                            <div class="white-panel pn">--%>
<%--                                <div class="white-header">--%>
<%--                                    <h5 style="color: #4158d0;font-weight: bold">Social Media </h5>--%>
<%--                                </div>--%>
<%--                                <div class="row lessonOneQuizzes">--%>
<%--                                    <div id="catTwoQuizOne" class="col-md-4">--%>
<%--                                        <h6> Quiz One </h6>--%>
<%--                                        <a href="./categoryTwoQuizOne">--%>
<%--                                            <img id="c2quizOneId" src="${pageContext.request.contextPath}/resources/img/sm1.png" style="width:80px;height:80px;">--%>
<%--                                        </a>--%>
<%--                                    </div>--%>
<%--                                    <div id="catTwoQuizTwo" class="col-md-4">--%>
<%--                                        <h6> Quiz Two </h6>--%>
<%--                                        <a href="./categoryTwoQuizTwo">--%>
<%--                                            <img id="c2quizTwoId" src="${pageContext.request.contextPath}/resources/img/sm2.png" style="width:80px;height:80px;">--%>
<%--                                        </a>--%>
<%--                                    </div>--%>
<%--                                    <div id="catTwoQuizThree" class="col-md-4">--%>
<%--                                        <h6> Quiz Three </h6>--%>
<%--                                        <a href="./categoryTwoQuizThree">--%>
<%--                                            <img id="c2quizThreeId" src="${pageContext.request.contextPath}/resources/img/sm3.png" style="width:80px;height:80px;">--%>
<%--                                        </a>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                &lt;%&ndash;                                <p>April 17, 2014</p>&ndash;%&gt;--%>
<%--                                <footer>--%>
<%--                                    <div class="pull-center categoryTwoFooter">--%>

<%--                                    </div>--%>
<%--                                </footer>--%>
<%--                            </div>--%>
<%--                            <!--  /darkblue panel -->--%>
<%--                        </div>--%>
<%--                        <div class="col-md-6 col-sm-6 mb" id="categoryThreeDiv">--%>
<%--                            <div class="white-panel pn">--%>
<%--                                <div class="white-header">--%>
<%--                                    <h5 style="color: #4158d0;font-weight: bold"> Information Management </h5>--%>
<%--                                </div>--%>
<%--                                <div class="row lessonOneQuizzes">--%>
<%--                                    <div id="catThreeQuizOne" class="col-md-4">--%>
<%--                                        <h6> Quiz One </h6>--%>
<%--                                        <a href="./categoryThreeQuizOne">--%>
<%--                                            <img id="c3quizOneId" src="${pageContext.request.contextPath}/resources/img/ia1.png" style="width:80px;height:80px;">--%>
<%--                                        </a>--%>
<%--                                    </div>--%>
<%--                                    <div id="catThreeQuizTwo" class="col-md-4">--%>
<%--                                        <h6> Quiz Two </h6>--%>
<%--                                        <a href="./categoryThreeQuizTwo">--%>
<%--                                            <img id="c3quizTwoId" src="${pageContext.request.contextPath}/resources/img/ia2.png" style="width:80px;height:80px;">--%>
<%--                                        </a>--%>
<%--                                    </div>--%>
<%--                                    <div id="catThreeQuizThree" class="col-md-4">--%>
<%--                                        <h6> Quiz Three </h6>--%>
<%--                                        <a href="./categoryThreeQuizThree">--%>
<%--                                            <img id="c3quizThreeId" src="${pageContext.request.contextPath}/resources/img/ia3.png" style="width:80px;height:80px;">--%>
<%--                                        </a>--%>
<%--                                    </div>--%>
<%--                                </div>--%>

<%--                                <footer>--%>
<%--                                    <div class="pull-center categoryThreeFooter">--%>

<%--                                    </div>--%>
<%--                                </footer>--%>
<%--                            </div>--%>
<%--                            <!--  /darkblue panel -->--%>
<%--                        </div>--%>
<%--                        <div class="col-md-6 col-sm-6 mb" id="categoryFourDiv">--%>
<%--                            <div class="white-panel pn">--%>
<%--                                <div class="white-header">--%>
<%--                                    <h5 style="color: #4158d0;font-weight: bold"> Creativity </h5>--%>
<%--                                </div>--%>
<%--                                <div class="row lessonOneQuizzes">--%>
<%--                                    <div id="catFourQuizOne" class="col-md-4">--%>
<%--                                        <h6> Quiz One </h6>--%>
<%--                                        <a href="./categoryFourQuizOne">--%>
<%--                                            <img id="c4quizOneId" src="${pageContext.request.contextPath}/resources/img/cr1.png" style="width:80px;height:80px;">--%>
<%--                                        </a>--%>
<%--                                    </div>--%>
<%--                                    <div id="catFourQuizTwo" class="col-md-4">--%>
<%--                                        <h6> Quiz Two </h6>--%>
<%--                                        <a href="./categoryFourQuizTwo">--%>
<%--                                            <img id="c4quizTwoId" src="${pageContext.request.contextPath}/resources/img/cr2.png" style="width:80px;height:80px;">--%>
<%--                                        </a>--%>
<%--                                    </div>--%>
<%--                                    <div id="catFourQuizThree" class="col-md-4">--%>
<%--                                        <h6> Quiz Three </h6>--%>
<%--                                        <a href="./categoryFourQuizThree">--%>
<%--                                            <img id="c4quizThreeId" src="${pageContext.request.contextPath}/resources/img/cr3.png" style="width:80px;height:80px;">--%>
<%--                                        </a>--%>
<%--                                    </div>--%>
<%--                                </div>--%>

<%--                                &lt;%&ndash;                                <p>April 17, 2014</p>&ndash;%&gt;--%>
<%--                                <footer>--%>
<%--                                    <div class="pull-center categoryFourFooter">--%>

<%--                                    </div>--%>
<%--                                </footer>--%>
<%--                            </div>--%>
<%--                            <!--  /darkblue panel -->--%>
<%--                        </div>--%>
<%--                    </div>--%>
                    <!-- /row -->
                </div>
                <div class="col-lg-3 ds">
                    <div class="donut-main">
                        <h4 style="color: #5425ff">USERS' LEADERBOARD</h4>
                        <div id="userLeaderboardDiv"></div>
                        <canvas id="newchart" height="130" width="130"></canvas>
                    </div>
                    <div class="desc">
                        <div class="thumb">

                        </div>
                        <div class="details">
                        </div>
                    </div>
                    <div class="desc">
                        <div class="thumb">
                        </div>
                        <div class="details"></div>
                    </div>
                    <!-- Third Activity -->
                    <div class="desc">
                        <div class="thumb">

                        </div>
                        <div class="details">

                        </div>
                    </div>
                    <!-- Fourth Activity -->
                    <div class="desc">
                        <div class="thumb">

                        </div>
                        <div class="details">

                        </div>
                    </div>

                    <div class="desc">
                        <div class="thumb">

                        </div>
                        <div class="details">

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
<%--<script type="text/javascript">--%>
<%--    $(document).ready(function() {--%>
<%--        var unique_id = $.gritter.add({--%>
<%--            // (string | mandatory) the heading of the notification--%>
<%--            title: 'Welcome to Dashio!',--%>
<%--            // (string | mandatory) the text inside the notification--%>
<%--            text: 'Hover me to enable the Close Button. You can hide the left sidebar clicking on the button next to the logo.',--%>
<%--            // (string | optional) the image to display on the left--%>
<%--            image: 'img/ui-sam.jpg',--%>
<%--            // (bool | optional) if you want it to fade out on its own or just sit there--%>
<%--            sticky: false,--%>
<%--            // (int | optional) the time you want it to be alive for before fading out--%>
<%--            time: 8000,--%>
<%--            // (string | optional) the class name you want to apply to that specific message--%>
<%--            class_name: 'my-sticky-class'--%>
<%--        });--%>

<%--        return false;--%>
<%--    });--%>
<%--</script>--%>
</body>