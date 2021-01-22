<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<style>

    .startGame {
        text-align: center;
    }

    .pcoded-main-container{
        background: url(./resources/img/space-rocker-background.jpg) no-repeat center center fixed;
        -webkit-background-size: cover;
        -moz-background-size: cover;
        -o-background-size: cover;
        background-size: cover;
        height: auto;
        max-width: 100%;
    }

    .student-inputs label {
        font-size: 20px;
        font-family: Comic Sans MS, Comic Sans, cursive;
        color: black;
    }

    .student-inputs ::placeholder {
        font-size: 17px;
        font-family: Comic Sans MS, Comic Sans, cursive;
        color: black;
        font-weight: bold;
    }

    .personalInfoCard h3 {
        font-family: Comic Sans MS, Comic Sans, cursive;
        font-weight: bold;
        color: black;
    }

    .student-inputs input {
        border: 5px solid;
        border-radius: 10px;
    }

    .welcomeCard h3 {
        font-family: Comic Sans MS, Comic Sans, cursive;
        font-weight: bold;
        color: black;
    }

    .welcomeCard {
        opacity: 0.8;
    }

    .personalInfoCard {
        opacity: 0.8
    }

    .pcoded .pcoded-header[header-theme=theme6] {
        background: #133a47;
    }

    .header-navbar .navbar-wrapper .navbar-logo[logo-theme=theme6] {
        background: #133a47;
    }

    html, body {
        height: 100%;
    }

    .wrap {
        height: 100%;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .button {
        min-width: 300px;
        min-height: 60px;
        font-family: 'Nunito', sans-serif;
        font-size: 22px;
        text-transform: uppercase;
        letter-spacing: 1.3px;
        font-weight: 700;
        color: #313133;
        background: #4FD1C5;
        background: linear-gradient(90deg, rgba(129,230,217,1) 0%, rgba(79,209,197,1) 100%);
        border: none;
        border-radius: 1000px;
        box-shadow: 12px 12px 24px rgba(79,209,197,.64);
        transition: all 0.3s ease-in-out 0s;
        cursor: pointer;
        outline: none;
        position: relative;
        padding: 10px;
    }

    button::before {
        content: '';
        border-radius: 1000px;
        min-width: calc(300px + 12px);
        min-height: calc(60px + 12px);
        border: 6px solid #00FFCB;
        box-shadow: 0 0 60px rgba(0,255,203,.64);
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        opacity: 0;
        transition: all .3s ease-in-out 0s;
    }

    .button:hover, .button:focus {
        color: #313133;
        transform: translateY(-6px);
    }

    button:hover::before, button:focus::before {
        opacity: 1;
    }

    button::after {
        content: '';
        width: 30px; height: 30px;
        border-radius: 100%;
        border: 6px solid #00FFCB;
        position: absolute;
        z-index: -1;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        animation: ring 1.5s infinite;
    }

    button:hover::after, button:focus::after {
        animation: none;
        display: none;
    }

    @keyframes ring {
        0% {
            width: 30px;
            height: 30px;
            opacity: 1;
        }
        100% {
            width: 300px;
            height: 300px;
            opacity: 0;
        }
    }

    body {
        overflow-y: hidden;
    }

    .button:focus {
        outline: 0;
    }

</style>

    <div class="pcoded-container navbar-wrapper">
        <div class="pcoded-main-container">
            <div class="pcoded-wrapper">
                <div class="pcoded-content">
                    <div class="page-header card"></div>
                    <div class="pcoded-inner-content">
                        <div class="main-body">
                            <div class="page-wrapper">
                                <div class="page-body">
                                        <div class="row">
                                            <div class="col-xs-12 col-md-4 col-lg-4 col-xl-4">
                                                <div class="card welcomeCard">
                                                    <div class="card-header">
                                                        <h3 class="card-title">Welcome <c:out value="${studentFirstName}"/> <c:out value="${studentLastName}"/></h3>
                                                    </div>
                                                    <div class="card-block" style="display: none">
                                                        <div class="row">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-xs-12 col-md-12 col-lg-12 col-xl-12">
                                                <div class="card personalInfoCard">
                                                    <div class="card-header">
                                                        <h3 class="card-title">Your Personal Information</h3>
                                                    </div>
                                                    <div class="card-block">
                                                        <div class="row">
                                                            <div class="col-sm-6 student-inputs">
                                                                <form>
                                                                    <div class="form-group">
                                                                        <label>Student Id</label>
                                                                        <input type="text"
                                                                               class="form-control form-control-success"
                                                                               disabled="true"
                                                                               placeholder="<c:out value="${studentId}"/>">
                                                                    </div>
                                                                    <div class="form-group row">
                                                                        <div class="col-sm-6">
                                                                            <label>Student Firstname</label>
                                                                            <input type="text"
                                                                                   class="form-control form-control-success"
                                                                                   disabled="true"
                                                                                   placeholder="<c:out value="${studentFirstName}"/>">
                                                                        </div>
                                                                        <div class="col-sm-6">
                                                                            <label>Student Lastname</label>
                                                                            <input type="text"
                                                                                   class="form-control form-control-success"
                                                                                   disabled="true"
                                                                                   placeholder="<c:out value="${studentLastName}"/>">
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group row">
                                                                        <div class="col-sm-6">
                                                                            <label>Student Username</label>
                                                                            <input type="text"
                                                                                   class="form-control form-control-success"
                                                                                   disabled="true"
                                                                                   placeholder="<c:out value="${studentUserName}"/>">
                                                                        </div>
                                                                        <div class="col-sm-6">
                                                                            <label>Student Email</label>
                                                                            <input type="text"
                                                                                   class="form-control form-control-success"
                                                                                   disabled="true"
                                                                                   placeholder="<c:out value="${studentEmail}"/>">
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group row">
                                                                        <div class="col-sm-6">
                                                                            <label>Student Age</label>
                                                                            <input type="text"
                                                                                   class="form-control form-control-success"
                                                                                   disabled="true"
                                                                                   placeholder="<c:out value="${studentAge}"/>">
                                                                        </div>
                                                                        <div class="col-sm-6">
                                                                            <label>Student Current School Name</label>
                                                                            <input type="text"
                                                                                   class="form-control form-control-success"
                                                                                   disabled="true"
                                                                                   placeholder="<c:out value="${studentSchoolName}"/>">
                                                                        </div>
                                                                    </div>
                                                                </form>
                                                            </div>
                                                            <div class="col-sm-6 startGame">
<%--                                                                <input class="startGameButton" type="image"--%>
<%--                                                                       src="./resources/img/start-game.png" alt="Submit"--%>
<%--                                                                       width="350" height="100"--%>
<%--                                                                       onclick="startingTheJourney()">--%>
                                                                <div class="wrap">
                                                                    <button class="button" onclick="startingTheJourney()">Start your Journey</button>
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
        </div>
    </div>

<script>
    function startingTheJourney() {
        location.replace("./dashboard");
    }
</script>