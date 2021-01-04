<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<style>

    #map {
        height: 100%;
        width: 100%;
    }

    #mapContainer {
        height: 600px;
    }

    .NotificationCircle {
        width: 240px;
        height: 150px;
        line-height: 150px;
        border-radius: 50%;
        border: 1px solid #3b5997;
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
        left: 30%;
    }

    #heatMap {
        width: 100%;
        height: 350px;
    }

    .dataTable.table td, .dataTable.table th {
        padding: .25rem;
    }

    .page-link {
        padding: .25rem .75rem;
    }

    .form-control {
        padding: .25rem .75rem;
    }

    .googleMapCard {
        height: 650px;
        margin-top: 30px;
    }

    .fa-bell-o {
        font-size: 40px;
    }

    .notificationsTitle {
        font-size: 30px;
    }
</style>

<script src="${pageContext.request.contextPath}/resources/js/googleMap.js"></script>
<script async defer
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBnJ50NPUmI3nn6rK8xRQsVWIhl4HxUdI8&language=en&region=GR"></script>

<div class="pcoded-main-container">
    <div class="pcoded-wrapper">
        <div class="pcoded-content">
            <div class="pcoded-inner-content">
                <div class="main-body">
                    <div class="page-wrapper">
                        <div class="page-body">
                            <div class="col-lg-12">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="card-deck generalInfoDeck">
                                            <div class="card">
                                                <div class="card-header">
                                                    <h5 class="card-title">General Information About Prosumers</h5>
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
                                                                            style="width: 305px;">Prosumer Name
                                                                        </th>
                                                                        <th class="sorting" tabindex="0"
                                                                            aria-controls="multilevel-btn"
                                                                            rowspan="1" colspan="1"
                                                                            aria-label="Position: activate to sort column ascending"
                                                                            style="width: 481px;">Has Problem
                                                                        </th>
                                                                        <th class="sorting_asc" tabindex="0"
                                                                            aria-controls="multilevel-btn" rowspan="1"
                                                                            colspan="1"
                                                                            aria-sort="ascending"
                                                                            aria-label="Name: activate to sort column descending"
                                                                            style="width: 305px;">Active Devices
                                                                        </th>
                                                                    </tr>
                                                                    </thead>
                                                                    <tbody>

                                                                    <tr role="row" class="odd">
                                                                        <td class="sorting_1">Airi Satou</td>
                                                                        <td>Yes</td>
                                                                        <td>3/5</td>
                                                                    </tr>
                                                                    <tr role="row" class="even">
                                                                        <td class="sorting_1">Angelica Ramos</td>
                                                                        <td>No</td>
                                                                        <td>3/3</td>
                                                                    </tr>
                                                                    <tr role="row" class="odd">
                                                                        <td class="sorting_1">Ashton Cox</td>
                                                                        <td>No</td>
                                                                        <td>1/10</td>
                                                                    </tr>
                                                                    <tr role="row" class="even">
                                                                        <td class="sorting_1">Bradley Greer</td>
                                                                        <td>Yes</td>
                                                                        <td>8/17</td>
                                                                    </tr>
                                                                    <tr role="row" class="odd">
                                                                        <td class="sorting_1">Brenden Wagner</td>
                                                                        <td>Yes</td>
                                                                        <td>13/18</td>
                                                                    </tr>
                                                                    <tr role="row" class="even">
                                                                        <td class="sorting_1">Brielle Williamson</td>
                                                                        <td>No</td>
                                                                        <td>10/10</td>
                                                                    </tr>
                                                                    </tbody>
                                                                    <tfoot>
                                                                    <tr>
                                                                        <th rowspan="1" colspan="1">Prosumer Name</th>
                                                                        <th rowspan="1" colspan="1">Has Problem</th>
                                                                        <th rowspan="1" colspan="1">Active Devices</th>
                                                                    </tr>
                                                                    </tfoot>
                                                                </table>
                                                                <%--                                                <div class="dataTables_info" id="multilevel-btn_info" role="status"--%>
                                                                <%--                                                     aria-live="polite">Showing 1 to 10 of 57 entries--%>
                                                                <%--                                                </div>--%>
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
                                            <div class="card notificationsCard ticket-card">
                                                <div class="card-header">
                                                    <h5 class="card-title">Notification Alarm</h5>
                                                </div>
                                                <div class="card-block text-center NotificationCircle">
                                                    <%--                                                        <div class="NotificationCircle">4</div>--%>
                                                    <div class="card-body text-center">
                                                      <h2 class="text-facebook m-b-20"><i class="fa fa-bell-o"></i>
                                                      </h2>
                                                      <h3 class="text-facebook f-w-700 notificationsTitle">25</h3>
                                                      <p>Notifications</p>
                                                      <p class="m-b-0 m-t-15"><i
                                                              class="fa fa-caret-up m-r-10 f-18 text-c-green"></i>23
                                                          from last 7 days</p>

<%--                                                        <p class="m-b-30 bg-c-blue lbl-card"><i--%>
<%--                                                                class="fa fa-bell-o"></i> </p>--%>
<%--                                                        <div class="text-center">--%>
<%--                                                            <h2 class="m-b-0 d-inline-block text-c-blue">--%>
<%--                                                                134</h2>--%>
<%--                                                            <p class="m-b-0 d-inline-block">Notifications</p>--%>
<%--                                                            <p class="m-b-0 m-t-15"><i--%>
<%--                                                                    class="fa fa-caret-up m-r-10 f-18 text-c-blue"></i>From--%>
<%--                                                                Previous Month</p>--%>
<%--                                                        </div>--%>

                                                    </div>
                                                </div>
                                            </div>
                                            <div class="card heatMapCard">
                                                <div class="card-header">
                                                    <h5 class="card-title">HeatMap</h5>
                                                </div>
                                                <div class="card-block">
                                                    <div id="heatMap"></div>
                                                </div>
                                                <div class="card-footer">
                                                    <small class="text-muted">Last updated 3 mins ago</small>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="card googleMapCard">
                                            <div class="card-header">
                                                <h5 class="card-title">Prosumers Map</h5>
                                            </div>
                                            <div class="card-block" id="mapContainer">
                                                <div id="map"></div>
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

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBnJ50NPUmI3nn6rK8xRQsVWIhl4HxUdI8" async defer></script>