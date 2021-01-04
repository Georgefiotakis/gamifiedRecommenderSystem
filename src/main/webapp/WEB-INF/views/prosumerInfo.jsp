<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<style>

    .NotificationCircle {
        width: 150px;
        height: 150px;
        line-height: 150px;
        border-radius: 50%;
        /*border: 1px solid #a4092d;*/
        font-size: 45px;
        color: #007bff;
        text-align: center;
        /*background: #0093ff;*/
        horiz-align: center;
        vertical-align: center;
        box-shadow: 0 0 9px 1px #9d9898;
        margin: 0 auto;
        display: table;
        /*width: 50%;*/
        position: absolute;
        top: 50%;
        -ms-transform: translateY(-50%);
        transform: translateY(-50%);
        left: 35%;
    }

    .notificationsCard {
        height: 300px;
    }

    .connectedDevicesCircle {
        width: 75px;
        height: 75px;
        line-height: 75px;
        border-radius: 50%;
        font-size: 20px;
        color: #000000;
        text-align: center;
        box-shadow: 0 0 9px 1px #9d9898;
        top: 50%;
    }

    .currentStatusCircle {
        width: 75px;
        height: 75px;
        line-height: 75px;
        border-radius: 50%;
        font-size: 20px;
        color: #ffffff;
        text-align: center;
        background: #008623;
        box-shadow: 0 0 9px 1px #9d9898;
        top: 50%;
    }

    .notificationAlarmCircle {
        width: 75px;
        height: 75px;
        line-height: 75px;
        border-radius: 50%;
        font-size: 20px;
        color: #000000;
        text-align: center;
        box-shadow: 0 0 9px 1px #9d9898;
        top: 50%;
    }

    .historyCard {
        height: 410px;
    }

    .historicalTable {
        font-family: arial, sans-serif;
        border-collapse: collapse;
        width: 100%;
    }

    .historicalTable td, .historicalTable th {
        border: 1px solid #dddddd;
        text-align: left;
        padding: 4px;
    }

    .historicalTable tr:nth-child(even) {
        background-color: #ecf5ff;
    }

</style>

<div class="pcoded-main-container">
    <div class="pcoded-wrapper">
        <div class="pcoded-content">
            <div class="pcoded-inner-content">
                <div class="main-body">
                    <div class="page-wrapper">
                        <div class="page-body">
                            <div class="col-lg-12">
                                <div class="row">
                                    <div class="col-lg-4">
                                        <div class="card">
                                            <div class="card-header">
                                                <h5 class="card-title">Panos Home</h5>
                                            </div>
                                            <div class="row card-block">
                                                <div class="col-lg-4">
                                                    <div class="card connectedDevicesCard">
                                                        <div class="card-header">
                                                            <h5 class="card-title">Connected</h5>
                                                        </div>
                                                        <div class="card-block">
                                                            <div class="connectedDevicesCircle">8</div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4">
                                                    <div class="card currentStatusCard">
                                                        <div class="card-header">
                                                            <h5 class="card-title">Current Status</h5>
                                                        </div>
                                                        <div class="card-block">
                                                            <div class="currentStatusCircle">Active</div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4">
                                                    <div class="card notificationAlarmCard">
                                                        <div class="card-header">
                                                            <h5 class="card-title">Notifications</h5>
                                                        </div>
                                                        <div class="card-block">
                                                            <div class="notificationAlarmCircle">4</div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-12">
                                                <div class="card historyCard">
                                                    <div class="card-header">
                                                        <h5 class="card-title">History Table</h5>
                                                    </div>
                                                    <div class="card-block">
                                                        <nav>
                                                            <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                                                <a class="nav-item nav-link active" id="nav-home-tab"
                                                                   data-toggle="tab" href="#nav-home" role="tab"
                                                                   aria-controls="nav-home" aria-selected="true">Smartbox
                                                                    1</a>
                                                                <a class="nav-item nav-link" id="nav-profile-tab"
                                                                   data-toggle="tab" href="#nav-profile" role="tab"
                                                                   aria-controls="nav-profile"
                                                                   aria-selected="false">Smartbox 2</a>
                                                                <a class="nav-item nav-link" id="nav-contact-tab"
                                                                   data-toggle="tab" href="#nav-contact" role="tab"
                                                                   aria-controls="nav-contact"
                                                                   aria-selected="false">Smartbox 3</a>
                                                            </div>
                                                        </nav>
                                                        <div class="tab-content" id="nav-tabContent">
                                                            <div class="tab-pane fade show active" id="nav-home"
                                                                 role="tabpanel" aria-labelledby="nav-home-tab">
                                                                <table class="historicalTable">
                                                                    <tr>
                                                                        <th>Device Name</th>
                                                                        <th>Status</th>
                                                                        <th>Date</th>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>HVAC Load</td>
                                                                        <td>Active</td>
                                                                        <td>03-09-2020 13:54:00</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>Ambient Device</td>
                                                                        <td>Active</td>
                                                                        <td>04-09-2020 13:54:00</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>Microwave</td>
                                                                        <td>Inactive</td>
                                                                        <td>03-09-2020 13:54:00</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>Nespresso</td>
                                                                        <td>Active</td>
                                                                        <td>03-09-2020 13:54:00</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>Dishwasher</td>
                                                                        <td>Inactive</td>
                                                                        <td>03-09-2020 13:54:00</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>Bedroom AC</td>
                                                                        <td>Inactive</td>
                                                                        <td>03-09-2020 13:54:00</td>
                                                                    </tr>
                                                                </table>
                                                            </div>
                                                            <div class="tab-pane fade" id="nav-profile" role="tabpanel"
                                                                 aria-labelledby="nav-profile-tab">Some content here
                                                            </div>
                                                            <div class="tab-pane fade" id="nav-contact" role="tabpanel"
                                                                 aria-labelledby="nav-contact-tab">Some content here
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-8">
                                        <div class="card">
                                            <div class="card-header">
                                                <h5 class="card-title">General Information For Prosumer's Smart
                                                    Boxes</h5>
                                            </div>
                                            <div class="card-block">
                                                <div class="row">
                                                    <div class="dt-responsive table-responsive">
                                                        <div id="multilevel-btn_wrapper"
                                                             class="dataTables_wrapper dt-bootstrap4">
                                                            <div id="multilevel-btn_filter"
                                                                 class="dataTables_filter">
                                                                <label>Search:<input
                                                                        type="search" class="form-control input-sm"
                                                                        placeholder=""
                                                                        aria-controls="multilevel-btn"></label>
                                                            </div>
                                                            <table id="multilevel-btn"
                                                                   class="table table-striped table-bordered nowrap dataTable"
                                                                   role="grid"
                                                                   aria-describedby="multilevel-btn_info">
                                                                <thead>
                                                                <tr role="row">
                                                                    <th class="sorting_asc" tabindex="0"
                                                                        aria-controls="multilevel-btn" rowspan="1"
                                                                        colspan="1"
                                                                        aria-sort="ascending"
                                                                        aria-label="Name: activate to sort column descending"
                                                                        style="width: 305px;">Device Name
                                                                    </th>
                                                                    <th class="sorting" tabindex="0"
                                                                        aria-controls="multilevel-btn"
                                                                        rowspan="1" colspan="1"
                                                                        aria-label="Position: activate to sort column ascending"
                                                                        style="width: 481px;">Active/Inactive
                                                                    </th>
                                                                    <th class="sorting_asc" tabindex="0"
                                                                        aria-controls="multilevel-btn" rowspan="1"
                                                                        colspan="1"
                                                                        aria-sort="ascending"
                                                                        aria-label="Name: activate to sort column descending"
                                                                        style="width: 305px;">Last Value Sent
                                                                    </th>
                                                                </tr>
                                                                </thead>
                                                                <tbody>

                                                                <tr role="row" class="odd">
                                                                    <td class="sorting_1">HVAC Load</td>
                                                                    <td>Yes</td>
                                                                    <td>03-09-2020 13:54:00</td>
                                                                </tr>
                                                                <tr role="row" class="even">
                                                                    <td class="sorting_1">Panos onBoard Sensing</td>
                                                                    <td>No</td>
                                                                    <td>04-06-2020 23:54:00</td>
                                                                </tr>
                                                                <tr role="row" class="odd">
                                                                    <td class="sorting_1">Ambient Device</td>
                                                                    <td>No</td>
                                                                    <td>12-08-2020 08:54:00</td>
                                                                </tr>
                                                                <tr role="row" class="even">
                                                                    <td class="sorting_1">Microwave</td>
                                                                    <td>Yes</td>
                                                                    <td>15-08-2020 10:54:00</td>
                                                                </tr>
                                                                <tr role="row" class="odd">
                                                                    <td class="sorting_1">Nespresso</td>
                                                                    <td>Yes</td>
                                                                    <td>05-14-2020 05:54:00</td>
                                                                </tr>
                                                                <tr role="row" class="even">
                                                                    <td class="sorting_1">Dishwasher</td>
                                                                    <td>No</td>
                                                                    <td>04-09-2020 16:54:00</td>
                                                                </tr>
                                                                <tr role="row" class="even">
                                                                    <td class="sorting_1">Microwave</td>
                                                                    <td>No</td>
                                                                    <td>04-09-2020 16:54:00</td>
                                                                </tr>
                                                                <tr role="row" class="even">
                                                                    <td class="sorting_1">Bedroom AC</td>
                                                                    <td>Yes</td>
                                                                    <td>04-09-2020 16:54:00</td>
                                                                </tr>
                                                                <tr role="row" class="even">
                                                                    <td class="sorting_1">Ambient Load</td>
                                                                    <td>Yes</td>
                                                                    <td>04-09-2020 16:54:00</td>
                                                                </tr>
                                                                </tbody>
                                                                <tfoot>
                                                                <tr>
                                                                    <th rowspan="1" colspan="1">Device Name</th>
                                                                    <th rowspan="1" colspan="1">Active/Inactive</th>
                                                                    <th rowspan="1" colspan="1">Last Value Sent</th>
                                                                </tr>
                                                                </tfoot>
                                                            </table>
                                                            <div class="dataTables_paginate paging_simple_numbers"
                                                                 id="multilevel-btn_paginate">
                                                                <ul class="pagination">
                                                                    <li class="paginate_button page-item previous disabled"
                                                                        id="multilevel-btn_previous"><a href="#"
                                                                                                        aria-controls="multilevel-btn"
                                                                                                        data-dt-idx="0"
                                                                                                        tabindex="0"
                                                                                                        class="page-link">Previous</a>
                                                                    </li>
                                                                    <li class="paginate_button page-item active"><a
                                                                            href="#"
                                                                            aria-controls="multilevel-btn"
                                                                            data-dt-idx="1"
                                                                            tabindex="0"
                                                                            class="page-link">1</a>
                                                                    </li>
                                                                    <li class="paginate_button page-item "><a
                                                                            href="#"
                                                                            aria-controls="multilevel-btn"
                                                                            data-dt-idx="2"
                                                                            tabindex="0"
                                                                            class="page-link">2</a>
                                                                    </li>
                                                                    <li class="paginate_button page-item "><a
                                                                            href="#"
                                                                            aria-controls="multilevel-btn"
                                                                            data-dt-idx="3"
                                                                            tabindex="0"
                                                                            class="page-link">3</a>
                                                                    </li>
                                                                    <li class="paginate_button page-item "><a
                                                                            href="#"
                                                                            aria-controls="multilevel-btn"
                                                                            data-dt-idx="4"
                                                                            tabindex="0"
                                                                            class="page-link">4</a>
                                                                    </li>
                                                                    <li class="paginate_button page-item "><a
                                                                            href="#"
                                                                            aria-controls="multilevel-btn"
                                                                            data-dt-idx="5"
                                                                            tabindex="0"
                                                                            class="page-link">5</a>
                                                                    </li>
                                                                    <li class="paginate_button page-item "><a
                                                                            href="#"
                                                                            aria-controls="multilevel-btn"
                                                                            data-dt-idx="6"
                                                                            tabindex="0"
                                                                            class="page-link">6</a>
                                                                    </li>
                                                                    <li class="paginate_button page-item next"
                                                                        id="multilevel-btn_next"><a href="#"
                                                                                                    aria-controls="multilevel-btn"
                                                                                                    data-dt-idx="7"
                                                                                                    tabindex="0"
                                                                                                    class="page-link">Next</a>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="card-deck" style="display: none">
                                            <%--                                            <div class="card historyCard">--%>
                                            <%--                                                <div class="card-header">--%>
                                            <%--                                                    <h5 class="card-title">History Table</h5>--%>
                                            <%--                                                </div>--%>
                                            <%--                                                <div class="card-block">--%>
                                            <%--                                                    <nav>--%>
                                            <%--                                                        <div class="nav nav-tabs" id="nav-tab" role="tablist">--%>
                                            <%--                                                            <a class="nav-item nav-link active" id="nav-home-tab"--%>
                                            <%--                                                               data-toggle="tab" href="#nav-home" role="tab"--%>
                                            <%--                                                               aria-controls="nav-home" aria-selected="true">Smartbox 1</a>--%>
                                            <%--                                                            <a class="nav-item nav-link" id="nav-profile-tab"--%>
                                            <%--                                                               data-toggle="tab" href="#nav-profile" role="tab"--%>
                                            <%--                                                               aria-controls="nav-profile"--%>
                                            <%--                                                               aria-selected="false">Smartbox 2</a>--%>
                                            <%--                                                            <a class="nav-item nav-link" id="nav-contact-tab"--%>
                                            <%--                                                               data-toggle="tab" href="#nav-contact" role="tab"--%>
                                            <%--                                                               aria-controls="nav-contact"--%>
                                            <%--                                                               aria-selected="false">Smartbox 3</a>--%>
                                            <%--                                                        </div>--%>
                                            <%--                                                    </nav>--%>
                                            <%--                                                    <div class="tab-content" id="nav-tabContent">--%>
                                            <%--                                                        <div class="tab-pane fade show active" id="nav-home"--%>
                                            <%--                                                             role="tabpanel" aria-labelledby="nav-home-tab">Some content here--%>
                                            <%--                                                        </div>--%>
                                            <%--                                                        <div class="tab-pane fade" id="nav-profile" role="tabpanel"--%>
                                            <%--                                                             aria-labelledby="nav-profile-tab">Some content here--%>
                                            <%--                                                        </div>--%>
                                            <%--                                                        <div class="tab-pane fade" id="nav-contact" role="tabpanel"--%>
                                            <%--                                                             aria-labelledby="nav-contact-tab">Some content here--%>
                                            <%--                                                        </div>--%>
                                            <%--                                                    </div>--%>
                                            <%--                                                </div>--%>
                                            <%--                                            </div>--%>
                                            <div class="card notificationsCard" style="display: none">
                                                <div class="card-header">
                                                    <h5 class="card-title">Notification Alarms</h5>
                                                </div>
                                                <div class="card-block">
                                                    <div class="NotificationCircle">4</div>
                                                </div>
                                            </div>
                                            <div class="card recommendedActionsCard" style="display: none">
                                                <div class="card-header">
                                                    <h5 class="card-title">Recommended Actions</h5>
                                                </div>
                                                <div class="card-block">
                                                    <button class="btn waves-effect waves-light btn-grd-primary ">Action
                                                        1
                                                    </button>
                                                    <button class="btn waves-effect waves-light btn-grd-primary ">Action
                                                        2
                                                    </button>
                                                    <button class="btn waves-effect waves-light btn-grd-primary ">Action
                                                        3
                                                    </button>
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
        </div>
    </div>
</div>

