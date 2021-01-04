<%--
  Created by IntelliJ IDEA.
  User: pandriopoulos
  Date: 10/7/14
  Time: 2:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script src="${pageContext.request.contextPath}/resources/js/jquery-1.10.2.min.js"></script>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/dashboard.css" />
    <title>HyperTech Thor - Occupant Profiling System - <tiles:getAsString name="title" /></title>
</head>
<body>
<%--<div id="header">--%>
    <%--<img class="grindrop_logo_img" src="${pageContext.request.contextPath}/resources/img/logo.png" />--%>
    <%--<div id="headerTitle"><tiles:insertAttribute name="header" /></div>--%>
<%--</div>--%>
<%--<div>--%>
    <%--<img src="${pageContext.request.contextPath}/resources/img/mainTopLine.png" />--%>
<%--</div>--%>
<%--<div id="menu">--%>
<%--<tiles:insertAttribute name="menu" />--%>
<%--</div>--%>
<div id="mainWindow">
    <%--<tiles:insertAttribute name="messageArea" />--%>
    <tiles:insertAttribute name="body" />
</div>
<div id="footer">
    <tiles:insertAttribute name="footer" />
</div>
</body>
</html>
