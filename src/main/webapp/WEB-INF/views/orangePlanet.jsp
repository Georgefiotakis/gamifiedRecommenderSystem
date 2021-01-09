<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<style>

    .pcoded-main-container {
        background: url(./resources/img/orange-questions.jpg) no-repeat center center fixed;
        -webkit-background-size: cover;
        -moz-background-size: cover;
        -o-background-size: cover;
        background-size: cover;
        height: auto;
        max-width: 100%;
    }

    .pcoded .pcoded-header[header-theme=theme6] {
        background: #133a47;
        overflow-y: auto;
    }

    .header-navbar .navbar-wrapper .navbar-logo[logo-theme=theme6] {
        background: #133a47;
    }

    /*body {*/
    /*    overflow-y: hidden;*/
    /*}*/

    .backButton {
        margin-right: auto;
        display: block;
        position: absolute;
        top: 50%;
        left: 50%;
        margin-top: -25px;
        margin-left: -25px;
        animation-name: example;
        animation-duration: 2s;
        animation-iteration-count: 3000;
        animation-delay: 5s;
    }

    .backButton:hover {
        -webkit-filter: drop-shadow(15px 15px 15px #222);
        filter: drop-shadow(10px 10px 10px #a4a4a4);
    }

    .nextButton:hover {
        -webkit-filter: drop-shadow(15px 15px 15px #222);
        filter: drop-shadow(10px 10px 10px #a4a4a4);
    }

    .nextButton {
        position: absolute;
        top: 50%;
        left: 50%;
        margin-top: -25px;
        margin-left: -25px;
        animation-name: example;
        animation-duration: 2s;
        animation-iteration-count: 3000;
        animation-delay: 5s;
    }

    @keyframes example {
        0%   {-webkit-filter: drop-shadow(15px 15px 15px #222); filter: drop-shadow(3px 3px 3px #a4a4a4);}
        /*25%  {-webkit-filter: drop-shadow(15px 15px 15px #222); filter: drop-shadow(3px 3px 3px #a4a4a4);}*/
        /*50%  {-webkit-filter: drop-shadow(15px 15px 15px #222); filter: drop-shadow(3px 3px 3px #a4a4a4);}*/
        100% {-webkit-filter: drop-shadow(15px 15px 15px #222); filter: drop-shadow(13px 13px 13px #a4a4a4);}

    }

    .orangePlanetTitle h2 {
        font-family: Comic Sans MS, Comic Sans, cursive;
        text-align: center;
        color: white;
        font-size: 32px;
        font-weight: bold;
        -webkit-filter: drop-shadow(15px 15px 15px #222);
        filter: drop-shadow(10px 10px 10px #a4a4a4);
    }

    .nextButtonDiv {
        height: 100vh;
    }

    .backButtonDiv {
        height: 100vh;
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
                                    <div class="col-lg-3 backButtonDiv">
<%--                                        <input class="backButton" type="image"--%>
<%--                                               src="./resources/img/back-button.png" alt="Submit"--%>
<%--                                               width="100" height="100"--%>
<%--                                               onclick="backToDashboard()">--%>
                                    </div>
                                    <div class="col-lg-6 orangePlanetTitle">
                                        <h2>Welcome to Planet Orange, <br> Please Answer the below questions!!!</h2>
                                        <br>
                                        <br>
<%--                                        <div class="col-sm-12 col-xl-6 m-b-30">--%>
<%--                                            <h3 class="sub-title">1. Do you like drawing or painting?</h3>--%>
<%--                                            <div class="checkbox-color checkbox-primary">--%>
<%--                                                <input id="checkbox18" type="checkbox" checked="">--%>
<%--                                                <label for="checkbox18">Yes</label>--%>
<%--                                            </div>--%>
<%--                                            <br>--%>
<%--                                            <div class="checkbox-color checkbox-success">--%>
<%--                                                <input id="checkbox13" type="checkbox" checked="">--%>
<%--                                                <label for="checkbox13">No</label>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                        <div class="col-sm-12 col-xl-6 m-b-30">--%>
<%--                                            <h3 class="sub-title">1. Do you like drawing or painting?</h3>--%>
<%--                                            <div class="checkbox-color checkbox-primary">--%>
<%--                                                <input id="checkbox19" type="checkbox" checked="">--%>
<%--                                                <label for="checkbox19">Yes</label>--%>
<%--                                            </div>--%>
<%--                                            <br>--%>
<%--                                            <div class="checkbox-color checkbox-success">--%>
<%--                                                <input id="checkbox14" type="checkbox" checked="">--%>
<%--                                                <label for="checkbox14">No</label>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                        <div class="col-sm-12 col-xl-6 m-b-30">--%>
<%--                                            <h3 class="sub-title">1. Do you like drawing or painting?</h3>--%>
<%--                                            <div class="checkbox-color checkbox-primary">--%>
<%--                                                <input id="checkbox20" type="checkbox" checked="">--%>
<%--                                                <label for="checkbox20">Yes</label>--%>
<%--                                            </div>--%>
<%--                                            <br>--%>
<%--                                            <div class="checkbox-color checkbox-success">--%>
<%--                                                <input id="checkbox21" type="checkbox" checked="">--%>
<%--                                                <label for="checkbox21">No</label>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                        <div class="col-sm-12 col-xl-6 m-b-30">--%>
<%--                                            <h3 class="sub-title">1. Do you like drawing or painting?</h3>--%>
<%--                                            <div class="checkbox-color checkbox-primary">--%>
<%--                                                <input id="checkbox25" type="checkbox" checked="">--%>
<%--                                                <label for="checkbox25">Yes</label>--%>
<%--                                            </div>--%>
<%--                                            <br>--%>
<%--                                            <div class="checkbox-color checkbox-success">--%>
<%--                                                <input id="checkbox35" type="checkbox" checked="">--%>
<%--                                                <label for="checkbox35">No</label>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                        <div class="col-sm-12 col-xl-6 m-b-30">--%>
<%--                                            <h3 class="sub-title">1. Do you like drawing or painting?</h3>--%>
<%--                                            <div class="checkbox-color checkbox-primary">--%>
<%--                                                <input id="checkbox30" type="checkbox" checked="">--%>
<%--                                                <label for="checkbox30">Yes</label>--%>
<%--                                            </div>--%>
<%--                                            <br>--%>
<%--                                            <div class="checkbox-color checkbox-success">--%>
<%--                                                <input id="checkbox40" type="checkbox" checked="">--%>
<%--                                                <label for="checkbox40">No</label>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                        <div class="col-sm-12 col-xl-6 m-b-30">--%>
<%--                                            <h3 class="sub-title">1. Do you like drawing or painting?</h3>--%>
<%--                                            <div class="checkbox-color checkbox-primary">--%>
<%--                                                <input id="checkbox50" type="checkbox" checked="">--%>
<%--                                                <label for="checkbox50">Yes</label>--%>
<%--                                            </div>--%>
<%--                                            <br>--%>
<%--                                            <div class="checkbox-color checkbox-success">--%>
<%--                                                <input id="checkbox55" type="checkbox" checked="">--%>
<%--                                                <label for="checkbox55">No</label>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
                                        <form id="survey-form" action="/my-handling-form-page" method="post">
                                            <h1 id="title">Application for permission to date my daughter</h1>
                                            <p id="description"><b>Note:</b> Form is to be completed at least 21 days prior to date</p>

                                            <!-- ------------------Personal Details---------------------------- -->
                                            <fieldset>
                                                <!-- groups of widgets that share the same purpose, for styling and semantic purposes -->
                                                <legend>Personal Details</legend>
                                                <!-- formally describes the purpose of the fieldset it is included inside. -->
                                                <div>
                                                    <label id="name-label" for="name">Name:</label>
                                                    <input type="text" required id="name" name="user_name" placeholder="Enter name here">   </div>
                                                <div>
                                                    <label for="address-label">Address:</label>
                                                    <input type="Address" id="address" name="Address" placeholder="Enter address here">   </div>
                                                <div>
                                                    <label id="email-label" for="Email">Email:</label>
                                                    <input type="email" required id="email" name="user_email" placeholder="Enter email here">   </div>
                                                <div>
                                                    <label id="number-label" for="phone">Phone Number:</label>
                                                    <input type="number" id="number" name="user_name" placeholder="Enter 10 digit number" min="1" max="9">  </div>
                                                <div>
                                                    <label id="iq-label" for="iq">IQ:</label>
                                                    <input type="number" id="iq" name="iq" placeholder="Enter IQ here">   </div>

                                                <!-- ------------------Radio Buttons-------------------------------- -->
                                                <div>
                                                    <label for="Gender">Gender</label>
                                                    <p>
                                                        <input type="radio" name="gender" value="male" checked> Male<br>
                                                        <input type="radio" name="gender" value="female"> Female<br>
                                                        <input type="radio" name="gender" value="other"> Other
                                                    </p>
                                                </div>
                                                <label for="date-label">Date of Proposed Outing:</label>
                                                <input type="date" name="bday">

                                            </fieldset>
                                            <!-- ------------------Checkboxes-------------------------------- -->
                                            <fieldset>
                                                <label for="Gender">Check All That Apply</label>
                                                <p>
                                                    <input type="checkbox" name="tattoo" value="tattoo"> I have tattoos and/or piercings<br>
                                                    <input type="checkbox" name="age" value="Car"> I am more than 2 years older than my daughter<br>
                                                    <input type="checkbox" name="car" value="car"> I own a panel van or V8 ute<br>
                                                    <input type="checkbox" name="work" value="work" checked> I work full-time<br>
                                                    <input type="checkbox" name="rich" value="rich" checked> My parents are rich<br>
                                                    <input type="checkbox" name="loc" value="loc" checked> Is the date at a well lit public location<br>
                                                </p>
                                            </fieldset>

                                            <!-- -----------------Dropdown menus--------------------------------- -->

                                            <fieldset>
                                                <div>
                                                    <label for="politics">Political Persuasion:</label>
                                                    <select id="dropdown">
                                                        <option value="left">Left Wing</option>
                                                        <option value="right">Right Wing</option>
                                                        <option value="conservative">Conservative</option>
                                                        <option value="nazi">Nazi</option>
                                                    </select>

                                                    <label for="politics">Education Level Completed:</label>
                                                    <select id="dropdown2">
                                                        <option value="University">University</option>
                                                        <option value="College">College</option>
                                                        <option value="Secondary">High School</option>
                                                        <option value="None">None</option>
                                                    </select>
                                                </div>
                                            </fieldset>

                                            <!-- --------------------Text Areas------------------------------ -->

                                            <fieldset>
                                                <legend>Essay Section</legend>
                                                <div>
                                                    <label for="msg"></label>
                                                    <p> In 50 words or more explain why you want to date my daughter</p>
                                                    <textarea id="msg" name="user_message" rows="4" cols="50" placeholder="Enter Text Here"></textarea>   </div>
                                                <div>
                                                    <label for="msg">Please upload contact details for 2 references</label><br>
                                                    <textarea id="msg2" name="user_message" rows="4" cols="50" placeholder="Enter Text Here"></textarea>   </div>
                                                <p>Upload Police Clearance Certificate, Bank Statement and Medical Certifiates here:
                                                    <button>Attach Files</button></p>
                                            </fieldset>

                                            <div id="submitbutton">
                                                <button type="submit" id="submit">Send your application</button>   </div>

                                        </form>
                                    </div>
                                    <div class="col-lg-3 nextButtonDiv">
                                        <input class="nextButton" type="image"
                                               src="./resources/img/next-button.png" alt="Submit"
                                               width="100" height="100"
                                               onclick="nextToPurplePlanet()">
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
    function backToDashboard() {
        location.replace("./dashboard");
    }

    function nextToPurplePlanet() {
        location.replace("./dashboard");
    }
</script>