<%--
  Created by IntelliJ IDEA.
  User: pandriopoulos
  Date: 10/7/14
  Time: 2:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <%--<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">--%>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%--<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">--%>

    <link type="text/css" rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/css/bootstrap/bootstrap.min.css"/>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/material/material-kit.min.css"/>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animate.min.css"/>
<%--    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/demo.css"/>--%>
<%--    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/gsdk-bootstrap-wizard.css"/>--%>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"/>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/fontawesome-all.css"/>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/colors/switch.css"/>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/colors/default.css"/>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/colors/color-5.css"/>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/colors/color-4.css"/>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/colors/color-3.css"/>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/colors/color-2.css"/>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/waves.min.css"/>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/feather/feather.css"/>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/all.css"/>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/dashboard.min.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/widget.css"/>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <%--<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/slidebars/slidebars.min.css">--%>


    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.slimscroll.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/waves.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/accordion.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/pcoded.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/vertical-layout.min.js"></script>
<%--    <script src="${pageContext.request.contextPath}/resources/js/jquery.bootstrap.wizard.js"></script>--%>
<%--    <script src="${pageContext.request.contextPath}/resources/js/gsdk-bootstrap-wizard.js"></script>--%>
<%--    <script src="${pageContext.request.contextPath}/resources/js/main.js"></script>--%>

    <script src="//www.amcharts.com/lib/4/core.js"></script>
    <script src="//www.amcharts.com/lib/4/charts.js"></script>
    <script src="//www.amcharts.com/lib/4/themes/animated.js"></script>
    <script src="//www.amcharts.com/lib/4/maps.js"></script>
    <script src="//www.amcharts.com/lib/4/geodata/continentsLow.js"></script>
    <script src="//www.amcharts.com/lib/4/plugins/bullets.js"></script>
    <script src="//cdn.amcharts.com/lib/4/geodata/worldLow.js"></script>


</head>

<div class="pcoded" id="pcoded">
    <!--.pcoded-overlay-box-->
    <div class="pcoded-container navbar-wrapper">
        <tiles:insertAttribute name="header"/>
        <tiles:insertAttribute name="body"/>
    </div>
</div>

<%--<script src="${pageContext.request.contextPath}/resources/js/material/material-kit.min.js"></script>--%>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/dashboard.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/iCheck/iCheck.js"></script>

</html>
