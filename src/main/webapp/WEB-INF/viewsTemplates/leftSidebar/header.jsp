<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<header>
    <nav class="navbar header-navbar pcoded-header">
        <div class="navbar-wrapper">
            <div class="navbar-logo">
                <a href="${pageContext.request.contextPath}"><img class="img-fluid" src="${pageContext.request.contextPath}/resources/img/dashboard/hypertech-logo.png" alt="Theme-Logo"></a>
            </div>
            <div class="navbar-container container-fluid">
                <ul class="nav-right">
                    <li class="header-notification">
                        <div class="dropdown-primary dropdown">
                            <div class="dropdown-toggle" onclick="redirectionToMap()">
                                <i class="feather icon-home"></i>
                            </div>
                        </div>
                    </li>
                    <li class="header-notification">
                        <div class="dropdown-primary dropdown">
                            <div class="dropdown-toggle">
                                <i class="full-screen feather icon-maximize"></i>
                            </div>
                        </div>
                    </li>
                    <li class="header-notification">
                        <div class="dropdown-primary dropdown">
                            <div class="dropdown-toggle" onclick="logout()">
                                <a>Logout</a>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</header>

<script>
    function redirectionToMap() {
        location.replace("./dashboard");
    }
    function logout() {
        location.replace("./logout");
    }
</script>