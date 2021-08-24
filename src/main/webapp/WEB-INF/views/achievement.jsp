<%--
  Created by IntelliJ IDEA.
  User: georgefiw
  Date: 18/4/21
  Time: 16:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>Technology Literacy</title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />
    <link href="http://netdna.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/resources/css/gsdk-bootstrap-wizard.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/resources/css/demo.css" rel="stylesheet" />

</head>

<style>
    .navbar-brand
    {
        position: absolute;
        width: 100%;
        left: 0;
        top: 0;
        text-align: center;
        margin: auto;
    }

    .navbar {
        margin-bottom: 0px!important;
        min-height: 80px!important;
    }
</style>

<body>
<div class="image-container set-full-height" style="background-image: url('https://acegif.com/wp-content/gif/outerspace-70.gif')">
    <!--   Big container   -->
    <div class="container">
        <div class="row">
            <div class="col-sm-8 col-sm-offset-2">
                <div class="wizard-container">

                    <div class="card wizard-card" data-color="orange" id="wizardProfile">
                        <form>
                            <div class="wizard-header">
                                <h3>
                                    <b>CHECK</b> YOUR ACCOUNT INFORMATION <br>
                                </h3>
                            </div>

                            <div class="wizard-navigation">
                                <ul>
                                    <li><a href="#about" data-toggle="tab">Profile Details</a></li>
                                </ul>

                            </div>

                            <div class="tab-content">
                                <div class="tab-pane" id="about">
                                    <div class="row">
                                        <h4 class="info-text"> This information concerning your personality.</h4>
                                        <div class="col-sm-6 col-sm-offset-1">
                                            <div class="form-group">
                                                <label><strong>Student Username </strong></label>
                                                <label></label>
                                            </div>
                                            <div class="form-group">
                                                <label><strong> Student Name: </strong> </label>
                                                <label></label>
                                            </div>
                                            <div class="form-group">
                                                <label><strong> Email :</strong> </label>
                                                <label> </label>
                                            </div>
                                            <div class="form-group">
                                                <label><strong> Country :</strong> </label>
                                                <label> </label>
                                            </div>
                                            <div class="form-group">
                                                <label><strong> Gender :</strong> </label>
                                                <label> </label>
                                            </div>
                                            <div class="form-group">
                                                <label><strong> Age :</strong> </label>
                                                <label> </label>
                                            </div>
                                        </div>
                                        <div class="col-sm-4 col-sm-offset-1 rightColumnProfile">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
</body>

<script src="${pageContext.request.contextPath}/resources/js/jquery-2.2.4.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.bootstrap.wizard.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/js/gsdk-bootstrap-wizard.js"></script>

</html>
