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

    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap/bootstrap.min.css"/>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/waves.min.css"/>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/feather/feather.css"/>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/all.css"/>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/dashboard.min.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/widget.css"/>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css"/>

    <%--<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/slidebars/slidebars.min.css">--%>


      <script src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/jquery.slimscroll.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/bootstrap/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/waves.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/accordion.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/pcoded.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/vertical-layout.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/main.js"></script>



</head>
<body>
    <tiles:insertAttribute name="header"/>

    <tiles:insertAttribute name="body"/>
  <div class="pcoded" id="pcoded">
    <!--.pcoded-overlay-box-->
    <div class="pcoded-container navbar-wrapper">
      <nav class="navbar header-navbar pcoded-header">
        <div class="navbar-wrapper">
          <div class="navbar-logo">
              <%--<a href="/"><img class="img-fluid" src="${pageContext.request.contextPath}/resources/img/dashboard/flexlogo.png" alt="Theme-Logo"></a><a class="mobile-options waves-effect waves-light"><i class="feather icon-more-horizontal"></i></a>--%>
          </div>
          <div class="navbar-container container-fluid">
            <ul class="nav-right">
              <li class="header-notification">
                <div class="dropdown-primary dropdown">
                  <div class="dropdown-toggle"><i class="feather icon-sliders"></i></div>
                </div>
              </li>
              <li class="header-notification">
                <div class="dropdown-primary dropdown">
                  <div class="dropdown-toggle"><i class="feather icon-bar-chart-2"></i></div>
                </div>
              </li>
            </ul>
          </div>
        </div>
      </nav>
      <div class="pcoded-main-container">
        <div class="pcoded-wrapper">
          <div class="pcoded-content">
            <div class="page-header card">
              <div class="row align-items-end">
                <div class="col-lg-8">
                  <div class="page-header-title">
                    <!--i.fa.fa-home.bg-c-blue-->
                    <div class="d-inline">
<%--                      <h5>Your Spaces</h5>--%>
                      <!--span Access Control Reporting Page-->
                    </div>
                  </div>
                </div>
                <!--.offset-md-2.col-lg-2-->
                <!--    .page-header-breadcrumb-->
                <!--        | Breadcrumb-->
              </div>
            </div>
            <div class="pcoded-inner-content">
              <div class="main-body">
                <div class="page-wrapper">
                  <div class="page-body">
                    <div class="row"></div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</body>

<script src="${pageContext.request.contextPath}/resources/js/bootstrap/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/dashboard.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/iCheck/iCheck.js"></script>
</html>


<%--<div>--%>
<%--<tiles:insertAttribute name="leftMenu" />--%>
<%--</div>--%>