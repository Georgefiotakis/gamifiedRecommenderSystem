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
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
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
    <script src="${pageContext.request.contextPath}/resources/js/dashboard.js"></script>
</head>
<style>
    .pull-center h6 {
        padding-top: 30px;
    }

    #categoryTwoDiv, #categoryThreeDiv, #categoryFourDiv {
        pointer-events:none;
        opacity: 0.4;
    }

    #chartdiv {
        width: 100%;
        height: 600px;
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
            <ul class="nav top-menu">
                <li>
                    <a>
                        <i class="fa fa-user fa-lg"></i> XP points : <c:out value="${currentUserCoins}"/>
                    </a>
                </li>

                <li>
                    <a>
                        <i class="fa fa-star fa-lg"></i> Stars : <c:out value="${currentUserLevel}"/>
                    </a>
                </li>
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
                    <a href="./analytics">
                        <i class="fa fa-bullseye fa-lg"></i> Your Current Goal : <c:out value="${currentStudentGoal}"/>
                    </a>
                </li>
            </ul>
        </div>
        <div class="top-menu">
            <ul class="nav pull-right top-menu">
                <li><a class="logout" href="./logout">Logout</a></li>
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
                    <a>
                        <i class="fa fa-envelope fa-lg"></i>
                        <c:out value="${currentStudentEmail}"/>
                    </a>
                </li>
                <li class="mt">
                    <a>
                        <i class="fa fa-transgender fa-lg"></i>
                        <span><c:out value="${currentGender}"/></span>
                    </a>
                </li>
                <li class="mt">
                    <a>
                        <i class="fa fa-birthday-cake fa-lg"></i>
                        <span><c:out value="${currentAge}"/></span>
                    </a>
                </li>
                <li class="mt">
                    <a>
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
                        <h4 class="lessonOneCompleted" value="<c:out value="${lessonOneCompleted}"/>"><c:out value="${lessonOneCompleted}"/></h4>
                        <h4 class="userCoins" value="<c:out value="${userCoins}"/>"><c:out value="${userCoins}"/></h4>
                    </div>
                    <div class="row mt">
                        <div class="col-md-6 col-sm-6 mb" id="categoryOneDiv">
                            <div class="white-panel pn">
                                <div href="./categoryOne" class="white-header">
                                    <h5><a href="./categoryOne"> Beginner Questions </a></h5>
                                </div>
                                <canvas id="serverstatus" height="120" width="120"></canvas>
                                <script>
                                    var doughnutData = [{
                                        value: 33,
                                        color: "#5425ff"
                                    },
                                        {
                                            value: 40,
                                            color: "#ffffff"
                                        }
                                    ];
                                    var myDoughnut = new Chart(document.getElementById("serverstatus").getContext("2d")).Doughnut(doughnutData);
                                </script>
                                <%--                                <p>April 17, 2014</p>--%>
                                <footer>
                                    <div class="pull-center">
                                        <c:if test="${lessonOneCompleted eq true}">
                                            <h6> Lessons completed : 1 /3  </h6>
                                        </c:if>
                                        <c:if test="${lessonOneCompleted eq true}">
                                            <h6> Lessons completed : 2 /3  </h6>
                                        </c:if>
                                        <c:if test="${lessonOneCompleted eq true}">
                                            <h6> Lessons completed : 3 /3  </h6>
                                        </c:if>
                                            <h6> Lessons completed : 0 /3  </h6>
                                    </div>
                                </footer>
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-6 mb" id="categoryTwoDiv">
                            <div class="white-panel pn">
                                <div class="white-header">
                                    <h5><a href="./categoryTwo"> Logical Questions </a></h5>
                                </div>
                                <canvas id="serverstatus02" height="120" width="120"></canvas>
                                <script>
                                    var doughnutData = [{
                                        value: 0,
                                        color: "#5425ff"
                                    },
                                        {
                                            value: 40,
                                            color: "#ffffff"
                                        }
                                    ];
                                    var myDoughnut = new Chart(document.getElementById("serverstatus02").getContext("2d")).Doughnut(doughnutData);
                                </script>
<%--                                <p>April 17, 2014</p>--%>
                                <footer>
                                    <div class="pull-center">
                                        <c:if test="${lessonOneCompleted eq true}">
                                            <h6> Lessons completed : 1 /3  </h6>
                                        </c:if>
                                        <c:if test="${lessonOneCompleted eq true}">
                                            <h6> Lessons completed : 2 /3  </h6>
                                        </c:if>
                                        <c:if test="${lessonOneCompleted eq true}">
                                            <h6> Lessons completed : 3 /3  </h6>
                                        </c:if>
                                        <h6> Lessons completed : 0 /3  </h6>
                                    </div>
                                </footer>
                            </div>
                            <!--  /darkblue panel -->
                        </div>
                        <div class="col-md-6 col-sm-6 mb" id="categoryThreeDiv">
                            <div class="white-panel pn">
                                <div class="white-header">
                                    <h5><a href="./categoryThree"> Category 3</a></h5>
                                </div>
                                <canvas id="serverstatus03" height="120" width="120"></canvas>
                                <script>
                                    var doughnutData = [{
                                        value: 0,
                                        color: "#5425ff"
                                    },
                                        {
                                            value: 40,
                                            color: "#ffffff"
                                        }
                                    ];
                                    var myDoughnut = new Chart(document.getElementById("serverstatus03").getContext("2d")).Doughnut(doughnutData);
                                </script>
                                <%--                                <p>April 17, 2014</p>--%>
                                <footer>
                                    <div class="pull-center">
                                        <c:if test="${lessonOneCompleted eq true}">
                                            <h6> Lessons completed : 1 /3  </h6>
                                        </c:if>
                                        <c:if test="${lessonOneCompleted eq true}">
                                            <h6> Lessons completed : 2 /3  </h6>
                                        </c:if>
                                        <c:if test="${lessonOneCompleted eq true}">
                                            <h6> Lessons completed : 3 /3  </h6>
                                        </c:if>
                                        <h6> Lessons completed : 0 /3  </h6>
                                    </div>
                                </footer>
                            </div>
                            <!--  /darkblue panel -->
                        </div>
                        <div class="col-md-6 col-sm-6 mb" id="categoryFourDiv">
                            <div class="white-panel pn">
                                <div class="white-header">
                                    <h5><a href="./categoryFour">Category 4</a></h5>
                                </div>
                                <canvas id="serverstatus04" height="120" width="120"></canvas>
                                <script>
                                    var doughnutData = [{
                                        value: 0,
                                        color: "#5425ff"
                                    },
                                        {
                                            value: 40,
                                            color: "#ffffff"
                                        }
                                    ];
                                    var myDoughnut = new Chart(document.getElementById("serverstatus04").getContext("2d")).Doughnut(doughnutData);
                                </script>
                                <%--                                <p>April 17, 2014</p>--%>
                                <footer>
                                    <div class="pull-center">
                                        <c:if test="${lessonOneCompleted eq true}">
                                            <h6> Lessons completed : 1 /3  </h6>
                                        </c:if>
                                        <c:if test="${lessonOneCompleted eq true}">
                                            <h6> Lessons completed : 2 /3  </h6>
                                        </c:if>
                                        <c:if test="${lessonOneCompleted eq true}">
                                            <h6> Lessons completed : 3 /3  </h6>
                                        </c:if>
                                        <h6> Lessons completed : 0 /3  </h6>
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
                        <div id="chartdiv"></div>
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
<script type="application/javascript">
    $(document).ready(function() {

        createLeaderboard();

        // $("#date-popover").popover({
        //     html: true,
        //     trigger: "manual"
        // });
        // $("#date-popover").hide();
        // $("#date-popover").click(function(e) {
        //     $(this).hide();
        // });

        // $("#my-calendar").zabuto_calendar({
        //     action: function() {
        //         return myDateFunction(this.id, false);
        //     },
        //     action_nav: function() {
        //         return myNavFunction(this.id);
        //     },
        //     ajax: {
        //         url: "show_data.php?action=1",
        //         modal: true
        //     },
        //     legend: [{
        //         type: "text",
        //         label: "Special event",
        //         badge: "00"
        //     },
        //         {
        //             type: "block",
        //             label: "Regular event",
        //         }
        //     ]
        // });



    });

    function myNavFunction(id) {
        $("#date-popover").hide();
        var nav = $("#" + id).data("navigation");
        var to = $("#" + id).data("to");
        console.log('nav ' + nav + ' to: ' + to.month + '/' + to.year);
    }
</script>
</body>