<%--
  Created by IntelliJ IDEA.
  User: pandriopoulos
  Date: 13/02/17
  Time: 18:29
  To change this template use File | Settings | File Templates.
--%>
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

    <%--<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/dashboard.css"/>--%>
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap/bootstrap.min.css"/>
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css"/>
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/skins/skin-select.css"/>


    <script src="${pageContext.request.contextPath}/resources/js/jquery-2.2.4.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/d3.v3.min.js"></script>

</head>
<body style="overflow: visible;">

<div id="sb-site" style="min-height: 800px;">

    <tiles:insertAttribute name="body"/>

</div>
</body>

<script src="${pageContext.request.contextPath}/resources/js/bootstrap/bootstrap.min.js"></script>
</html>

