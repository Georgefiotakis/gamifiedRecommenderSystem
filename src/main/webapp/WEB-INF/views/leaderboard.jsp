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
    <script src="${pageContext.request.contextPath}/resources/js/leaderboard.js"></script>
</head>
<style>
    .pull-center h6 {
        padding-top: 30px;
    }

    #leaderboardHorizontal {
        width: 100%;
        height: 500px;
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
<%--                <li>--%>
<%--                    <a>--%>
<%--                        <i class="fa fa-user fa-lg"></i> XP points : <c:out value="${currentUserCoins}"/>--%>
<%--                    </a>--%>
<%--                </li>--%>

<%--                <li>--%>
<%--                    <a>--%>
<%--                        <i class="fa fa-star fa-lg"></i> Stars : <c:out value="${currentUserLevel}"/>--%>
<%--                    </a>--%>
<%--                </li>--%>
<%--                <li id="header_inbox_bar" class="dropdown">--%>
<%--                    <a href="./achievement">--%>
<%--                        <i class="fa fa-trophy fa-lg"></i> Achievements--%>
<%--                    </a>--%>

<%--                </li>--%>
<%--                <li id="header_notification_bar" class="dropdown">--%>
<%--                    <a href="./analytics">--%>
<%--                        <i class="fa fa-bar-chart fa-lg"></i> Analytics--%>
<%--                    </a>--%>
<%--                </li>--%>
<%--                <li class="dropdown">--%>
<%--                    <a href="#">--%>
<%--                        <i class="fa fa-bullseye fa-lg"></i> Your Current Goal : <c:out value="${currentStudentGoal}"/>--%>
<%--                    </a>--%>
<%--                </li>--%>
<%--                <li class="dropdown">--%>
<%--                    <a href="#">--%>
<%--                        <i class="fa fa-table fa-lg"></i> Leaderboard--%>
<%--                    </a>--%>
<%--                </li>--%>
            </ul>
        </div>
        <div class="top-menu">
            <ul class="nav pull-right top-menu">
                <li><a class="logout" href="./logout">Logout</a></li>
            </ul>
        </div>
    </header>
    <!--sidebar end-->
    <!-- **********************************************************************************************************************************************************
        MAIN CONTENT
        *********************************************************************************************************************************************************** -->
    <!--main content start-->
    <section id="main-content">
        <section class="wrapper">
            <div class="row">
                <div class="col-lg-12 main-chart">
                    <div class="latLongDiv" style="display: none">
<%--                        <h4 class="lessonOneCompleted" value="<c:out value="${lessonOneCompleted}"/>"><c:out value="${lessonOneCompleted}"/></h4>--%>
<%--                        <h4 class="userCoins" value="<c:out value="${userCoins}"/>"><c:out value="${userCoins}"/></h4>--%>
                    </div>
                    <div id="leaderboardHorizontal">

                    </div>

                </div>
            </div>
            <!-- /row -->
        </section>
    </section>

</section>
<!-- js placed at the end of the document so the pages load faster -->
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.scrollTo.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.nicescroll.js" type="text/javascript"></script>


</body>