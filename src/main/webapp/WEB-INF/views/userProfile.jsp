<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

    <nav class="navbar navbar-inverse " role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>

            </div>
<%--            <a class="navbar-brand" href="./dashboard">Welcome To Technology Literacy </a>--%>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="navbar-collapse-1">

                <ul class="nav navbar-nav navbar-left">
                    <li><a href="./dashboard">Welcome To Technology Literacy</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="./dashboard"><i class="fa fa-home fa-lg"></i> Home</a></li>
                    <li><a href="#">Link</a></li>
                    <li><a href="#">Link</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="#">Action</a></li>
                            <li><a href="#">Another action</a></li>
                            <li><a href="#">Something else here</a></li>
                            <li class="divider"></li>
                            <li><a href="#">Separated link</a></li>
                        </ul>
                    </li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </div><!-- /.navbar-container -->
    </nav>

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

                <!--      Wizard container        -->
                <div class="wizard-container">

                    <div class="card wizard-card" data-color="orange" id="wizardProfile">
                        <form action="" method="">
                            <!--        You can switch ' data-color="orange" '  with one of the next bright colors: "blue", "green", "orange", "red"          -->

                            <div class="wizard-header">
                                <h3>
                                    <b>CHECK</b> YOUR ACCOUNT INFORMATION <br>
<%--                                    <small>This information concerning your personality.</small>--%>
                                </h3>
                            </div>

                            <div class="wizard-navigation">
                                <ul>
                                    <li><a href="#about" data-toggle="tab">Profile Details</a></li>
<%--                                    <li><a href="#account" data-toggle="tab">Account Details</a></li>--%>
<%--                                    <li><a href="#address" data-toggle="tab">Address</a></li>--%>
                                </ul>

                            </div>

                            <div class="tab-content">
                                <div class="tab-pane" id="about">
                                    <div class="row">
                                        <h4 class="info-text"> This information concerning your personality.</h4>
                                        <div class="col-sm-6 col-sm-offset-1">
                                            <div class="form-group">
                                                <label><strong>Student Username </strong></label>
                                                <label><c:out value="${currentUsername}"/></label>
                                            </div>
                                            <div class="form-group">
                                                <label><strong> Student Name: </strong> </label>
                                                <label><c:out value="${currentFirstName}"/></label>
                                            </div>
<%--                                        </div>--%>
<%--                                        <div class="col-sm-10 col-sm-offset-1">--%>
                                            <div class="form-group">
                                                <label><strong> Email :</strong> </label>
                                                <label><label><c:out value="${currentStudentEmail}"/></label> </label>
                                            </div>
                                            <div class="form-group">
                                                <label><strong> Country :</strong> </label>
                                                <label><label><c:out value="${currentCountry}"/></label> </label>
                                            </div>
                                            <div class="form-group">
                                                <label><strong> Gender :</strong> </label>
                                                <label><label><c:out value="${currentGender}"/></label> </label>
                                            </div>
                                            <div class="form-group">
                                                <label><strong> Age :</strong> </label>
                                                <label><label><c:out value="${currentAge}"/></label> </label>
                                            </div>
                                        </div>
                                    <div class="col-sm-4 col-sm-offset-1 rightColumnProfile">
                                    </div>
                                    </div>
                                </div>
<%--                                <div class="tab-pane" id="account">--%>
<%--                                    <h4 class="info-text"> What are you doing? (checkboxes) </h4>--%>
<%--                                    <div class="row">--%>

<%--                                        <div class="col-sm-10 col-sm-offset-1">--%>
<%--                                            <div class="col-sm-4">--%>
<%--                                                <div class="choice" data-toggle="wizard-checkbox">--%>
<%--                                                    <input type="checkbox" name="jobb" value="Design">--%>
<%--                                                    <div class="icon">--%>
<%--                                                        <i class="fa fa-pencil"></i>--%>
<%--                                                    </div>--%>
<%--                                                    <h6>Design</h6>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                            <div class="col-sm-4">--%>
<%--                                                <div class="choice" data-toggle="wizard-checkbox">--%>
<%--                                                    <input type="checkbox" name="jobb" value="Code">--%>
<%--                                                    <div class="icon">--%>
<%--                                                        <i class="fa fa-terminal"></i>--%>
<%--                                                    </div>--%>
<%--                                                    <h6>Code</h6>--%>
<%--                                                </div>--%>

<%--                                            </div>--%>
<%--                                            <div class="col-sm-4">--%>
<%--                                                <div class="choice" data-toggle="wizard-checkbox">--%>
<%--                                                    <input type="checkbox" name="jobb" value="Develop">--%>
<%--                                                    <div class="icon">--%>
<%--                                                        <i class="fa fa-laptop"></i>--%>
<%--                                                    </div>--%>
<%--                                                    <h6>Develop</h6>--%>
<%--                                                </div>--%>

<%--                                            </div>--%>
<%--                                        </div>--%>

<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="tab-pane" id="address">--%>
<%--                                    <div class="row">--%>
<%--                                        <div class="col-sm-12">--%>
<%--                                            <h4 class="info-text"> Are you living in a nice area? </h4>--%>
<%--                                        </div>--%>
<%--                                        <div class="col-sm-7 col-sm-offset-1">--%>
<%--                                            <div class="form-group">--%>
<%--                                                <label>Street Name</label>--%>
<%--                                                <input type="text" class="form-control" placeholder="5h Avenue">--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                        <div class="col-sm-3">--%>
<%--                                            <div class="form-group">--%>
<%--                                                <label>Street Number</label>--%>
<%--                                                <input type="text" class="form-control" placeholder="242">--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                        <div class="col-sm-5 col-sm-offset-1">--%>
<%--                                            <div class="form-group">--%>
<%--                                                <label>City</label>--%>
<%--                                                <input type="text" class="form-control" placeholder="New York...">--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                        <div class="col-sm-5">--%>
<%--                                            <div class="form-group">--%>
<%--                                                <label>Country</label><br>--%>
<%--                                                <select name="country" class="form-control">--%>
<%--                                                    <option value="Afghanistan"> Afghanistan </option>--%>
<%--                                                    <option value="Albania"> Albania </option>--%>
<%--                                                    <option value="Algeria"> Algeria </option>--%>
<%--                                                    <option value="American Samoa"> American Samoa </option>--%>
<%--                                                    <option value="Andorra"> Andorra </option>--%>
<%--                                                    <option value="Angola"> Angola </option>--%>
<%--                                                    <option value="Anguilla"> Anguilla </option>--%>
<%--                                                    <option value="Antarctica"> Antarctica </option>--%>
<%--                                                    <option value="...">...</option>--%>
<%--                                                </select>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
                            </div>
<%--                            <div class="wizard-footer height-wizard">--%>
<%--                                <div class="pull-right">--%>
<%--                                    <input type='button' class='btn btn-next btn-fill btn-warning btn-wd btn-sm' name='next' value='Next' />--%>
<%--                                    <input type='button' class='btn btn-finish btn-fill btn-warning btn-wd btn-sm' name='finish' value='Finish' />--%>

<%--                                </div>--%>

<%--                                <div class="pull-left">--%>
<%--                                    <input type='button' class='btn btn-previous btn-fill btn-default btn-wd btn-sm' name='previous' value='Previous' />--%>
<%--                                </div>--%>
<%--                                <div class="clearfix"></div>--%>
<%--                            </div>--%>

                        </form>
                    </div>
                </div> <!-- wizard container -->
            </div>
        </div><!-- end row -->
    </div> <!--  big container -->

</div>

</body>

<!--   Core JS Files   -->
<script src="${pageContext.request.contextPath}/resources/js/jquery-2.2.4.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.bootstrap.wizard.js" type="text/javascript"></script>

<!--  Plugin for the Wizard -->
<script src="${pageContext.request.contextPath}/resources/js/gsdk-bootstrap-wizard.js"></script>

<!--  More information about jquery.validate here: http://jqueryvalidation.org/	 -->
<script src="${pageContext.request.contextPath}/resources/js/jquery.validate.min.js"></script>
