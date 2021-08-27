<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="${pageContext.request.contextPath}/resources/js/analytics.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/dashboard-style.css" rel="stylesheet">
<style>

    @import url("https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css");
    @import url("https://fonts.googleapis.com/css?family=Nunito:300,400,700");

    body {
        overflow-y: hidden;
    }

    html {
        scroll-behavior: smooth;
    }

    body {
        font-family: helvetica, arial, sans-serif;
        background-color: #2e2e31;
    }

    #countryBarChart {
        /*width: 100%;*/
        height: 500px;
    }

    #userBarChart {
        /*width: 100%;*/
        height: 500px;
    }

    #tomMenuOptions a {
        color: white!important;
    }

    #tomMenuOptions a:hover {
        color: #4158d0!important;
    }

</style>
<header class="header black-bg">
    <div class="sidebar-toggle-box">
        <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
    </div>
    <a href="./dashboard" class="logo"><b>TECHNOLOGY<span>LITERACY</span></b></a>
    <div class="nav notify-row" id="top_menu">
        <ul id="tomMenuOptions" class="nav top-menu">
            <%--                <li id="header_inbox_bar" class="dropdown">--%>
            <%--                    <a href="./achievement">--%>
            <%--                        <i class="fa fa-trophy fa-lg"></i> Achievements--%>
            <%--                    </a>--%>

            <%--                </li>--%>
            <li id="header_notification_bar" class="dropdown">
                <a href="./dashboard">
                    <i class="fa fa-dashboard fa-lg"></i> Dashboard
                </a>
            </li>
            <li id="header_notification_bar" class="dropdown">
                <a href="./achievement">
                    <i class="fa fa-trophy fa-lg"></i> Achievements
                </a>
            </li>
            <%--                <li class="dropdown">--%>
            <%--                    <a href="#">--%>
            <%--                        <i class="fa fa-bullseye fa-lg"></i> Your Current Goal : <c:out value="${currentStudentGoal}"/>--%>
            <%--                    </a>--%>
            <%--                </li>--%>
            <li class="dropdown">
                <a href="./leaderboard">
                    <i class="fa fa-table fa-lg"></i> Leaderboard
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
<div class="pcoded-main-container">
    <div class="pcoded-wrapper">
        <div class="pcoded-content">
            <div class="pcoded-inner-content">
                <div class="main-body">
                    <div class="page-wrapper">
                        <div class="page-body">
                            <div class="col-lg-12">
                                <div class="row">
                                    <div class="currentUserId" id="currentUserId"style="display: none"><c:out value="${currentUserId}"/></div>
                                    <div class="currentSurveyId" id="currentSurveyId" style="display: none"><c:out value="${currentSurveyId}"/></div>
                                        <div id="countryBarChart" class="col-lg-6">

                                        </div>

                                        <div id="userBarChart" class="col-lg-6">

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
    // function startingTheJourney() {
    //     location.replace("./userProfile");
    // }
    // function analyticsPage() {
    //     location.replace("./analytics");
    // }
</script>