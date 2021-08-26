<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
    .navbar.bg-primary {
        background-color: #263644!important;
        box-shadow: none!important;
    }

    .navbar {
        margin-bottom: 0!important;
    }

    .navbar.bg-primary .dropdown-item:hover {
        background-color: #263644!important;
    }

    .fa-cog , .fa-power-off {
        color: white;
    }

    .logout-mobile {
        display: none;
    }

    @media screen and (max-width: 991px) and (min-width: 360px) {
        .logout-mobile {
            display: block!important;
            right: 15%;
            position: absolute;
        }
        .logout-desktop {
            display: none!important;
        }
    }
</style>

<%--<header>--%>
<%--    <nav class="navbar header-navbar pcoded-header">--%>
<%--        <div class="navbar-wrapper">--%>
<%--            <div class="navbar-logo">--%>
<%--&lt;%&ndash;                <a href="${pageContext.request.contextPath}"><img class="img-fluid" alt="Theme-Logo"></a>&ndash;%&gt;--%>
<%--            </div>--%>
<%--            <div class="navbar-container container-fluid">--%>
<%--                <ul class="nav-right">--%>
<%--&lt;%&ndash;                    <li class="header-notification">&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <div class="dropdown-primary dropdown">&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <div class="dropdown-toggle" onclick="redirectionToMap()">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <i class="feather icon-home"></i>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    </li>&ndash;%&gt;--%>
<%--                    <li class="header-notification">--%>
<%--                        <div class="dropdown-primary dropdown">--%>
<%--                            <div class="dropdown-toggle" onclick="usersProfile()">--%>
<%--                                <i class="fa fa-user"></i><a><c:out value="${studentUserName}"/></a>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </li>--%>
<%--                    <li class="header-notification">--%>
<%--                        <div class="dropdown-primary dropdown">--%>
<%--                            <div class="dropdown-toggle" onclick="logout()">--%>
<%--                                <a>Logout</a>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </li>--%>
<%--                </ul>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </nav>--%>
<%--</header>--%>

<%--<header>--%>
<%--<nav class="navbar navbar-expand-lg bg-primary">--%>
<%--    <div class="navbar-container container-fluid">--%>
<%--        <div class="navbar-translate navbar-logo">--%>
<%--&lt;%&ndash;            <a href="${pageContext.request.contextPath}" class="img-fluid" href="javascript:;"><img&ndash;%&gt;--%>
<%--&lt;%&ndash;                    class="img-fluid"&ndash;%&gt;--%>
<%--&lt;%&ndash;                    src="${pageContext.request.contextPath}/resources/img/dashboard/hypertech-logo.png"&ndash;%&gt;--%>
<%--&lt;%&ndash;                    alt="Theme-Logo"></a>&ndash;%&gt;--%>
<%--            <a class="logout-mobile nav-link" onclick="logout()" href="javascript:;">--%>
<%--                <i class="fa fa-power-off fa-2x"></i>--%>
<%--            </a>--%>
<%--            <button class="navbar-toggler" type="button" data-toggle="collapse" aria-expanded="false"--%>
<%--                    aria-label="Toggle navigation">--%>
<%--                <span class="sr-only">Toggle navigation</span>--%>
<%--                                    <span class="navbar-toggler-icon"></span>--%>
<%--                                    <span class="navbar-toggler-icon"></span>--%>
<%--                                    <span class="navbar-toggler-icon"></span>--%>
<%--                <i class="fa fa-cog fa-lg"></i>--%>
<%--            </button>--%>
<%--        </div>--%>
<%--        <div class="collapse navbar-collapse">--%>
<%--            <ul class="navbar-nav ml-auto nav-right">--%>
<%--                <li class=" nav-item">--%>
<%--                    <a href="javascript:;" onclick="redirectToDashboard()" class="nav-link">--%>
<%--                        <i class="fa fa-home fa-lg"></i>Home--%>
<%--                    </a>--%>
<%--                </li>--%>
<%--                <li class="nav-item dropdown">--%>
<%--                    <a class="nav-link" href="javascript:;">--%>
<%--                        <i class="fa fa-user fa-lg"></i>Hi <c:out--%>
<%--                            value="${studentFirstName}"/>--%>
<%--                    </a>--%>
<%--                </li>--%>
<%--                <li class="nav-item">--%>
<%--                    <a class="logout-desktop nav-link" onclick="logout()" href="javascript:;">--%>
<%--                        <i class="fa fa-sign-out fa-lg"></i>--%>
<%--                    </a>--%>
<%--                </li>--%>
<%--            </ul>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</nav>--%>

<%--</header>--%>


<script>
    function redirectionToMap() {
        location.replace("./userProfile");
    }
    function logout() {
        location.replace("./logout");
    }
    function usersProfile() {
        location.replace("./userProfile");
    }
</script>