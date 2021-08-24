<%--<!DOCTYPE html>--%>
<%--<html lang="en">--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <%--    <meta charset="utf-8">--%>
    <title>Technology Literacy</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="${pageContext.request.contextPath}/resources/js/jquery-2.2.4.min.js"></script>
<%--    <script src="${pageContext.request.contextPath}/resources/js/neonWizard/b4/jquery-3.3.1.min.js"></script>--%>
<%--    <script src="${pageContext.request.contextPath}/resources/js/neonWizard/b4/jquery.validate.min.js"></script>--%>
    <script src="${pageContext.request.contextPath}/resources/js/neonWizard/b4/bootstrap.min.js"></script>
<%--    <script src="${pageContext.request.contextPath}/resources/js/neonWizard/b4/conditionize.flexible.jquery.min.js"></script>--%>
    <script src="${pageContext.request.contextPath}/resources/js/neonWizard/b4/main.js"></script>
<%--    <script src="${pageContext.request.contextPath}/resources/js/neonWizard/b4/switch.js"></script>--%>
<%--    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>--%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/neonwizard/b4/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/neonwizard/b4/animate.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/neonwizard/b4/fontawesome-all.css">
<%--    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.css">--%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/neonwizard/b4/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
        <script src="${pageContext.request.contextPath}/resources/js/firstQuiz.js"></script>
<%--    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/colors/switch.css">--%>
    <!-- Color Alternatives -->
<%--    <link href="${pageContext.request.contextPath}/resources/css/colors/color-2.css" rel="alternate stylesheet" type="text/css" title="color-2">--%>
<%--    <link href="${pageContext.request.contextPath}/resources/css/colors/color-3.css" rel="alternate stylesheet" type="text/css" title="color-3">--%>
<%--    <link href="${pageContext.request.contextPath}/resources/css/colors/color-4.css" rel="alternate stylesheet" type="text/css" title="color-4">--%>
<%--    <link href="${pageContext.request.contextPath}/resources/css/colors/color-5.css" rel="alternate stylesheet" type="text/css" title="color-5">--%>
</head>

<style>
    @import url('https://rsms.me/inter/inter.css');
    :root {
        --color-light: white;
        --color-dark: #212121;
        --color-signal: #614cf9;
        --color-background: var(--color-light);
        --color-text: var(--color-dark);
        --color-accent: var(--color-signal);
        --size-bezel: 0.5rem;
        --size-radius: 4px;
        line-height: 1.4;
        font-family: 'Inter', sans-serif;
        font-size: calc(.6rem + .4vw);
        color: var(--color-text);
        background: var(--color-background);
        font-weight: 300;
        padding: 0 calc(var(--size-bezel) * 3);
    }
    h1, h2, h3 {
        font-weight: 900;
    }
    mark {
        background: var(--color-accent);
        color: var(--color-text);
        font-weight: bold;
        padding: 0 0.2em;
    }
    .card {
        background: var(--color-background);
        padding: calc(4 * var(--size-bezel));
        margin-top: calc(4 * var(--size-bezel));
        border-radius: var(--size-radius);
        border: 3px solid var(--color-shadow, currentColor);
        box-shadow: 0.5rem 0.5rem 0 var(--color-shadow, currentColor);
    }
    .card--inverted {
        --color-background: var(--color-dark);
        color: var(--color-light);
        --color-shadow: var(--color-accent);
    }
    .card--accent {
        --color-background: var(--color-signal);
        --color-accent: var(--color-light);
        color: var(--color-dark);
        font-size: 12px;
        font-weight: 400;
    }
    .card *:first-child {
        margin-top: 0;
    }
    .l-design-widht {
        max-width: 40rem;
        padding: 1rem;
    }
    .input {
        position: relative;
        width: 300px;
    }
    .input__label {
        position: absolute;
        left: 0;
        top: 0;
        padding: calc(var(--size-bezel) * 0.75) calc(var(--size-bezel) * .5);
        margin: calc(var(--size-bezel) * 0.75 + 3px) calc(var(--size-bezel) * .5);
        background: pink;
        white-space: nowrap;
        transform: translate(0, 0);
        transform-origin: 0 0;
        background: var(--color-background);
        transition: transform 120ms ease-in;
        font-weight: bold;
        line-height: 1.2;
    }
    .input__field {
        box-sizing: border-box;
        display: block;
        width: 100%;
        border: 3px solid currentColor;
        padding: calc(var(--size-bezel) * 1.5) var(--size-bezel);
        color: currentColor;
        background: transparent;
        border-radius: var(--size-radius);
    }
    .input__field:focus + .input__label, .input__field:not(:placeholder-shown) + .input__label {
        transform: translate(0.25rem, -65%) scale(0.8);
        color: var(--color-accent);
    }
    .button-group {
        margin-top: calc(var(--size-bezel) * 2.5);
    }
    button {
        color: currentColor;
        padding: var(--size-bezel) calc(var(--size-bezel) * 2);
        background: var(--color-accent);
        border: none;
        border-radius: var(--size-radius);
        font-weight: 900;
    }
    button[type=reset] {
        background: var(--color-background);
        font-weight: 200;
    }
    button + button {
        margin-left: calc(var(--size-bezel) * 2);
    }
    .icon {
        display: inline-block;
        width: 1em;
        height: 1em;
        margin-right: 0.5em;
    }
    .hidden {
        display: none;
    }







    @import url('https://fonts.googleapis.com/css?family=Lato');
    .ulGoal {
        list-style: none;
        margin: 0;
        padding: 0;
        overflow: auto;
    }

    .ulGoal li{
        color: #AAAAAA;
        display: block;
        position: relative;
        float: left;
        width: 100%;
        height: 100px;
        border-bottom: 1px solid #333;
    }

    .ulGoal li input[type=radio]{
        position: absolute;
        visibility: hidden;
    }

    .ulGoal li label{
        display: block;
        position: relative;
        font-weight: 600;
        font-size: 1.35em;
        padding: 25px 25px 25px 80px;
        margin: 10px auto;
        height: 30px;
        z-index: 9;
        color: black;
        cursor: pointer;
        -webkit-transition: all 0.25s linear;
    }

    .ulGoal li:hover label{
        color: #624cf9;
        /*font-size: 13px;*/
        font-weight: 600;
    }

    .ulGoal li .check{
        display: block;
        position: absolute;
        border: 5px solid #AAAAAA;
        border-radius: 100%;
        height: 25px;
        width: 25px;
        top: 30px;
        left: 20px;
        z-index: 5;
        transition: border .25s linear;
        -webkit-transition: border .25s linear;
    }

    .ulGoal li:hover .check {
        border: 5px solid #624cf9;
    }

    .ulGoal li .check::before {
        display: block;
        position: absolute;
        content: '';
        border-radius: 100%;
        height: 15px;
        width: 15px;
        top: 0px;
        left: 0px;
        margin: auto;
        transition: background 0.25s linear;
        -webkit-transition: background 0.25s linear;
    }

    input[type=radio]:checked ~ .check {
        border: 5px solid #624cf9;
    }

    input[type=radio]:checked ~ .check::before{
        background: #624cf9;
    }

    input[type=radio]:checked ~ label{
        color: #624cf9;
        font-weight: 600;
    }

    .step-box-content {
        background-color: #1d1d1d!important;
    }

    .step-box-content .step-box-text {
        color: #6b59d3;
    }
</style>

<body>
<%--<body class="dark-version">--%>

<!-- This code is use for color chooser, you can delete -->
<%--<div id="switch-color" class="color-switcher">--%>
<%--    <div class="open"><i class="fas fa-cog"></i></div>--%>
<%--    <h4>COLOR OPTION</h4>--%>
<%--    <ul>--%>
<%--        <li><a class="color-2" onclick="setActiveStyleSheet('color-2'); return false;" href="#"><i--%>
<%--                class="fas fa-cog"></i></a></li>--%>
<%--        <li><a class="color-3" onclick="setActiveStyleSheet('color-3'); return false;" href="#"><i--%>
<%--                class="fas fa-cog"></i></a></li>--%>
<%--        <li><a class="color-4" onclick="setActiveStyleSheet('color-4'); return false;" href="#"><i--%>
<%--                class="fas fa-cog"></i></a></li>--%>
<%--        <li><a class="color-5" onclick="setActiveStyleSheet('color-5'); return false;" href="#"><i--%>
<%--                class="fas fa-cog"></i></a></li>--%>
<%--    </ul>--%>
<%--</div>--%>
<div class="clearfix"></div>


<div class="wrapper">
    <div class="steps-area steps-area-fixed">
        <div class="image-holder">
            <img style="filter: grayscale(80%)" src="${pageContext.request.contextPath}/resources/img/bg.jpg" alt="">
        </div>
        <div class="steps clearfix">
            <ul class="tablist multisteps-form__progress">
                <li class="multisteps-form__progress-btn js-active current">
                    <span>1</span>
                </li>
                <li class="multisteps-form__progress-btn">
                    <span>2</span>
                </li>
                <li class="multisteps-form__progress-btn">
                    <span>3</span>
                </li>
                <li class="multisteps-form__progress-btn">
                    <span>4</span>
                </li>
                <li class="multisteps-form__progress-btn last">
                    <span>5</span>
                </li>
            </ul>
        </div>
    </div>
<%--    <form class="multisteps-form__form" style="display: block">--%>
    <form class="multisteps-form__form w-75 order-1" id="firstQuizForm" style="display: block">
        <div class="form-area position-relative">
            <!-- div 1 -->
            <div class="multisteps-form__panel js-active" data-animation="slideHorz">
                <div class="wizard-forms">
                    <div class="inner pb-100 clearfix">
                        <div class="form-content pera-content">
                            <div class="step-inner-content">
                                <span class="step-no">Step 1</span>
                                <%--                                <h2>What kind of Services You need?</h2>--%>
                                <h2>Which is your Gender ?</h2>
                                <p>Complete following questions in order to transform the application based on your
                                    selections</p>
                                <div class="step-box">
                                    <div class="row">
                                        <div class="col-md-4 genderDiv">
                                            <label class="genderMale step-box-content bg-white text-center relative-position active">
													<span class="step-box-icon">
														<img src="${pageContext.request.contextPath}/resources/img/male-memoji.png" alt="">
<%--														<img src="${pageContext.request.contextPath}/resources/img/giphy.gif" alt="">--%>
													</span>
                                                <span class="step-box-text">
														Male
													</span>
                                                <span class="service-check-option">
														<span><input type="radio" name="service_name"
                                                                     value="Corporate Services" checked></span>
													</span>
                                            </label>
                                        </div>
                                        <div class="col-md-4 genderDiv"> </div>
                                        <div class="col-md-4 genderDiv">
                                            <label class="genderFemale step-box-content bg-white text-center relative-position">
													<span class="step-box-icon">
														<img src="${pageContext.request.contextPath}/resources/img/female-memoji.png" alt="">
<%--														<img src="${pageContext.request.contextPath}/resources/img/source.gif" alt="">--%>
													</span>
                                                <span class="step-box-text">
														Female
													</span>
                                                <span class="service-check-option">
														<span><input type="radio" name="service_name"
                                                                     value="Development Services"></span>
													</span>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.inner -->
                    <div class="actions">
                        <ul>
                            <li class="disable" aria-disabled="true"><span class="js-btn-next" title="NEXT">Backward <i
                                    class="fa fa-arrow-right"></i></span></li>
                            <li><span class="js-btn-next" title="NEXT">NEXT <i class="fa fa-arrow-right"></i></span>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- div 2 -->
            <div class="multisteps-form__panel" data-animation="slideHorz">
                <div class="wizard-forms">
                    <div class="inner pb-100 clearfix">
                        <div class="form-content pera-content">
                            <div class="step-inner-content">
                                <span class="step-no bottom-line">Step 2</span>
                                <div class="step-progress float-right">
                                    <span>2 of 5 completed</span>
                                    <div class="step-progress-bar">
                                        <div class="progress">
                                            <div class="progress-bar" style="width:20%"></div>
                                        </div>
                                    </div>
                                </div>
                                <h2>From which country are you from?</h2>
                                <div class="step-box">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <label for="country">Country</label><span
                                                style="color: red !important; display: inline; float: none;">*</span>

                                            <select id="country" name="country" class="form-control">
                                                <option value="Afghanistan">Afghanistan</option>
                                                <option value="Åland Islands">Åland Islands</option>
                                                <option value="Albania">Albania</option>
                                                <option value="Algeria">Algeria</option>
                                                <option value="American Samoa">American Samoa</option>
                                                <option value="Andorra">Andorra</option>
                                                <option value="Angola">Angola</option>
                                                <option value="Anguilla">Anguilla</option>
                                                <option value="Antarctica">Antarctica</option>
                                                <option value="Antigua and Barbuda">Antigua and Barbuda</option>
                                                <option value="Argentina">Argentina</option>
                                                <option value="Armenia">Armenia</option>
                                                <option value="Aruba">Aruba</option>
                                                <option value="Australia">Australia</option>
                                                <option value="Austria">Austria</option>
                                                <option value="Azerbaijan">Azerbaijan</option>
                                                <option value="Bahamas">Bahamas</option>
                                                <option value="Bahrain">Bahrain</option>
                                                <option value="Bangladesh">Bangladesh</option>
                                                <option value="Barbados">Barbados</option>
                                                <option value="Belarus">Belarus</option>
                                                <option value="Belgium">Belgium</option>
                                                <option value="Belize">Belize</option>
                                                <option value="Benin">Benin</option>
                                                <option value="Bermuda">Bermuda</option>
                                                <option value="Bhutan">Bhutan</option>
                                                <option value="Bolivia">Bolivia</option>
                                                <option value="Bosnia and Herzegovina">Bosnia and Herzegovina</option>
                                                <option value="Botswana">Botswana</option>
                                                <option value="Bouvet Island">Bouvet Island</option>
                                                <option value="Brazil">Brazil</option>
                                                <option value="British Indian Ocean Territory">British Indian Ocean
                                                    Territory
                                                </option>
                                                <option value="Brunei Darussalam">Brunei Darussalam</option>
                                                <option value="Bulgaria">Bulgaria</option>
                                                <option value="Burkina Faso">Burkina Faso</option>
                                                <option value="Burundi">Burundi</option>
                                                <option value="Cambodia">Cambodia</option>
                                                <option value="Cameroon">Cameroon</option>
                                                <option value="Canada">Canada</option>
                                                <option value="Cape Verde">Cape Verde</option>
                                                <option value="Cayman Islands">Cayman Islands</option>
                                                <option value="Central African Republic">Central African Republic
                                                </option>
                                                <option value="Chad">Chad</option>
                                                <option value="Chile">Chile</option>
                                                <option value="China">China</option>
                                                <option value="Christmas Island">Christmas Island</option>
                                                <option value="Cocos (Keeling) Islands">Cocos (Keeling) Islands</option>
                                                <option value="Colombia">Colombia</option>
                                                <option value="Comoros">Comoros</option>
                                                <option value="Congo">Congo</option>
                                                <option value="Congo, The Democratic Republic of The">Congo, The
                                                    Democratic Republic of The
                                                </option>
                                                <option value="Cook Islands">Cook Islands</option>
                                                <option value="Costa Rica">Costa Rica</option>
                                                <option value="Cote D'ivoire">Cote D'ivoire</option>
                                                <option value="Croatia">Croatia</option>
                                                <option value="Cuba">Cuba</option>
                                                <option value="Cyprus">Cyprus</option>
                                                <option value="Czech Republic">Czech Republic</option>
                                                <option value="Denmark">Denmark</option>
                                                <option value="Djibouti">Djibouti</option>
                                                <option value="Dominica">Dominica</option>
                                                <option value="Dominican Republic">Dominican Republic</option>
                                                <option value="Ecuador">Ecuador</option>
                                                <option value="Egypt">Egypt</option>
                                                <option value="El Salvador">El Salvador</option>
                                                <option value="Equatorial Guinea">Equatorial Guinea</option>
                                                <option value="Eritrea">Eritrea</option>
                                                <option value="Estonia">Estonia</option>
                                                <option value="Ethiopia">Ethiopia</option>
                                                <option value="Falkland Islands (Malvinas)">Falkland Islands
                                                    (Malvinas)
                                                </option>
                                                <option value="Faroe Islands">Faroe Islands</option>
                                                <option value="Fiji">Fiji</option>
                                                <option value="Finland">Finland</option>
                                                <option value="France">France</option>
                                                <option value="French Guiana">French Guiana</option>
                                                <option value="French Polynesia">French Polynesia</option>
                                                <option value="French Southern Territories">French Southern
                                                    Territories
                                                </option>
                                                <option value="Gabon">Gabon</option>
                                                <option value="Gambia">Gambia</option>
                                                <option value="Georgia">Georgia</option>
                                                <option value="Germany">Germany</option>
                                                <option value="Ghana">Ghana</option>
                                                <option value="Gibraltar">Gibraltar</option>
                                                <option value="Greece">Greece</option>
                                                <option value="Greenland">Greenland</option>
                                                <option value="Grenada">Grenada</option>
                                                <option value="Guadeloupe">Guadeloupe</option>
                                                <option value="Guam">Guam</option>
                                                <option value="Guatemala">Guatemala</option>
                                                <option value="Guernsey">Guernsey</option>
                                                <option value="Guinea">Guinea</option>
                                                <option value="Guinea-bissau">Guinea-bissau</option>
                                                <option value="Guyana">Guyana</option>
                                                <option value="Haiti">Haiti</option>
                                                <option value="Heard Island and Mcdonald Islands">Heard Island and
                                                    Mcdonald Islands
                                                </option>
                                                <option value="Holy See (Vatican City State)">Holy See (Vatican City
                                                    State)
                                                </option>
                                                <option value="Honduras">Honduras</option>
                                                <option value="Hong Kong">Hong Kong</option>
                                                <option value="Hungary">Hungary</option>
                                                <option value="Iceland">Iceland</option>
                                                <option value="India">India</option>
                                                <option value="Indonesia">Indonesia</option>
                                                <option value="Iran, Islamic Republic of">Iran, Islamic Republic of
                                                </option>
                                                <option value="Iraq">Iraq</option>
                                                <option value="Ireland">Ireland</option>
                                                <option value="Isle of Man">Isle of Man</option>
                                                <option value="Israel">Israel</option>
                                                <option value="Italy">Italy</option>
                                                <option value="Jamaica">Jamaica</option>
                                                <option value="Japan">Japan</option>
                                                <option value="Jersey">Jersey</option>
                                                <option value="Jordan">Jordan</option>
                                                <option value="Kazakhstan">Kazakhstan</option>
                                                <option value="Kenya">Kenya</option>
                                                <option value="Kiribati">Kiribati</option>
                                                <option value="Korea, Democratic People's Republic of">Korea, Democratic
                                                    People's Republic of
                                                </option>
                                                <option value="Korea, Republic of">Korea, Republic of</option>
                                                <option value="Kuwait">Kuwait</option>
                                                <option value="Kyrgyzstan">Kyrgyzstan</option>
                                                <option value="Lao People's Democratic Republic">Lao People's Democratic
                                                    Republic
                                                </option>
                                                <option value="Latvia">Latvia</option>
                                                <option value="Lebanon">Lebanon</option>
                                                <option value="Lesotho">Lesotho</option>
                                                <option value="Liberia">Liberia</option>
                                                <option value="Libyan Arab Jamahiriya">Libyan Arab Jamahiriya</option>
                                                <option value="Liechtenstein">Liechtenstein</option>
                                                <option value="Lithuania">Lithuania</option>
                                                <option value="Luxembourg">Luxembourg</option>
                                                <option value="Macao">Macao</option>
                                                <option value="Macedonia, The Former Yugoslav Republic of">Macedonia,
                                                    The Former Yugoslav Republic of
                                                </option>
                                                <option value="Madagascar">Madagascar</option>
                                                <option value="Malawi">Malawi</option>
                                                <option value="Malaysia">Malaysia</option>
                                                <option value="Maldives">Maldives</option>
                                                <option value="Mali">Mali</option>
                                                <option value="Malta">Malta</option>
                                                <option value="Marshall Islands">Marshall Islands</option>
                                                <option value="Martinique">Martinique</option>
                                                <option value="Mauritania">Mauritania</option>
                                                <option value="Mauritius">Mauritius</option>
                                                <option value="Mayotte">Mayotte</option>
                                                <option value="Mexico">Mexico</option>
                                                <option value="Micronesia, Federated States of">Micronesia, Federated
                                                    States of
                                                </option>
                                                <option value="Moldova, Republic of">Moldova, Republic of</option>
                                                <option value="Monaco">Monaco</option>
                                                <option value="Mongolia">Mongolia</option>
                                                <option value="Montenegro">Montenegro</option>
                                                <option value="Montserrat">Montserrat</option>
                                                <option value="Morocco">Morocco</option>
                                                <option value="Mozambique">Mozambique</option>
                                                <option value="Myanmar">Myanmar</option>
                                                <option value="Namibia">Namibia</option>
                                                <option value="Nauru">Nauru</option>
                                                <option value="Nepal">Nepal</option>
                                                <option value="Netherlands">Netherlands</option>
                                                <option value="Netherlands Antilles">Netherlands Antilles</option>
                                                <option value="New Caledonia">New Caledonia</option>
                                                <option value="New Zealand">New Zealand</option>
                                                <option value="Nicaragua">Nicaragua</option>
                                                <option value="Niger">Niger</option>
                                                <option value="Nigeria">Nigeria</option>
                                                <option value="Niue">Niue</option>
                                                <option value="Norfolk Island">Norfolk Island</option>
                                                <option value="Northern Mariana Islands">Northern Mariana Islands
                                                </option>
                                                <option value="Norway">Norway</option>
                                                <option value="Oman">Oman</option>
                                                <option value="Pakistan">Pakistan</option>
                                                <option value="Palau">Palau</option>
                                                <option value="Palestinian Territory, Occupied">Palestinian Territory,
                                                    Occupied
                                                </option>
                                                <option value="Panama">Panama</option>
                                                <option value="Papua New Guinea">Papua New Guinea</option>
                                                <option value="Paraguay">Paraguay</option>
                                                <option value="Peru">Peru</option>
                                                <option value="Philippines">Philippines</option>
                                                <option value="Pitcairn">Pitcairn</option>
                                                <option value="Poland">Poland</option>
                                                <option value="Portugal">Portugal</option>
                                                <option value="Puerto Rico">Puerto Rico</option>
                                                <option value="Qatar">Qatar</option>
                                                <option value="Reunion">Reunion</option>
                                                <option value="Romania">Romania</option>
                                                <option value="Russian Federation">Russian Federation</option>
                                                <option value="Rwanda">Rwanda</option>
                                                <option value="Saint Helena">Saint Helena</option>
                                                <option value="Saint Kitts and Nevis">Saint Kitts and Nevis</option>
                                                <option value="Saint Lucia">Saint Lucia</option>
                                                <option value="Saint Pierre and Miquelon">Saint Pierre and Miquelon
                                                </option>
                                                <option value="Saint Vincent and The Grenadines">Saint Vincent and The
                                                    Grenadines
                                                </option>
                                                <option value="Samoa">Samoa</option>
                                                <option value="San Marino">San Marino</option>
                                                <option value="Sao Tome and Principe">Sao Tome and Principe</option>
                                                <option value="Saudi Arabia">Saudi Arabia</option>
                                                <option value="Senegal">Senegal</option>
                                                <option value="Serbia">Serbia</option>
                                                <option value="Seychelles">Seychelles</option>
                                                <option value="Sierra Leone">Sierra Leone</option>
                                                <option value="Singapore">Singapore</option>
                                                <option value="Slovakia">Slovakia</option>
                                                <option value="Slovenia">Slovenia</option>
                                                <option value="Solomon Islands">Solomon Islands</option>
                                                <option value="Somalia">Somalia</option>
                                                <option value="South Africa">South Africa</option>
                                                <option value="South Georgia and The South Sandwich Islands">South
                                                    Georgia and The South Sandwich Islands
                                                </option>
                                                <option value="Spain">Spain</option>
                                                <option value="Sri Lanka">Sri Lanka</option>
                                                <option value="Sudan">Sudan</option>
                                                <option value="Suriname">Suriname</option>
                                                <option value="Svalbard and Jan Mayen">Svalbard and Jan Mayen</option>
                                                <option value="Swaziland">Swaziland</option>
                                                <option value="Sweden">Sweden</option>
                                                <option value="Switzerland">Switzerland</option>
                                                <option value="Syrian Arab Republic">Syrian Arab Republic</option>
                                                <option value="Taiwan, Province of China">Taiwan, Province of China
                                                </option>
                                                <option value="Tajikistan">Tajikistan</option>
                                                <option value="Tanzania, United Republic of">Tanzania, United Republic
                                                    of
                                                </option>
                                                <option value="Thailand">Thailand</option>
                                                <option value="Timor-leste">Timor-leste</option>
                                                <option value="Togo">Togo</option>
                                                <option value="Tokelau">Tokelau</option>
                                                <option value="Tonga">Tonga</option>
                                                <option value="Trinidad and Tobago">Trinidad and Tobago</option>
                                                <option value="Tunisia">Tunisia</option>
                                                <option value="Turkey">Turkey</option>
                                                <option value="Turkmenistan">Turkmenistan</option>
                                                <option value="Turks and Caicos Islands">Turks and Caicos Islands
                                                </option>
                                                <option value="Tuvalu">Tuvalu</option>
                                                <option value="Uganda">Uganda</option>
                                                <option value="Ukraine">Ukraine</option>
                                                <option value="United Arab Emirates">United Arab Emirates</option>
                                                <option value="United Kingdom">United Kingdom</option>
                                                <option value="United States">United States</option>
                                                <option value="United States Minor Outlying Islands">United States Minor
                                                    Outlying Islands
                                                </option>
                                                <option value="Uruguay">Uruguay</option>
                                                <option value="Uzbekistan">Uzbekistan</option>
                                                <option value="Vanuatu">Vanuatu</option>
                                                <option value="Venezuela">Venezuela</option>
                                                <option value="Viet Nam">Viet Nam</option>
                                                <option value="Virgin Islands, British">Virgin Islands, British</option>
                                                <option value="Virgin Islands, U.S.">Virgin Islands, U.S.</option>
                                                <option value="Wallis and Futuna">Wallis and Futuna</option>
                                                <option value="Western Sahara">Western Sahara</option>
                                                <option value="Yemen">Yemen</option>
                                                <option value="Zambia">Zambia</option>
                                                <option value="Zimbabwe">Zimbabwe</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.inner -->
                <div class="actions">
                    <ul>
                        <li><span class="js-btn-prev" title="BACK"><i class="fa fa-arrow-left"></i> BACK </span></li>
                        <li><span class="js-btn-next" title="NEXT">NEXT <i class="fa fa-arrow-right"></i></span></li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- div 3 -->
        <div class="multisteps-form__panel" data-animation="slideHorz">
            <div class="wizard-forms">
                <div class="inner pb-100 clearfix">
                    <div class="form-content pera-content">
                        <div class="step-inner-content">
                            <span class="step-no bottom-line">Step 3</span>
                            <div class="step-progress float-right">
                                <span>3 of 5 completed</span>
                                <div class="step-progress-bar">
                                    <div class="progress">
                                        <div class="progress-bar" style="width:40%"></div>
                                    </div>
                                </div>
                            </div>
                            <h2>How old are you ? <br></h2>
                            <p> The application needs your age in order to make your profile properly. </p>
                            <div class="form-inner-area">
                                <input id="intLimitTextBox" type="number" class="form-control" minlength="1" maxlength="2" placeholder="Your Age ">
                            </div>
                        </div>
                    </div>
                </div>
                <!-- ./inner -->
                <div class="actions">
                    <ul>
                        <li><span class="js-btn-prev" title="BACK"><i class="fa fa-arrow-left"></i> BACK </span></li>
                        <li><span class="js-btn-next" title="NEXT">NEXT <i class="fa fa-arrow-right"></i></span></li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- div 4 -->
        <div class="multisteps-form__panel" data-animation="slideHorz">
            <div class="wizard-forms">
                <div class="inner pb-100 clearfix">
                    <div class="form-content pera-content">
                        <div class="step-inner-content">
                            <span class="step-no bottom-line">Step 4</span>
                            <div class="step-progress float-right">
                                <span>4 of 5 completed</span>
                                <div class="step-progress-bar">
                                    <div class="progress">
                                        <div class="progress-bar" style="width:70%"></div>
                                    </div>
                                </div>
                            </div>
                            <h2>What's your name</h2>
                            <p>The application needs your name in order to call you with it.</p>
                            <div class="form-inner-area">
                                <input id="intLimitTextBox2" type="text" name="full_name" class="form-control" maxlength="50" placeholder="First and last name *">
<%--                                <input type="text" name="phone" placeholder="Phone">--%>
                            </div>
<%--                            <div class="step-content-area">--%>
<%--                                <label class="input">--%>
<%--                                    <input id="intLimitTextBox2" class="input__field" type="text" required placeholder=" " >--%>
<%--                                    <span class="input__label">Enter your name </span>--%>
<%--                                </label>--%>
<%--                            </div>--%>
                        </div>
                    </div>
                </div>
                <!-- /.inner -->
                <div class="actions">
                    <ul>
                        <li><span class="js-btn-prev" title="BACK"><i class="fa fa-arrow-left"></i> BACK </span></li>
                        <li><span class="js-btn-next" title="NEXT">NEXT <i class="fa fa-arrow-right"></i></span></li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- div 5 -->
        <div class="multisteps-form__panel" data-animation="slideHorz">
            <div class="wizard-forms">
                <div class="inner pb-100 clearfix">
                    <div class="form-content pera-content">
                        <div class="step-inner-content">
                            <span class="step-no bottom-line">Step 5</span>
                            <div class="step-progress float-right">
                                <span>5 of 5 completed</span>
                                <div class="step-progress-bar">
                                    <div class="progress">
                                        <div class="progress-bar" style="width:100%"></div>
                                    </div>
                                </div>
                            </div>
                            <h2>Please, choose your daily goal</h2>
                            <p> Try to complete your daily goal in order to earn an achievement.
                            </p>
                            <div class="step-content-field">
                                <ul id="ulStudentGoal" class="ulGoal">
                                    <li class="liGoal">
                                        <input onclick="takeStudentSelectedGoal(this.id, this.value)" value="Flaccid" class="inputGoal" type="radio" id="f-option" name="selector">
                                        <label class="goalValue" for="f-option">Flaccid 5 minutes / day</label>

                                        <div class="check"></div>
                                    </li>

                                    <li class="liGoal">
                                        <input onclick="takeStudentSelectedGoal(this.id, this.value)" value="Ceremonious" class="inputGoal" type="radio" id="s-option" name="selector">
                                        <label class="goalValue" for="s-option">Ceremonious 10 minutes / day</label>

                                        <div class="check"><div class="inside"></div></div>
                                    </li>

                                    <li class="liGoal">
                                        <input onclick="takeStudentSelectedGoal(this.id, this.value)" value="Grave" class="inputGoal" type="radio" id="t-option" name="selector">
                                        <label class="goalValue" for="t-option">Grave  15 minutes / day</label>

                                        <div class="check"><div class="inside"></div></div>
                                    </li>

                                    <li class="liGoal">
                                        <input onclick="takeStudentSelectedGoal(this.id, this.value)" value="Intensive" class="inputGoal" type="radio" id="r-option" name="selector">
                                        <label class="goalValue" for="r-option">Intensive 20 minutes / day</label>

                                        <div class="check"><div class="inside"></div></div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.inner -->
                <div class="actions mt-60">
<%--                    <ul>--%>
<%--                        <li><span class="js-btn-prev" title="BACK"><i class="fa fa-arrow-left"></i> BACK </span></li>--%>
<%--                        <li>--%>
<%--                            <button onclick="goToDashboard()" title="NEXT">SUBMIT <i class="fa fa-arrow-right"></i></button>--%>
<%--                        </li>--%>
<%--                    </ul>--%>
                    <ul>
                        <li><span class="js-btn-prev" title="BACK"><i class="fa fa-arrow-left"></i> BACK </span>
                        </li>
                        <li>
                            <button onclick="goToDashboard()" title="NEXT">SUBMIT <i class="fa fa-arrow-right"></i></button>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
</form>
</div>


<script>
    // $("#files").change(function () {
    //     filename = this.files[0].name
    //     // console.log(filename);
    // });

    // function UploadFile() {
    //     var reader = new FileReader();
    //     var file = document.getElementById('attach').files[0];
    //     reader.onload = function () {
    //         document.getElementById('fileContent').value = reader.result;
    //         document.getElementById('filename').value = file.name;
    //         document.getElementById('wizard').submit();
    //     }
    //     reader.readAsDataURL(file);
    // }

    // $(document).ready(function () {
    //     $('.conditional').conditionize();
    // });
    //
    // var _gaq = _gaq || [];
    // _gaq.push(['_setAccount', 'UA-36251023-1']);
    // _gaq.push(['_setDomainName', 'jqueryscript.net']);
    // _gaq.push(['_trackPageview']);

    // (function () {
    //     var ga = document.createElement('script');
    //     ga.type = 'text/javascript';
    //     ga.async = true;
    //     ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    //     var s = document.getElementsByTagName('script')[0];
    //     s.parentNode.insertBefore(ga, s);
    // })();

    // $("#country_selector").countrySelect({
    //     // defaultCountry: "jp",
    //     // onlyCountries: ['us', 'gb', 'ch', 'ca', 'do'],
    //     // responsiveDropdown: true,
    //     preferredCountries: ['ca', 'gb', 'us']
    // });

    <%--let timer;--%>

    <%--document.addEventListener('input', e => {--%>
    <%--    const el = e.target;--%>

    <%--    if( el.matches('[data-color]') ) {--%>
    <%--        clearTimeout(timer);--%>
    <%--        timer = setTimeout(() => {--%>
    <%--            document.documentElement.style.setProperty(`--color-${el.dataset.color}`, el.value);--%>
    <%--        }, 100)--%>
    <%--    }--%>
    <%--})--%>


</script>
</body>

<%--</html>--%>