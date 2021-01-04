<%--
  Created by IntelliJ IDEA.
  User: pandriopoulos
  Date: 1/13/15
  Time: 3:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%--<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>--%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>--%>
<%@ taglib prefix="datatables" uri="http://github.com/dandelion/datatables" %>

<style>
    #comparativeChart {
        width: 80%;
        height: 70%;
    }
</style>

<!-- Comparative Chart  -->
<script src="${pageContext.request.contextPath}/resources/js/comparativeChart/boxplotChart.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/comparativeChart/commonComparativeElements.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/comparativeChart/barChart.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/comparativeChart/bubbleChart.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/comparativeChart/comparativeChart.js"></script>

<!-- Right side column. Contains the navbar and content of the page -->
<aside class="right-side">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            Charts
            <small>Comparative Analysis</small>
        </h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
            <li>Charts</li>
            <li class="active">Comparative Analysis</li>
        </ol>
    </section>

    <!-- Main content -->
    <section id="comparativeContent" class="content">
        <div class="plotByArea">
            <h5 style="float: left;width: 7%;">Plot by</h5>

            <div class="btn-group" style="float: left;width: 20%">
                <button id="leftPlotByButton" type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">None <span class="fa fa-caret-down"></span></button>
                <ul class="dropdown-menu" role="menu">
                    <li><span onclick="plotByChart({'code':'l1', 'type':'bar', 'label':'GREEN'})">Green</span></li>
                    <li><span onclick="plotByChart({'code':'l2', 'type':'bar', 'label':'COST'})">Cost</span></li>
                </ul>
            </div>

        </div>
        <div id="comparativeChart"></div>
    </section><!-- /.content -->
</aside><!-- /.right-side -->
